package labes.facomp.ufpa.br.meuegresso.controller.egresso;

import java.util.HashSet;
import java.util.Set;

import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

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
import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;
import labes.facomp.ufpa.br.meuegresso.model.PalestraModel;
import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.contribuicao.ContribuicaoService;
import labes.facomp.ufpa.br.meuegresso.service.curso.CursoService;
import labes.facomp.ufpa.br.meuegresso.service.depoimento.DepoimentoService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoEmpresaService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoTitulacaoService;
import labes.facomp.ufpa.br.meuegresso.service.empresa.EmpresaService;
import labes.facomp.ufpa.br.meuegresso.service.palestra.PalestraService;
import labes.facomp.ufpa.br.meuegresso.service.setoratuacao.SetorAtuacaoService;
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
    private final DepoimentoService depoimentoService;
    private final PalestraService palestraService;
    private final ContribuicaoService contribuicaoService;
    private final EmpresaService empresaService;
    private final SetorAtuacaoService setorAtuacaoService;
    private final EgressoEmpresaService egressoEmpresaService;
    private final CursoService cursoService;
    private final EgressoTitulacaoService egressoTitulacaoService;

    private final ModelMapper mapper;

    private final JwtService jwtService;

    // @PostMapping
    // @ResponseStatus(code = HttpStatus.CREATED)
    // @Operation(security = { @SecurityRequirement(name = "Bearer") })
    // public EgressoPublicDTO cadastrarEgresso(@RequestBody EgressoPublicDTO
    // egressoPublicDTO) {
    // EgressoModel egressoModel = mapper.map(egressoPublicDTO, EgressoModel.class);
    // egressoModel = egressoService.adicionarEgresso(egressoModel);
    // return mapper.map(egressoModel, EgressoPublicDTO.class);
    // }

    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String cadastrarEgressoPrimeiroCadastro(@RequestBody @Valid EgressoCadastroDTO egressoCadastroDTO,
            JwtAuthenticationToken token) {

        EgressoModel egresso = mapper.map(egressoCadastroDTO, EgressoModel.class);
        egresso.setUsuario(usuarioService.findById(jwtService.getIdUsuario(token)));
        egresso.getUsuario().setNome(egressoCadastroDTO.getNome());
        PalestraModel palestra = egresso.getPalestras();
        DepoimentoModel depoimento = egresso.getDepoimento();
        ContribuicaoModel contribuicao = egresso.getContribuicao();
        egresso.setDepoimento(null);
        egresso.setPalestras(null);
        egresso.setContribuicao(null);
        egresso = egressoService.adicionarEgresso(egresso);
        palestra.setEgresso(egresso);
        palestraService.save(palestra);
        depoimento.setEgresso(egresso);
        depoimentoService.save(depoimento);
        contribuicao.setEgresso(egresso);
        contribuicaoService.save(contribuicao);
        EmpresaDTO empresaDTO = egressoCadastroDTO.getEmpresa();
        SetorAtuacaoModel setorAtuacao = setorAtuacaoService.findByNome(empresaDTO.getSetorAtuacao());
        if (setorAtuacao == null) {
            setorAtuacao = setorAtuacaoService
                    .save(SetorAtuacaoModel.builder().nome(empresaDTO.getSetorAtuacao()).build());
        }
        TitulacaoEgressoDTO titulacaoEgressoDTO = egressoCadastroDTO.getTitulacao();
        CursoModel curso = cursoService.findByNome(titulacaoEgressoDTO.getCurso());
        if (curso == null) {
            curso = CursoModel.builder().nome(titulacaoEgressoDTO.getCurso()).build();
            curso = cursoService.save(curso);
        }
        EmpresaModel instituicao = empresaService.findByNome(titulacaoEgressoDTO.getInstituicao());

        if (instituicao == null) {
            instituicao = EmpresaModel.builder().nome(titulacaoEgressoDTO.getInstituicao()).build();
            instituicao = empresaService.save(instituicao);
        }
        EgressoTitulacaoModel egressoTitulacao = EgressoTitulacaoModel.builder().empresa(instituicao).egresso(egresso)
                .curso(curso).build();
        egressoTitulacaoService.save(egressoTitulacao);

        EmpresaModel empresa = empresaService.findByNome(empresaDTO.getNome());
        if (empresa == null) {
            empresa = mapper.map(empresaDTO, EmpresaModel.class);
            empresa.setSetorAtuacoes(new HashSet<>(Set.of(setorAtuacao)));
            empresa = empresaService.save(empresa);
        }
        EgressoEmpresaModel egressoEmpresaModel = EgressoEmpresaModel.builder().egresso(egresso).empresa(empresa)
                .faixaSalarial(FaixaSalarialModel.builder().id(empresaDTO.getFaixaSalarialId()).build()).build();
        egressoEmpresaService.save(egressoEmpresaModel);
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
    @PutMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String atualizarEgresso(
            @RequestBody EgressoPublicDTO egresso, JwtAuthenticationToken token) throws UnauthorizedRequestException {
        if (egressoService.existsByIdAndCreatedById(egresso.getId(), jwtService.getIdUsuario(token))) {
            EgressoModel egressoModel = mapper.map(egresso, EgressoModel.class);
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

}
