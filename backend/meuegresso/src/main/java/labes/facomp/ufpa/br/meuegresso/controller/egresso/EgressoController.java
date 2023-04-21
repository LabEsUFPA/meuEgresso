package labes.facomp.ufpa.br.meuegresso.controller.egresso;

import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.parameters.RequestBody;
import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.AnuncioDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.ContribuicaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.CursoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoColacaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoPublicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EmpregoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EnderecoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.PesquisaCientificaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.TrabalhoPublicadoDTO;
import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;
import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;
import labes.facomp.ufpa.br.meuegresso.model.PesquisaCientificaModel;
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
    
    @PostMapping(value = "/endereco")
    public ResponseEntity<EnderecoDTO> cadastrarEndereco(@RequestBody EnderecoDTO endereco) {
        EnderecoModel enderecoModel = mapper.map(endereco, EnderecoModel.class);
        enderecoModel = egressoService.adicionarEndereco(enderecoModel);
        return ResponseEntity.ok(mapper.map(enderecoModel, EnderecoDTO.class));
    }


    @PostMapping(value = "/publicacao")
    public ResponseEntity<TrabalhoPublicadoDTO> cadastrarPublicacao(@RequestBody TrabalhoPublicadoDTO publicacao) {
        TrabalhoPublicadoModel publicacaoModel = mapper.map(publicacao, TrabalhoPublicadoModel.class);
        publicacaoModel = egressoService.adicionarPublicacao(publicacaoModel);
        return ResponseEntity.ok(mapper.map(publicacaoModel, TrabalhoPublicadoDTO.class));
    }

    @PostMapping(value = "/pesquisa")
    public ResponseEntity<PesquisaCientificaDTO> cadastrarPublicacao(@RequestBody PesquisaCientificaDTO pesquisa) {
        PesquisaCientificaModel pesquisaModel = mapper.map(pesquisa, PesquisaCientificaModel.class);
        pesquisaModel = egressoService.adicionarPesquisa(pesquisaModel);
        return ResponseEntity.ok(mapper.map(pesquisaModel, PesquisaCientificaDTO.class));
    }

    //curso
    @PostMapping(value = "/curso")
    public ResponseEntity<CursoDTO> cadastrarCurso(@RequestBody CursoDTO curso) {
        CursoModel cursoModel = mapper.map(curso, CursoModel.class);
        cursoModel = egressoService.adicionarCurso(cursoModel);
        return ResponseEntity.ok(mapper.map(cursoModel, CursoDTO.class));
    }

    //anuncio
    @PostMapping(value = "/anuncio")
    public ResponseEntity<AnuncioDTO> cadastrarAnuncio(@RequestBody AnuncioDTO anuncio) {
        AnuncioModel anuncioModel = mapper.map(anuncio, AnuncioModel.class);
        anuncioModel = egressoService.adicionarAnuncio(anuncioModel);
        return ResponseEntity.ok(mapper.map(anuncio, AnuncioDTO.class));
    }

    @PostMapping(value = "/titulo-academico")
    public ResponseEntity<EgressoColacaoDTO> cadastrarTituloAcademico(@RequestBody EgressoColacaoDTO tituloAcademico) {
        EgressoColacaoModel tituloAcademicoModel = mapper.map(tituloAcademico, EgressoColacaoModel.class);
        tituloAcademicoModel = egressoService.adicionarTituloAcademico(tituloAcademicoModel);
        return ResponseEntity.ok(mapper.map(tituloAcademicoModel, EgressoColacaoDTO.class));
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
        egressoModel = egressoService.updateEgresso(egressoModel);
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
        publicacaoModel = egressoService.updatePublicacao(publicacaoModel);
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
        empregoModel = egressoService.updateEmprego(empregoModel);
        return ResponseEntity.ok(mapper.map(empregoModel, EmpregoDTO.class));
    }

    /**
     * Endpoint responsavel por atualizar a contribuições do egresso.
     *
     * @param contribucao Estrutura de dados contendo as informações necessárias
     *                    para atualizar a contribuicao.
     * @return {@link ContribuicaoModel} Dados gravados no banco com a Id
     *         atualizada.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    @PutMapping(value = "/contribuicao")
    public ResponseEntity<ContribuicaoDTO> atualizarContribuicao(@RequestBody ContribuicaoDTO contribucao) {
        ContribuicaoModel contribuicaoModel = mapper.map(contribucao, ContribuicaoModel.class);
        contribuicaoModel = egressoService.updateContribuicao(contribuicaoModel);
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
        depoimentoModel = egressoService.updateDepoimento(depoimentoModel);
        return ResponseEntity.ok(mapper.map(depoimentoModel, DepoimentoDTO.class));
    }

    @PutMapping(value = "/endereco")
    public ResponseEntity<EnderecoDTO> atualizarEndereco(@RequestBody EnderecoDTO endereco) {
        EnderecoModel enderecoModel = mapper.map(endereco, EnderecoModel.class);
        enderecoModel = egressoService.updateEndereco(enderecoModel);
        return ResponseEntity.ok(mapper.map(enderecoModel, EnderecoDTO.class));
    }

    @PutMapping(value = "/pesquisa")
    public ResponseEntity<PesquisaCientificaDTO> atualizarPublicacao(@RequestBody PesquisaCientificaDTO pesquisa) {
        PesquisaCientificaModel pesquisaModel = mapper.map(pesquisa, PesquisaCientificaModel.class);
        pesquisaModel = egressoService.updatePesquisa(pesquisaModel);
        return ResponseEntity.ok(mapper.map(pesquisaModel, PesquisaCientificaDTO.class));
    }

    // curso
    @PutMapping(value = "/curso")
    public ResponseEntity<CursoDTO> atualizarCurso(@RequestBody CursoDTO curso) {
        CursoModel cursoModel = mapper.map(curso, CursoModel.class);
        cursoModel = egressoService.updateCurso(cursoModel);
        return ResponseEntity.ok(mapper.map(cursoModel, CursoDTO.class));
    }

    // anuncio
    @PutMapping(value = "/anuncio")
    public ResponseEntity<AnuncioDTO> atualizarAnuncio(@RequestBody AnuncioDTO anuncio) {
        AnuncioModel anuncioModel = mapper.map(anuncio, AnuncioModel.class);
        anuncioModel = egressoService.updateAnuncio(anuncioModel);
        return ResponseEntity.ok(mapper.map(anuncio, AnuncioDTO.class));
    }

    @PutMapping(value = "/titulo-academico")
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
     * Endpoint responsavel por deletar a publicacao do egresso.
     *
     * @param publicacao Estrutura de dados contendo as informações
     *                   necessárias para deletar a publicacao.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    @DeleteMapping(value = "/publicacao")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<String> deletarPublicacao(@RequestBody @Valid TrabalhoPublicadoDTO publicacao) {
        TrabalhoPublicadoModel publicacaoModel = mapper.map(publicacao, TrabalhoPublicadoModel.class);
        return egressoService.deletarPublicacao(publicacaoModel);
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
    public ResponseEntity<String> deletarEmprego(@RequestBody EmpregoDTO emprego) {
        EgressoEmpresaModel empregoModel = mapper.map(emprego, EgressoEmpresaModel.class);
        return egressoService.deletarEmprego(empregoModel);
    }

    /**
     * Endpoint responsavel por deletar a contribuicao do egresso.
     *
     * @param contribuicao Estrutura de dados contendo as informações
     *                necessárias para deletar a contribuicao.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    @DeleteMapping(value = "/contribuicao")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<String> deletarContribuicao(@RequestBody ContribuicaoDTO contribucao) {
        ContribuicaoModel contribuicaoModel = mapper.map(contribucao, ContribuicaoModel.class);
        return egressoService.deletarContribuicao(contribuicaoModel);
    }

    /**
     * Endpoint responsavel por deletar o depoimento do egresso.
     *
     * @param depoimento Estrutura de dados contendo as informações
     *                necessárias para deletar o depoimento.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    @DeleteMapping(value = "/depoimento")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<String> deletarDepoimento(@RequestBody DepoimentoDTO depoimento) {
        DepoimentoModel depoimentoModel = mapper.map(depoimento, DepoimentoModel.class);
        return egressoService.deletarDepoimento(depoimentoModel);
    }

    /**
     * Endpoint responsavel por deletar a pesquisa do egresso.
     *
     * @param pesquisa Estrutura de dados contendo as informações
     *                   necessárias para deletar a pesquisa.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    @DeleteMapping(value = "/pesquisa")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<String> deletarPesquisa(@RequestBody PesquisaCientificaDTO pesquisa) {
        PesquisaCientificaModel pesquisaModel = mapper.map(pesquisa, PesquisaCientificaModel.class);
        return egressoService.deletarPesquisa(pesquisaModel);
    }

    /**
     * Endpoint responsavel por deletar o curso do egresso.
     *
     * @param curso Estrutura de dados contendo as informações
     *                   necessárias para deletar o curso.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    @DeleteMapping(value = "/curso")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<String> deletarCurso(@RequestBody @Valid CursoDTO curso) {
        CursoModel cursoModel = mapper.map(curso, CursoModel.class);
        return egressoService.deletarCurso(cursoModel);
    }

    /**
     * Endpoint responsavel por deletar o anuncio do egresso.
     *
     * @param anuncio Estrutura de dados contendo as informações
     *              necessárias para deletar o anuncio.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    @DeleteMapping(value = "/anuncio")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<String> deletarAnuncio(@RequestBody @Valid AnuncioDTO anuncio) {
        AnuncioModel anuncioModel = mapper.map(anuncio, AnuncioModel.class);
        return egressoService.deletarAnuncio(anuncioModel);
    }

    /**
     * Endpoint responsavel por deletar a colacao do egresso.
     *
     * @param tituloAcademico Estrutura de dados contendo as informações
     *                        necessárias para deletar o titulo academico.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    @DeleteMapping(value = "/titulo-academico")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<String> deletarTituloAcademico(@RequestBody @Valid EgressoColacaoDTO tituloAcademico) {
        EgressoColacaoModel tituloAcademicoModel = mapper.map(tituloAcademico, EgressoColacaoModel.class);
        return egressoService.deletarTituloAcademico(tituloAcademicoModel);
    }

    /**
     * Endpoint responsavel por deletar o endereco do egresso.
     *
     * @param endereco Estrutura de dados contendo as informações
     *                 necessárias para deletar o endereco.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    @DeleteMapping(value = "/endereco")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<String> deletarEndereco(@RequestBody @Valid EnderecoDTO endereco) {
        EnderecoModel enderecoModel = mapper.map(endereco, EnderecoModel.class);
        return egressoService.deletarEndereco(enderecoModel);
    }
}
