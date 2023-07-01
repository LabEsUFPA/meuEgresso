package labes.facomp.ufpa.br.meuegresso.controller.administrador.egresso;

import java.io.IOException;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
import labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso.EgressoAttDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoCadastroDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaCadastroEgressoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.titulacao.TitulacaoEgressoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.enumeration.UsuarioStatus;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.MatriculaAlreadyExistsException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AreaAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;
import labes.facomp.ufpa.br.meuegresso.model.PalestraModel;
import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.StatusUsuarioModel;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.service.areaatuacao.AreaAtuacaoService;
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
 * Responsável por fornecer um endpoint ao administrador para deletar foto de
 * Egresso.
 *
 * @author Camilo Santos
 * @since 13/05/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/administrador/egresso")
public class EgressoAdmController {

    private final ModelMapper mapper;

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
     * Endpoint responsavel por buscar o egresso.
     *
     * @param Id do egresso.
     * @return {@link EgressoDTO} Dados retornados do banco.
     * @author Marcus Maciel
     * @since 20/06/2023
     */
    @GetMapping(value = "/{id}")
    @PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
    @ResponseStatus(code = HttpStatus.OK)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public EgressoDTO getEgresso(@PathVariable Integer id) {
        mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STANDARD);

        EgressoModel egressoModel = egressoService.findById(id);
        return mapper.map(egressoModel, EgressoDTO.class);
    }

    /**
     * Endpoint responsavel por cadastrar o egresso.
     *
     * @param Id do usuário, egressoCadastroDTO Estruturas de dados contendo as
     *           informações
     *           necessárias para
     *           salvar o egresso.
     * @return {@link String} Uma string representando uma mensagem de êxito
     *         indicando que o egresso
     *         foi salvo.
     * @author Marcus Maciel
     * @since 20/06/2023
     */
    @PostMapping(value = "/{id}")
    @PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
    @ResponseStatus(code = HttpStatus.CREATED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String cadastrarEgressoPrimeiroCadastro(
            @PathVariable Integer id,
            @RequestBody @Valid EgressoCadastroDTO egressoCadastroDTO)
            throws InvalidRequestException, MatriculaAlreadyExistsException {
        UsuarioModel user = usuarioService.findById(id);
        if (!user.getGrupos().contains(Grupos.EGRESSO)) {
            throw new InvalidRequestException();
        }

        if (egressoCadastroDTO.getMatricula() != null
                && egressoService.existsMatricula(egressoCadastroDTO.getMatricula())) {
            throw new MatriculaAlreadyExistsException(
                    String.format(ErrorType.REPORT_007.getMessage(), egressoCadastroDTO.getMatricula()),
                    ErrorType.REPORT_007.getInternalCode());
        }

        mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STANDARD);
        // em cima ok
        EgressoModel egresso = mapper.map(egressoCadastroDTO, EgressoModel.class);
        // Cadastro da titulacao POS-Graduação ou n
        if (egressoCadastroDTO.getTitulacao() != null) {

            TitulacaoEgressoDTO titulacaoEgressoDTO = egressoCadastroDTO.getTitulacao();
            // Cadastro do curso
            CursoModel curso = cursoService.findByNome(titulacaoEgressoDTO.getCurso());
            if (curso == null) {
                curso = CursoModel.builder().nome(titulacaoEgressoDTO.getCurso()).build();
                curso = cursoService.save(curso);
            }
            // Cadastro do Instituição ex: UFPA
            EmpresaModel instituicao = empresaService.findByNome(titulacaoEgressoDTO.getInstituicao());
            if (instituicao == null) {
                instituicao = EmpresaModel.builder().nome(titulacaoEgressoDTO.getInstituicao()).build();
                instituicao = empresaService.save(instituicao);
            }
            TitulacaoModel titulacao = titulacaoService
                    .findById(egressoCadastroDTO.getPosGraduacao().booleanValue() ? 2 : 1);
            EgressoTitulacaoModel egressoTitulacao = EgressoTitulacaoModel.builder().empresa(instituicao)
                    .titulacao(titulacao).egresso(egresso)
                    .curso(curso).build();
            egresso.setTitulacao(egressoTitulacao);
        }

        // Cadastro EMPRESA - EMPREGO
        EmpresaCadastroEgressoDTO empresaDTO;
        EmpresaModel empresa;
        if (egressoCadastroDTO.getEmpresa() != null) {
            empresaDTO = egressoCadastroDTO.getEmpresa();
            EnderecoModel enderecoEmpresa = enderecoService.findByCidadeAndEstadoAndPais(
                    empresaDTO.getEndereco().getCidade(),
                    empresaDTO.getEndereco().getEstado(),
                    empresaDTO.getEndereco().getPais());
            if (enderecoEmpresa == null) {
                enderecoEmpresa = mapper.map(empresaDTO.getEndereco(), EnderecoModel.class);
                enderecoEmpresa = enderecoService.save(enderecoEmpresa);
            }
            empresa = empresaService.findByNome(empresaDTO.getNome());
            if (empresa == null) {
                empresa = mapper.map(empresaDTO, EmpresaModel.class);
                empresa = empresaService.save(empresa);
            }
            egresso.setEmprego(EgressoEmpresaModel.builder().egresso(egresso).empresa(empresa)
                    .endereco(enderecoEmpresa)
                    .faixaSalarial(FaixaSalarialModel.builder().id(empresaDTO.getFaixaSalarialId()).build())
                    .build());
            validaSetorAtuacao(empresaDTO.getSetorAtuacao(), egresso);
            validaAreaAtuacao(empresaDTO.getAreaAtuacao(), egresso);
        }

        egresso.setUsuario(usuarioService.findById(id));
        egresso.getUsuario().setNome(egressoCadastroDTO.getNome());
        PalestraModel palestra;
        if (egresso.getPalestras() != null) {
            palestra = egresso.getPalestras();
            palestra.setEgresso(egresso);

        }
        DepoimentoModel depoimento = egresso.getDepoimento();
        ContribuicaoModel contribuicao = egresso.getContribuicao();
        depoimento.setEgresso(egresso);
        contribuicao.setEgresso(egresso);
        egresso.getUsuario().setAtivo(egresso.getUsuario().getValido());
        egressoService.save(egresso);

        statusUsuarioService
                .save(StatusUsuarioModel.builder().usuarioId(egresso.getUsuario().getId())
                        .nome(egresso.getUsuario().getNome()).status(UsuarioStatus.COMPLETO)
                        .build());

        return ResponseType.SUCCESS_SAVE.getMessage();
    }

    /**
     * Endpoint responsavel por atualizar o egresso pelo administrador.
     *
     * @param Id do egresso, egresso Estrutura de dados contendo as informações ne
     *           essárias para
     *           persistir o Usuário.
     * @return {@link EgressoModel} Dados gravados no banco com a Id atualizada.
     * @author Marcus Maciel Oliveira
     * @throws UnauthorizedRequestException
     * @since 20/06/2023
     */
    @PutMapping(value = "/{id}")
    @PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
    @ResponseStatus(code = HttpStatus.CREATED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String atualizarEgresso(@PathVariable Integer id,
            @RequestBody EgressoAttDTO egresso) throws InvalidRequestException, MatriculaAlreadyExistsException {

        UsuarioModel user = usuarioService.findById(egresso.getUsuario().getId());
        if (!user.getGrupos().contains(Grupos.EGRESSO)) {
            throw new InvalidRequestException();
        }

        // Se a matricula passada for diferente da matricula que a pessoa já tinha,
        // checar se é duplicado.
        if (egresso.getMatricula() != null
                && !egresso.getMatricula().equals(egressoService.findById(id).getMatricula())
                && egressoService.existsMatricula(egresso.getMatricula())) {
            throw new MatriculaAlreadyExistsException(
                    String.format(ErrorType.REPORT_007.getMessage(), egresso.getMatricula()),
                    ErrorType.REPORT_007.getInternalCode());
        }

        mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
        EgressoModel egressoModel = mapper.map(egresso, EgressoModel.class);
        if (egressoModel.getContribuicao() != null) {
            egressoModel.getContribuicao().setEgresso(egressoModel);
        }
        if (egressoModel.getDepoimento() != null) {
            egressoModel.getDepoimento().setEgresso(egressoModel);
        }
        if (egressoModel.getEmprego() != null) {
            EgressoEmpresaModel egressoEmpresaModel = egressoModel.getEmprego();
            egressoEmpresaModel.setEgresso(egressoModel);
            EnderecoModel enderecoModel = egressoEmpresaModel.getEndereco();
            EnderecoModel enderecoModelNoBanco = enderecoService.findByCidadeAndEstadoAndPais(
                    enderecoModel.getCidade(), enderecoModel.getEstado(),
                    enderecoModel.getPais());
            if (enderecoModelNoBanco != null && enderecoModel != enderecoModelNoBanco) {
                egressoEmpresaModel.setEndereco(enderecoModelNoBanco);
                egressoEmpresaModel.setEndereco(enderecoModelNoBanco);
            } else if (enderecoModelNoBanco == null) {
                egressoEmpresaModel.getId().setEnderecoId(null);
                egressoEmpresaModel.setEndereco(EnderecoModel.builder().cidade(enderecoModel.getCidade())
                        .estado(enderecoModel.getEstado()).pais(enderecoModel.getPais()).build());
            }
        }
        if (egressoModel.getPalestras() != null) {
            egressoModel.getPalestras().setEgresso(egressoModel);
        }

        if (egressoModel.getEmprego() != null) {
            SetorAtuacaoModel setorAtuacaoModel = egressoModel.getEmprego().getSetorAtuacao();
            AreaAtuacaoModel areaAtuacaoModel = egressoModel.getEmprego().getAreaAtuacao();
            validaAreaAtuacao(areaAtuacaoModel.getNome(), egressoModel);
            validaSetorAtuacao(setorAtuacaoModel.getNome(), egressoModel);
        }
        if (egressoModel.getTitulacao() != null) {
            validaCurso(egressoModel.getTitulacao().getCurso().getNome(), egressoModel);
            validaInstituicao(egresso.getTitulacao().getEmpresa().getNome(), egressoModel);
            egressoModel.getTitulacao().setEgresso(egressoModel);
        }
        egressoModel.getUsuario().setUsername(user.getUsername());
        egressoModel.getUsuario().setPassword(user.getPassword());
        egressoModel.getUsuario().setGrupos(user.getGrupos());

        egressoModel.setId(id);

        egressoService.update(egressoModel);

        return ResponseType.SUCCESS_UPDATE.getMessage();
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
    @DeleteMapping(value = "/{id}")
    @ResponseStatus(code = HttpStatus.OK)
    @PreAuthorize("hasRole('ADMIN')")
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String deletarEgresso(@PathVariable Integer id) {
        EgressoModel egressoModel = egressoService.findById(id);
        if (egressoModel != null) {
            egressoService.deleteById(id);
            statusUsuarioService.save(StatusUsuarioModel.builder().usuarioId(egressoModel.getUsuario().getId())
                    .nome(egressoModel.getUsuario().getNome())
                    .status(UsuarioStatus.EXCLUIDO).build());
            return ResponseType.SUCCESS_DELETE.getMessage();
        }
        return ResponseType.FAIL_DELETE.getMessage();
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
    @PostMapping(value = "/foto/{id}", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    @PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
    @ResponseStatus(code = HttpStatus.CREATED)
    public String saveFotoEgresso(@PathVariable Integer id, @RequestPart MultipartFile arquivo)
            throws IOException, InvalidRequestException {
        EgressoModel egressoModel = egressoService.findById(id);
        if (egressoModel != null) {
            String fileCode = egressoModel.getId().toString() + ".png";
            if (egressoModel.getFotoNome() != null) {
                egressoService.deleteFile(egressoModel.getFotoNome());
            }
            egressoModel.setFotoNome(fileCode);
            egressoService.update(egressoModel);
            egressoService.saveFoto(fileCode, arquivo);
            return ResponseType.SUCCESS_IMAGE_SAVE.getMessage();
        }
        throw new InvalidRequestException();
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
    @DeleteMapping(value = "/foto/{id}")
    @ResponseStatus(code = HttpStatus.OK)
    @PreAuthorize("hasRole('ADMIN')")
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String deleteFotoEgresso(@PathVariable Integer id) throws IOException {
        EgressoModel egressoModel = egressoService.findById(id);
        if (egressoModel.getFotoNome() != null) {
            egressoService.deleteFile(egressoModel.getFotoNome());
            egressoModel.setFotoNome(null);
            egressoService.update(egressoModel);
            return ResponseType.SUCCESS_IMAGE_DELETE.getMessage();
        }
        return ResponseType.FAIL_IMAGE_DELETE.getMessage();
    }

    private void validaSetorAtuacao(String setorAtuacaoNome, EgressoModel egressoModel) {
        SetorAtuacaoModel setorAtuacaoModelNoBanco = setorAtuacaoService.findByNome(setorAtuacaoNome);
        if (setorAtuacaoModelNoBanco == null) {
            setorAtuacaoModelNoBanco = SetorAtuacaoModel.builder().nome(setorAtuacaoNome).build();
        }
        egressoModel.getEmprego().setSetorAtuacao(setorAtuacaoModelNoBanco);
    }

    private void validaAreaAtuacao(String areaAtuacaoNome, EgressoModel egressoModel) {
        AreaAtuacaoModel areaAtuacaoModelNoBanco = areaAtuacaoService.findByNome(areaAtuacaoNome);
        if (areaAtuacaoModelNoBanco == null) {
            areaAtuacaoModelNoBanco = AreaAtuacaoModel.builder().nome(areaAtuacaoNome).build();
        }
        egressoModel.getEmprego().setAreaAtuacao(areaAtuacaoModelNoBanco);
    }

    private void validaCurso(String cursoNome, EgressoModel egressoModel) {
        CursoModel cursoModel = cursoService.findByNome(cursoNome);
        if (cursoModel == null) {
            cursoModel = CursoModel.builder().nome(cursoNome).build();
        }
        egressoModel.getTitulacao().setCurso(cursoModel);
    }

    private void validaInstituicao(String cursoInstituicao, EgressoModel egressoModel) {
        EmpresaModel empresaModel = empresaService.findByNome(cursoInstituicao);
        if (empresaModel == null) {
            empresaModel = EmpresaModel.builder().nome(cursoInstituicao).build();
        }
        egressoModel.getTitulacao().setEmpresa(empresaModel);
    }

}
