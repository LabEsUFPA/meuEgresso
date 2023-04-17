package labes.facomp.ufpa.br.meuegresso.controller.egresso;

import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.parameters.RequestBody;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.ContribuicaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoPublicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EmpregoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.TrabalhoPublicadoDTO;
import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.TrabalhoPublicadoModel;
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

    @PostMapping
    public ResponseEntity<EgressoPublicDTO> cadastrarEgresso(@RequestBody EgressoPublicDTO egresso) {
        EgressoModel egressoModel = mapper.map(egresso, EgressoModel.class);
        egressoModel = egressoService.adicionarEgresso(egressoModel);
        return ResponseEntity.ok(mapper.map(egressoModel, EgressoPublicDTO.class));
    }

    @PostMapping(value = "/publicacao")
    public ResponseEntity<TrabalhoPublicadoDTO> cadastrarPublicacoes(@RequestBody TrabalhoPublicadoDTO publicacao) {
        TrabalhoPublicadoModel publicacaoModel = mapper.map(publicacao, TrabalhoPublicadoModel.class);
        publicacaoModel = egressoService.adicionarPesquisa(publicacaoModel);
        return ResponseEntity.ok(mapper.map(publicacaoModel, TrabalhoPublicadoDTO.class));
    }

    @PostMapping(value = "/emprego")
    public ResponseEntity<EmpregoDTO> cadastrarEmprego(@RequestBody EmpregoDTO emprego) {
        EgressoEmpresaModel empregoModel = mapper.map(emprego, EgressoEmpresaModel.class);
        empregoModel = egressoService.adicionarEmprego(empregoModel);
        return ResponseEntity.ok(mapper.map(empregoModel, EmpregoDTO.class));
    }

    @PostMapping(value = "/contribuicao")
    public ResponseEntity<ContribuicaoDTO> cadastrarContribuicao(@RequestBody ContribuicaoDTO contribucao) {
        ContribuicaoModel contribuicaoModel = mapper.map(contribucao, ContribuicaoModel.class);
        contribuicaoModel = egressoService.adicionarContribuicao(contribuicaoModel);
        return ResponseEntity.ok(mapper.map(contribuicaoModel, ContribuicaoDTO.class));
    }

    @PostMapping(value = "/depoimento")
    public ResponseEntity<DepoimentoDTO> cadastrarDepoimento(@RequestBody DepoimentoDTO depoimento) {
        DepoimentoModel depoimentoModel = mapper.map(depoimento, DepoimentoModel.class);
        depoimentoModel = egressoService.adicionarDepoimento(depoimentoModel);
        return ResponseEntity.ok(mapper.map(depoimentoModel, DepoimentoDTO.class));
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
        egressoModel = egressoService.adicionarEgresso(egressoModel);
        return ResponseEntity.ok(mapper.map(egressoModel, EgressoPublicDTO.class));
    }
    
    /**
     * Endpoint responsavel por atualizar o trabalho publicado do egresso.
     *
     * @param publicacao Estrutura de dados contendo as informações necessárias para
     *                   atualizar a publicacao.
     * @return {@link TrabalhoPublicadoModel} Dados gravados no banco com a Id
     *         atualizada.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    @PutMapping(value = "/publicacao")
    public ResponseEntity<TrabalhoPublicadoDTO> atualizarPublicacao(@RequestBody TrabalhoPublicadoDTO publicacao) {
        TrabalhoPublicadoModel publicacaoModel = mapper.map(publicacao, TrabalhoPublicadoModel.class);
        publicacaoModel = egressoService.adicionarPesquisa(publicacaoModel);
        return ResponseEntity.ok(mapper.map(publicacaoModel, TrabalhoPublicadoDTO.class));
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
    public ResponseEntity<EmpregoDTO> atualizarEmprego(@RequestBody EmpregoDTO emprego) {
        EgressoEmpresaModel empregoModel = mapper.map(emprego, EgressoEmpresaModel.class);
        empregoModel = egressoService.adicionarEmprego(empregoModel);
        return ResponseEntity.ok(mapper.map(empregoModel, EmpregoDTO.class));
    }

    /**
     * Endpoint responsavel por atualizar a contribuições do egresso.
     *
     * @param contribucao Estrutura de dados contendo as informações necessárias
     *                    para
     *                    atualizar a contribuicao.
     * @return {@link ContribuicaoModel} Dados gravados no banco com a Id
     *         atualizada.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    @PutMapping(value = "/contribuicao")
    public ResponseEntity<ContribuicaoDTO> atualizarContribuicao(@RequestBody ContribuicaoDTO contribucao) {
        ContribuicaoModel contribuicaoModel = mapper.map(contribucao, ContribuicaoModel.class);
        contribuicaoModel = egressoService.adicionarContribuicao(contribuicaoModel);
        return ResponseEntity.ok(mapper.map(contribuicaoModel, ContribuicaoDTO.class));
    }

    /**
     * Endpoint responsavel por atualizar o depoimento do egresso.
     *
     * @param depoimento Estrutura de dados contendo as informações necessárias para
     *                   atualizar o depoimento.
     * @return {@link depoimentoModel} Dados gravados no banco com a Id
     *         atualizada.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    @PutMapping(value = "/depoimento")
    public ResponseEntity<DepoimentoDTO> atualizarDepoimento(@RequestBody DepoimentoDTO depoimento) {
        DepoimentoModel depoimentoModel = mapper.map(depoimento, DepoimentoModel.class);
        depoimentoModel = egressoService.adicionarDepoimento(depoimentoModel);
        return ResponseEntity.ok(mapper.map(depoimentoModel, DepoimentoDTO.class));
    }

}