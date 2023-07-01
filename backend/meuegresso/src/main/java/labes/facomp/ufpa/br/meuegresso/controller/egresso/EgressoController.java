package labes.facomp.ufpa.br.meuegresso.controller.egresso;

import java.io.IOException;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoCadastroDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoPublicDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.enumeration.UsuarioStatus;
import labes.facomp.ufpa.br.meuegresso.exceptions.MatriculaAlreadyExistsException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AreaAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;
import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.StatusUsuarioModel;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.service.areaatuacao.AreaAtuacaoService;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.curso.CursoService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import labes.facomp.ufpa.br.meuegresso.service.empresa.EmpresaService;
import labes.facomp.ufpa.br.meuegresso.service.endereco.EnderecoService;
import labes.facomp.ufpa.br.meuegresso.service.setoratuacao.SetorAtuacaoService;
import labes.facomp.ufpa.br.meuegresso.service.statususuario.StatusUsuarioService;
import labes.facomp.ufpa.br.meuegresso.service.titulacao.TitulacaoService;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para criar um novo Egresso.
 *
 * @author João Paulo
 * @since 16/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/egresso")
public class EgressoController {

    private final ModelMapper mapper;

    private final JwtService jwtService;

    private final CursoService cursoService;

    private final EgressoService egressoService;

    private final UsuarioService usuarioService;

    private final EmpresaService empresaService;

    private final EnderecoService enderecoService;

    private final TitulacaoService titulacaoService;

    private final AreaAtuacaoService areaAtuacaoService;

    private final SetorAtuacaoService setorAtuacaoService;

    private final StatusUsuarioService statusUsuarioService;


    /**
     * Endpoint responsavel por cadastrar o egresso.
     *
     * @param egressoCadastroDTO,token Estruturas de dados contendo as informações
     *                                 necessárias para
     *                                 salvar o egresso.
     * @return {@link String} Uma string representando uma mensagem de êxito
     *         indicando que o egresso
     *         foi salvo.
     * @author João Paulo, Alfredo Gabriel, Marcus Maciel
     * @since 16/04/2023
     */
    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public ResponseEntity<String> cadastrarEgressoPrimeiroCadastro(
            @RequestBody @Valid EgressoCadastroDTO egressoCadastroDTO,
            JwtAuthenticationToken token) throws MatriculaAlreadyExistsException {
        if (egressoCadastroDTO.getMatricula() != null
                && egressoService.existsMatricula(egressoCadastroDTO.getMatricula())) {
            throw new MatriculaAlreadyExistsException(
                    String.format(ErrorType.REPORT_007.getMessage(), egressoCadastroDTO.getMatricula()),
                    ErrorType.REPORT_007.getInternalCode());
        }

        mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STANDARD);

        EgressoModel egressoModel = mapper.map(egressoCadastroDTO, EgressoModel.class);

        validaAdicionais(egressoModel);
        if (!validaCarreiraLocalizacao(egressoModel)) {
            return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY)
                    .body(ResponseType.FAIL_SAVE.getMessage());
        }
        if (!validaCursoPos(egressoModel, egressoCadastroDTO)) {
            return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY)
                    .body(ResponseType.FAIL_SAVE.getMessage());
        }

        egressoModel.setUsuario(usuarioService.findById(jwtService.getIdUsuario(token)));
        egressoModel.getUsuario().setNome(egressoCadastroDTO.getNome());
        egressoModel.getUsuario().setAtivo(egressoModel.getUsuario().isEnabled());

        egressoService.save(egressoModel);
        egressoModel.getUsuario().setAtivo(egressoModel.getUsuario().getValido());
        statusUsuarioService
                .save(StatusUsuarioModel.builder().usuarioId(egressoModel.getUsuario().getId())
                        .nome(egressoModel.getUsuario().getNome()).status(UsuarioStatus.PENDENTE)
                        .build());

        return ResponseEntity.status(HttpStatus.CREATED).body(ResponseType.SUCCESS_SAVE.getMessage());
    }

    /**
     * Endpoint responsavel por buscar o egresso.
     *
     * @param token Estrutura de dados contendo as informações necessárias para
     *              buscar o egresso.
     * @return {@link EgressoDTO} Dados retornados do banco.
     * @author Pedro Inácio, João Paulo, Alfredo Gabriel, Camilo Santos
     * @since 11/05/2023
     */
    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public EgressoDTO getEgresso(JwtAuthenticationToken token) {
        mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STANDARD);

        EgressoModel egressoModel = egressoService.findByUsuarioId(jwtService.getIdUsuario(token));
        return mapper.map(egressoModel, EgressoDTO.class);
    }

    /**
     * Endpoint responsavel por atualizar o egresso.
     *
     * @param egresso Estrutura de dados contendo as informações necessárias para
     *                persistir o Usuário.
     * @return {@link EgressoModel} Dados gravados no banco com a Id atualizada.
     * @author Alfredo Gabriel, Pedro Inácio, Marcus Maciel
     * @throws UnauthorizedRequestException
     * @since 16/04/2023
     */
    @PutMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public ResponseEntity<String> atualizarEgresso(
            @RequestBody EgressoDTO egresso, JwtAuthenticationToken token)
            throws MatriculaAlreadyExistsException {

        // Se a matricula passada for diferente da matricula que a pessoa já tinha,
        // checar se é duplicado.
        if (egresso.getMatricula() != null
                && !egresso.getMatricula().equals(egressoService.findById(egresso.getId()).getMatricula())
                && egressoService.existsMatricula(egresso.getMatricula())) {
            throw new MatriculaAlreadyExistsException(
                    String.format(ErrorType.REPORT_007.getMessage(), egresso.getMatricula()),
                    ErrorType.REPORT_007.getInternalCode());
        }

        if (egressoService.existsByIdAndCreatedBy(egresso.getId(), jwtService.getIdUsuario(token))) {

            mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
            EgressoModel egressoModel = mapper.map(egresso, EgressoModel.class);

            validaAdicionais(egressoModel);
            if (!validaCarreiraLocalizacao(egressoModel)) {
                return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY)
                        .body(ResponseType.FAIL_UPDATE.getMessage());
            }
            if (!validaCursoPos(egressoModel)) {
                return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY)
                        .body(ResponseType.FAIL_UPDATE.getMessage());
            }

            egressoModel.getUsuario()
                    .setPassword(usuarioService.findById(jwtService.getIdUsuario(token)).getPassword());
            egressoService.update(egressoModel);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(ResponseType.EGRESSO_NAO_ENCONTRADO.getMessage());
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(ResponseType.SUCCESS_UPDATE.getMessage());
    }

    /**
     * Endpoint responsavel por deletar o egresso.
     *
     * @param egressoPublicDTO Estrutura de dados contendo as informações
     *                         necessárias para deletar o egresso.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki, Marcus Maciel Oliveira
     * @since 05/06/2023
     */
    @DeleteMapping
    @PreAuthorize("hasRole('ADMIN')")
    @ResponseStatus(code = HttpStatus.OK)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String deletarEgresso(@RequestBody @Valid EgressoPublicDTO egressoPublicDTO) {
        EgressoModel egressoModel = mapper.map(egressoPublicDTO, EgressoModel.class);
        if (egressoService.existsById(egressoModel.getId())) {
            egressoService.deleteById(egressoModel.getId());
            return ResponseType.SUCCESS_DELETE.getMessage();
        }
        return ResponseType.FAIL_DELETE.getMessage();
    }

    /**
     * Endpoint responsável pela deleção local do arquivo da foto do egresso
     *
     * @author Camilo Santos, Eude Monteiro
     * @since 11/05/2023
     * @param token
     * @return Uma string representando uma mensagem de êxito indicando que a foto
     *         foi deletada.
     * @throws IOException
     */
    @ResponseStatus(code = HttpStatus.OK)
    @DeleteMapping(value = "/foto")
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public ResponseEntity<String> deleteFotoEgresso(JwtAuthenticationToken token) throws IOException {
        EgressoModel egressoModel = egressoService.findByUsuarioId(jwtService.getIdUsuario(token));
        if (egressoModel.getFotoNome() != null) {
            egressoService.deleteFile(egressoModel.getFotoNome());
            egressoModel.setFotoNome(null);
            egressoService.update(egressoModel);
            return ResponseEntity.ok(ResponseType.SUCCESS_IMAGE_DELETE.getMessage());
        }
        return ResponseEntity.status(HttpStatus.NO_CONTENT).body(ResponseType.FAIL_IMAGE_DELETE.getMessage());

    }

    /**
     * Endpoint responsável pelo salvamento local do arquivo da foto do egresso
     *
     * @author Camilo Santos, Eude Monteiro
     * @since 11/05/2023
     * @param MultipartFile arquivo
     * @return Uma string representando uma mensagem de êxito indicando que a foto
     *         foi salva.
     * @throws IOException
     */
    @PostMapping(value = "/foto", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    @ResponseStatus(code = HttpStatus.CREATED)
    public String saveFotoEgresso(JwtAuthenticationToken token, @RequestPart MultipartFile arquivo) throws IOException {
        EgressoModel egressoModel = egressoService.findByUsuarioId(jwtService.getIdUsuario(token));
        String fileCode = egressoModel.getId().toString() + ".png";
        if (egressoModel.getFotoNome() != null) {
            egressoService.deleteFile(egressoModel.getFotoNome());
        }
        egressoModel.setFotoNome(fileCode);
        egressoService.update(egressoModel);
        egressoService.saveFoto(fileCode, arquivo);
        return ResponseType.SUCCESS_IMAGE_SAVE.getMessage();
    }

    private void validaAdicionais(EgressoModel egressoModel) {
        if (egressoModel.getContribuicao() != null) {
            egressoModel.getContribuicao().setEgresso(egressoModel);
        }
        if (egressoModel.getDepoimento() != null) {
            egressoModel.getDepoimento().setEgresso(egressoModel);
        }
        if (egressoModel.getPalestras() != null) {
            egressoModel.getPalestras().setEgresso(egressoModel);
        }
    }
    

    private boolean validaCarreiraLocalizacao(EgressoModel egressoModel) {
        if (egressoModel.getEmprego() != null) {
            EmpresaModel empresaModel = egressoModel.getEmprego().getEmpresa();
            EmpresaModel empresaModelNoBanco = empresaService
                    .findById(empresaModel.getId());
            if (empresaModelNoBanco != null) {
                egressoModel.getEmprego().setEmpresa(empresaModelNoBanco);
            } else {
                return false;
            }
            egressoModel.getEmprego().setEgresso(egressoModel);
            EnderecoModel enderecoModelNoBanco = enderecoService.findById(empresaModel.getEndereco().getId());
            if (enderecoModelNoBanco != null) {
                empresaModel.setEndereco(enderecoModelNoBanco);
            } else {
                return false;
            }
            SetorAtuacaoModel setorAtuacaoModelNoBanco = setorAtuacaoService
                    .findById(egressoModel.getEmprego().getSetorAtuacao().getId());
            if (setorAtuacaoModelNoBanco != null) {
                egressoModel.getEmprego().setSetorAtuacao(setorAtuacaoModelNoBanco);
            } else {
                return false;
            }

            AreaAtuacaoModel areaAtuacaoModelNoBanco = areaAtuacaoService
                    .findById(egressoModel.getEmprego().getAreaAtuacao().getId());
            if (areaAtuacaoModelNoBanco != null) {
                egressoModel.getEmprego().setAreaAtuacao(areaAtuacaoModelNoBanco);
            } else {
                return false;
            }
            egressoModel.getEmprego().setEgresso(egressoModel);

        }
        return true;
    }

    private boolean validaCursoPos(EgressoModel egressoModel) {
        if (egressoModel.getTitulacao() != null) {
            CursoModel cursoModelNoBanco = cursoService.findById(egressoModel.getTitulacao().getCurso().getId());
            if (cursoModelNoBanco != null) {
                egressoModel.getTitulacao().setCurso(cursoModelNoBanco);
            } else {
                return false;
            }

            EmpresaModel instituicaoModelNoBanco = empresaService
                    .findById(egressoModel.getTitulacao().getEmpresa().getId());

            if (instituicaoModelNoBanco != null) {
                egressoModel.getTitulacao().setEmpresa(instituicaoModelNoBanco);
            } else {
                return false;
            }
            egressoModel.getTitulacao().setEgresso(egressoModel);
        }
        return true;
    }

    private boolean validaCursoPos(EgressoModel egressoModel, EgressoCadastroDTO egressoCadastroDTO) {
        if (egressoModel.getTitulacao() != null) {
            CursoModel cursoModelNoBanco = cursoService.findById(egressoCadastroDTO.getTitulacao().getCurso());
            if (cursoModelNoBanco != null) {
                egressoModel.getTitulacao().setCurso(cursoModelNoBanco);
            } else {
                return false;
            }

            EmpresaModel instituicaoModelNoBanco = empresaService
                    .findById(egressoCadastroDTO.getTitulacao().getInstituicao());

            if (instituicaoModelNoBanco != null) {
                egressoModel.getTitulacao().setEmpresa(instituicaoModelNoBanco);
            } else {
                return false;
            }
            egressoModel.getTitulacao().setEgresso(egressoModel);
            TitulacaoModel titulacao = titulacaoService
                    .findById(egressoCadastroDTO.getPosGraduacao().booleanValue() ? 2 : 1);
            EgressoTitulacaoModel egressoTitulacao = EgressoTitulacaoModel.builder()
                    .empresa(instituicaoModelNoBanco)
                    .titulacao(titulacao)
                    .egresso(egressoModel)
                    .curso(cursoModelNoBanco)
                    .build();
            egressoModel.setTitulacao(egressoTitulacao);

        }
        return true;
    }

}
