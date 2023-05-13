package labes.facomp.ufpa.br.meuegresso.controller.egresso;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashSet;
import java.util.Set;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
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
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoCadastroDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoPublicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.titulacao.TitulacaoEgressoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
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
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.service.areaatuacao.AreaAtuacaoService;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.curso.CursoService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import labes.facomp.ufpa.br.meuegresso.service.empresa.EmpresaService;
import labes.facomp.ufpa.br.meuegresso.service.endereco.EnderecoService;
import labes.facomp.ufpa.br.meuegresso.service.setoratuacao.SetorAtuacaoService;
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

    private final EgressoService egressoService;
    private final UsuarioService usuarioService;
    private final EmpresaService empresaService;
    private final SetorAtuacaoService setorAtuacaoService;
    private final CursoService cursoService;
    private final EnderecoService enderecoService;
    private final TitulacaoService titulacaoService;
    private final AreaAtuacaoService areaAtuacaoService;

    private final ModelMapper mapper;

    private final JwtService jwtService;

    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String cadastrarEgressoPrimeiroCadastro(@RequestBody @Valid EgressoCadastroDTO egressoCadastroDTO,
            JwtAuthenticationToken token) {

        // em cima ok
        EgressoModel egresso = mapper.map(egressoCadastroDTO, EgressoModel.class);
        TitulacaoModel titulacao = titulacaoService
                .findById(egressoCadastroDTO.getPosGraduacao().booleanValue() ? 2 : 1);

        TitulacaoEgressoDTO titulacaoEgressoDTO;
        EmpresaModel instituicao;
        CursoModel curso;
        EgressoTitulacaoModel egressoTitulacao;
        // Cadastro da titulacao POS-Graduação ou n
        if (egressoCadastroDTO.getTitulacao() != null) {
            titulacaoEgressoDTO = egressoCadastroDTO.getTitulacao();
            // Cadastro do curso
            curso = cursoService.findByNome(titulacaoEgressoDTO.getCurso());
            if (curso == null) {
                curso = CursoModel.builder().nome(titulacaoEgressoDTO.getCurso()).build();
                curso = cursoService.save(curso);
            }
            // Cadastro do Instituição ex: UFPA
            instituicao = empresaService.findByNome(titulacaoEgressoDTO.getInstituicao());
            if (instituicao == null) {
                instituicao = EmpresaModel.builder().nome(titulacaoEgressoDTO.getInstituicao()).build();
                instituicao = empresaService.save(instituicao);
            }
            egressoTitulacao = EgressoTitulacaoModel.builder().empresa(instituicao)
                    .titulacao(titulacao).egresso(egresso)
                    .curso(curso).build();
            egresso.setTitulacao(egressoTitulacao);
        }

        // Cadastro EMPRESA - EMPREGO
        EmpresaDTO empresaDTO;
        SetorAtuacaoModel setorAtuacao;
        EmpresaModel empresa;
        AreaAtuacaoModel areaAtuacaoModel;
        if (egressoCadastroDTO.getEmpresa() != null) {
            empresaDTO = egressoCadastroDTO.getEmpresa();
            setorAtuacao = setorAtuacaoService.findByNome(empresaDTO.getSetorAtuacao()); // TODO no primeiro cadastro a
                                                                                         // empresa buga, verificar
            if (setorAtuacao == null) {
                setorAtuacao = setorAtuacaoService
                        .save(SetorAtuacaoModel.builder().nome(empresaDTO.getSetorAtuacao()).build());
            }
            areaAtuacaoModel = areaAtuacaoService.findByNome(empresaDTO.getAreaAtuacao());
            if (areaAtuacaoModel == null) {
                areaAtuacaoModel = areaAtuacaoService
                        .save(AreaAtuacaoModel.builder().nome(empresaDTO.getAreaAtuacao()).build());
            }
            EnderecoModel enderecoEmpresa = enderecoService.findByCidadeAndEstadoAndPais(
                    empresaDTO.getEndereco().getCidade(),
                    empresaDTO.getEndereco().getEstado(), empresaDTO.getEndereco().getPais());
            if (enderecoEmpresa == null) {
                enderecoEmpresa = mapper.map(empresaDTO.getEndereco(), EnderecoModel.class);
                enderecoEmpresa = enderecoService.save(enderecoEmpresa);
            }
            empresa = empresaService.findByNome(empresaDTO.getNome());
            if (empresa == null) {
                empresa = mapper.map(empresaDTO, EmpresaModel.class);
                empresa.setEndereco(enderecoEmpresa);
                if (setorAtuacao.getEmpresas() == null)
                    setorAtuacao.setEmpresas(new HashSet<>());
                setorAtuacao.getEmpresas().add(empresa);
                empresa.setSetorAtuacoes(new HashSet<>(Set.of(setorAtuacao)));
                empresa = empresaService.save(empresa);
            }
            egresso.setEmprego(EgressoEmpresaModel.builder().egresso(egresso).empresa(empresa)
                    .areaAtuacao(areaAtuacaoModel)
                    .faixaSalarial(FaixaSalarialModel.builder().id(empresaDTO.getFaixaSalarialId()).build()).build());
        }

        egresso.setUsuario(usuarioService.findById(jwtService.getIdUsuario(token)));
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

        egressoService.adicionarEgresso(egresso);

        return ResponseType.SUCESS_SAVE.getMessage();
    }

    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public EgressoDTO getEgresso(JwtAuthenticationToken token) {
        EgressoModel egressoModel = egressoService.findByUsuarioId(jwtService.getIdUsuario(token));
        return mapper.map(egressoModel, EgressoDTO.class);
    }

    /**
     * Endpoint responsavel por atualizar o egresso.
     *
     * @param egresso Estrutura de dados contendo as informações necessárias para
     *                persistir o Usuário.
     * @return {@link EgressoModel} Dados gravados no banco com a Id atualizada.
     * @author Pedro Inácio
     * @throws UnauthorizedRequestException
     * @since 16/04/2023
     */
    @PutMapping(consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    @ResponseStatus(code = HttpStatus.CREATED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String atualizarEgresso(
            @RequestBody EgressoDTO egresso, JwtAuthenticationToken token)
            throws UnauthorizedRequestException, IOException {
        if (egressoService.existsByIdAndCreatedById(egresso.getId(), jwtService.getIdUsuario(token))) {
            mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
            EgressoModel egressoModel = mapper.map(egresso, EgressoModel.class);
            if (egressoModel.getContribuicao() != null) {
                egressoModel.getContribuicao().setEgresso(egressoModel);
            }
            if (egressoModel.getDepoimento() != null) {
                egressoModel.getDepoimento().setEgresso(egressoModel);
            }
            if (egressoModel.getEmprego() != null) {
                egressoModel.getEmprego().setEgresso(egressoModel);
            }
            if (egressoModel.getPalestras() != null) {
                egressoModel.getPalestras().setEgresso(egressoModel);
            }
            egressoModel.getUsuario()
                    .setPassword(usuarioService.findById(jwtService.getIdUsuario(token)).getPassword());
            egressoService.updateEgresso(egressoModel);
            return ResponseType.SUCESS_UPDATE.getMessage();
        }
        throw new UnauthorizedRequestException();
    }

    /**
     * Endpoint responsavel por deletar o egresso.
     *
     * @param egressoPublicDTO Estrutura de dados contendo as informações
     *                         necessárias para deletar o egresso.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    @DeleteMapping
    @PreAuthorize("hasRole('ADMIN')")
    @ResponseStatus(code = HttpStatus.OK)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String deletarEgresso(@RequestBody @Valid EgressoPublicDTO egressoPublicDTO) {
        EgressoModel egressoModel = mapper.map(egressoPublicDTO, EgressoModel.class);
        if (egressoService.deletarEgresso(egressoModel)) {
            return ResponseType.SUCESS_DELETE.getMessage();
        } else {
            return ResponseType.FAIL_DELETE.getMessage();
        }
    }

    /**
     * Endpoint responsável pelo retorno do caminho do arquivo da foto do egresso
     *
     * @author Camilo Santos, Eude Monteiro
     * @since 11/05/2023
     * @param token
     * @return Um arquivo do tipo resource correspondente ao caminho da foto do
     *         egresso
     * @throws IOException
     */
    @GetMapping(value = "/foto/{id}", produces = "image/png")
    @ResponseStatus(code = HttpStatus.OK)   
    public Resource getFotoEgresso(@PathVariable Integer id) throws MalformedURLException, FileNotFoundException {
        EgressoModel egressoModel = egressoService.findById(id);
        return egressoService.getFileAsResource(egressoModel.getFotoNome());
    }

    @ResponseStatus(code = HttpStatus.OK)
    @DeleteMapping(value = "/foto")
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String deleteFotoEgresso(JwtAuthenticationToken token) throws IOException {
        EgressoModel egressoModel = egressoService.findByUsuarioId(jwtService.getIdUsuario(token));
        if (egressoModel.getFotoNome() != null) {
            egressoService.deleteFile(egressoModel.getFotoNome());
            egressoModel.setFotoNome(null);
            egressoService.updateEgresso(egressoModel);
            return ResponseType.SUCESS_IMAGE_DELETE.getMessage();
        }
        return ResponseType.FAIL_IMAGE_DELETE.getMessage();

    }

    /**
     * Endpoint responsável pelo salvamento local do arquivo da foto do egresso
     *
     * @author Camilo Santos, Eude Monteiro
     * @since 11/05/2023
     * @param egressoDTO
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
        egressoService.updateEgresso(egressoModel);
        egressoService.saveFoto(fileCode, arquivo);
        return ResponseType.SUCESS_IMAGE_SAVE.getMessage();
    }
}