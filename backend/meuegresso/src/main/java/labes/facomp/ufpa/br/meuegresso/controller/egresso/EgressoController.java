package labes.facomp.ufpa.br.meuegresso.controller.egresso;

import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.parameters.RequestBody;
import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoColacaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoEmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoPublicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.endereco.EnderecoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
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
@RequestMapping("/egresso")
public class EgressoController {

    private EgressoService egressoService;
    
    private final ModelMapper mapper;

    private final JwtService jwtService;

    @PostMapping
    public ResponseEntity<EgressoPublicDTO> cadastrarEgresso(@RequestBody EgressoPublicDTO egresso) {
        EgressoModel egressoModel = mapper.map(egresso, EgressoModel.class);
        egressoModel = egressoService.adicionarEgresso(egressoModel);
        return ResponseEntity.ok(mapper.map(egressoModel, EgressoPublicDTO.class));
    }

    // TODO CRIAR controller EgressoColacao no packege egresso

    /**
     * Endpoint responsavel por buscar o endereco.
     *
     * @param token Token de acesso indicando o usuario logado
     * @return {@link EgressoModel} Busca os enderecos relacionados ao usuario logado.
     * @author Bruno Eiki
     * @since 16/04/2023
     */
    @GetMapping(value = "/endereco")
    @ResponseStatus(code = HttpStatus.OK)
    public EnderecoDTO getEndereco(JwtAuthenticationToken token) {
        EgressoModel egressoModel = egressoService.findByUsuarioId(jwtService.getIdUsuario(token));
        return mapper.map(egressoModel.getEndereco(), EnderecoDTO.class);
    }

    @PostMapping(value = "/formacaoAcademica")
    public ResponseEntity<EgressoColacaoDTO> cadastrarFormacaoAcademica(
            @RequestBody EgressoColacaoDTO formacaoAcademica) {
        EgressoColacaoModel egressoColacaoModel = mapper.map(formacaoAcademica, EgressoColacaoModel.class);
        egressoColacaoModel = egressoService.adicionarTituloAcademico(egressoColacaoModel);
        return ResponseEntity.ok(mapper.map(egressoColacaoModel, EgressoColacaoDTO.class));
    }

    @PostMapping(value = "/emprego")
    public ResponseEntity<EgressoEmpresaDTO> cadastrarEgressoEmpresa(@RequestBody EgressoEmpresaDTO egressoEmpresa) {
        EgressoEmpresaModel egressoEmpresaModel = mapper.map(egressoEmpresa, EgressoEmpresaModel.class);
        egressoEmpresaModel = egressoService.adicionarEgressoEmpresa(egressoEmpresaModel);
        return ResponseEntity.ok(mapper.map(egressoEmpresaModel, EgressoEmpresaDTO.class));
    }

    /**
     * Endpoint responsavel por atualizar o egresso.
     *
     * @param egresso Estrutura de dados contendo as informações necessárias para
     *                persistir o Usuário.
     * @return {@link EgressoModel} Dados gravados no banco com a Id atualizada.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    @PutMapping
    public ResponseEntity<EgressoPublicDTO> atualizarEgresso(@RequestBody EgressoPublicDTO egresso) {
        EgressoModel egressoModel = mapper.map(egresso, EgressoModel.class);
        egressoModel = egressoService.updateEgresso(egressoModel);
        return ResponseEntity.ok(mapper.map(egressoModel, EgressoPublicDTO.class));
    }


    /**
     * Endpoint responsavel por atualizar as informações de emprego do egresso.
     *
     * @param emprego Estrutura de dados contendo as informações necessárias para
     *                atualizar o emprego.
     * @return {@link EgressoEmpresaModel} Dados gravados no banco com a Id
     *         atualizada.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    @PutMapping(value = "/emprego")
    public ResponseEntity<EgressoEmpresaDTO> atualizarEgressoEmpresa(@RequestBody EgressoEmpresaDTO emprego) {
        EgressoEmpresaModel empregoModel = mapper.map(emprego, EgressoEmpresaModel.class);
        empregoModel = egressoService.updateEgressoEmpresa(empregoModel);
        return ResponseEntity.ok(mapper.map(empregoModel, EgressoEmpresaDTO.class));
    }

    @PutMapping(value = "/formacao-academico")
    public ResponseEntity<EgressoColacaoDTO> atualizarTituloAcademico(@RequestBody EgressoColacaoDTO tituloAcademico) {
        EgressoColacaoModel tituloAcademicoModel = mapper.map(tituloAcademico, EgressoColacaoModel.class);
        tituloAcademicoModel = egressoService.updateTituloAcademico(tituloAcademicoModel);
        return ResponseEntity.ok(mapper.map(tituloAcademicoModel, EgressoColacaoDTO.class));
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
    public ResponseEntity<String> deletarEgresso(@RequestBody @Valid EgressoPublicDTO egressoPublicDTO) {
        EgressoModel egressoModel = mapper.map(egressoPublicDTO, EgressoModel.class);
        return egressoService.deletarEgresso(egressoModel);
    }

    /**
     * Endpoint responsavel por deletar o emprego do egresso.
     *
     * @param emprego Estrutura de dados contendo as informações
     *                necessárias para deletar o emprego.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    @DeleteMapping(value = "/emprego")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<String> deletarEmprego(@RequestBody EgressoEmpresaDTO emprego) {
        EgressoEmpresaModel empregoModel = mapper.map(emprego, EgressoEmpresaModel.class);
        return egressoService.deletarEgressoEmpresa(empregoModel);
    }

    /**
     * Endpoint responsavel por deletar o anuncio do egresso.
     *
     * @param anuncio Estrutura de dados contendo as informações
     *                necessárias para deletar o anuncio.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    // @DeleteMapping(value = "/anuncio")
    // @PreAuthorize("hasRole('ADMIN')")
    // public ResponseEntity<String> deletarAnuncio(@RequestBody @Valid AnuncioDTO anuncio) {
    //     AnuncioModel anuncioModel = mapper.map(anuncio, AnuncioModel.class);
    //     return egressoService.deletarAnuncio(anuncioModel);
    // }

    /**
     * Endpoint responsavel por deletar a colacao do egresso.
     *
     * @param tituloAcademico Estrutura de dados contendo as informações
     *                        necessárias para deletar o titulo academico.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    @DeleteMapping(value = "/formacao-academico ")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<String> deletarTituloAcademico(@RequestBody @Valid EgressoColacaoDTO tituloAcademico) {
        EgressoColacaoModel tituloAcademicoModel = mapper.map(tituloAcademico, EgressoColacaoModel.class);
        return egressoService.deletarTituloAcademico(tituloAcademicoModel);
    }

}
