package labes.facomp.ufpa.br.meuegresso.service.egresso.impl;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

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
import labes.facomp.ufpa.br.meuegresso.repository.egresso.AnuncioRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.ContribuicaoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.CursoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.DepoimentoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoColacaoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoEmpresaRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EnderecoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.PesquisaCientificaRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.PublicacaoRepository;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import lombok.RequiredArgsConstructor;

/**
 * Implementação do Serviço responsável pelas rotinas internas da aplicação
 * referente ao egresso.
 *
 * @author Joao Paulo
 * @since 16/04/2023
 * @version 1.0
 */
@Service
@RequiredArgsConstructor
public class EgressoServiceImpl implements EgressoService {

    private final ContribuicaoRepository contribuicaoRepository;
    private final EgressoRepository egressoRepository;
    private final PublicacaoRepository publicacaoRepository;
    private final DepoimentoRepository depoimentoRepository;
    private final EgressoEmpresaRepository egressoEmpresaRepository;
    private final EnderecoRepository enderecoRepository;
    private final AnuncioRepository anuncioRepository;
    private final PesquisaCientificaRepository pesquisaCientificaRepository;
    private final CursoRepository cursoRepository;
    private final EgressoColacaoRepository egressoColacaoRepository;

    @Override
    public EgressoModel adicionarEgresso(EgressoModel egresso) {
        return egressoRepository.save(egresso);
    }

    @Override
    public ContribuicaoModel adicionarContribuicao(ContribuicaoModel contribuicao) {
        return contribuicaoRepository.save(contribuicao);
    }

    @Override
    public EgressoModel findByUsuarioId(Integer idUsuario) {
        return egressoRepository.findByUsuarioId(idUsuario).orElseThrow();
    }

    @Override
    public EgressoEmpresaModel adicionarEgressoEmpresa(EgressoEmpresaModel egressoEmpresa) {
        return egressoEmpresaRepository.save(egressoEmpresa);

    }

    @Override
    public TrabalhoPublicadoModel adicionarPublicacao(TrabalhoPublicadoModel publicacao) {
        return publicacaoRepository.save(publicacao);

    }

    @Override
    public DepoimentoModel adicionarDepoimento(DepoimentoModel depoimento) {
        depoimento.setAtivo(false);
        return depoimentoRepository.save(depoimento);

    }

    @Override
    public EnderecoModel adicionarEndereco(EnderecoModel endereco) {
        return enderecoRepository.save(endereco);

    }

    @Override
    public AnuncioModel adicionarAnuncio(AnuncioModel anuncio) {
        return anuncioRepository.save(anuncio);
    }

    @Override
    public PesquisaCientificaModel adicionarPesquisa(PesquisaCientificaModel pesquisa) {
        return pesquisaCientificaRepository.save(pesquisa);
    }

    @Override
    public CursoModel adicionarCurso(CursoModel curso) {
        return cursoRepository.save(curso);
    }

    public EgressoColacaoModel adicionarTituloAcademico(EgressoColacaoModel titulo) {
        return egressoColacaoRepository.save(titulo);
    }

    /**
     * 
     * 
     * @param contribuicao Dados de contribuicao do egresso
     * @return Dados após serem gravados no banco de dados.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    @Override
    public ContribuicaoModel updateContribuicao(ContribuicaoModel contribuicao) {
        if (contribuicao.getId() != null) {
            contribuicaoRepository.save(contribuicao);
        }
        return null;
    }

    @Override
    public DepoimentoModel updateDepoimento(DepoimentoModel depoimento) {
        if (depoimento.getId() != null) {
            depoimentoRepository.save(depoimento);
        }
        return null;
    }

    /**
     * 
     * 
     * @param egresso Dados do egresso
     * @return Dados após serem gravados no banco de dados.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    @Override
    public EgressoModel updateEgresso(EgressoModel egresso) {
        if (egresso.getId() != null) {
            egressoRepository.save(egresso);
        }
        return null;
    }

    @Override
    public EgressoEmpresaModel updateEgressoEmpresa(EgressoEmpresaModel emprego) {
        if (emprego.getId() != null) {
            egressoEmpresaRepository.save(emprego);
        }
        return null;
    }

    @Override
    public TrabalhoPublicadoModel updatePublicacao(TrabalhoPublicadoModel publicacao) {
        if (publicacao.getId() != null) {
            publicacaoRepository.save(publicacao);
        }
        return null;
    }

    @Override
    public AnuncioModel updateAnuncio(AnuncioModel anuncio) {
        if (anuncio.getId() != null) {
            anuncioRepository.save(anuncio);
        }
        return null;
    }

    @Override
    public CursoModel updateCurso(CursoModel curso) {
        if (curso.getId() != null) {
            cursoRepository.save(curso);
        }
        return null;
    }

    @Override
    public EnderecoModel updateEndereco(EnderecoModel endereco) {
        if (endereco.getId() != null) {
            enderecoRepository.save(endereco);
        }
        return null;
    }

    @Override
    public PesquisaCientificaModel updatePesquisa(PesquisaCientificaModel pesquisa) {
        if (pesquisa.getId() != null) {
            pesquisaCientificaRepository.save(pesquisa);
        }
        return null;
    }

    @Override
    public EgressoColacaoModel updateTituloAcademico(EgressoColacaoModel titulo) {
        if (titulo.getId() != null) {
            egressoColacaoRepository.save(titulo);
        }
        return null;
    }

    @Override
    public void deleteById(Integer id) {
        egressoRepository.deleteById(id);

    }

    @Override
    public ResponseEntity<String> deletarContribuicao(ContribuicaoModel contribuicao) {
        if (contribuicaoRepository.existsById(contribuicao.getId())) {
            contribuicaoRepository.deleteById(contribuicao.getId());
            return ResponseEntity.ok("Contribuicao deletada");
        } else {
            return ResponseEntity.ok("Contribuicao nao encontrada");
        }
    }

    @Override
    public ResponseEntity<String> deletarDepoimento(DepoimentoModel depoimento) {
        if (depoimentoRepository.existsById(depoimento.getId())) {
            depoimentoRepository.deleteById(depoimento.getId());
            return ResponseEntity.ok("Depoimento deletado");
        } else {
            return ResponseEntity.ok("Depoimento nao encontrado");
        }
    }

    @Override
    public ResponseEntity<String> deletarEgresso(EgressoModel egresso) {
        if (egressoRepository.existsById(egresso.getId())) {
            egressoRepository.deleteById(egresso.getId());
            return ResponseEntity.ok("Egresso deletado");
        } else {
            return ResponseEntity.ok("Egresso nao encontrado");
        }
    }

    @Override
    public ResponseEntity<String> deletarEgressoEmpresa(EgressoEmpresaModel egressoEmpresa) {
        if (egressoEmpresaRepository.existsById(egressoEmpresa.getId())) {
            egressoEmpresaRepository.deleteById(egressoEmpresa.getId());
            return ResponseEntity.ok("Emprego deletado");
        } else {
            return ResponseEntity.ok("Emprego nao encontrado");
        }
    }

    @Override
    public ResponseEntity<String> deletarPublicacao(TrabalhoPublicadoModel publicacao) {
        if (publicacaoRepository.existsById(publicacao.getId())) {
            publicacaoRepository.deleteById(publicacao.getId());
            return ResponseEntity.ok("Publicacao deletada");
        } else {
            return ResponseEntity.ok("Publicacao nao encontrada");
        }
    }

    @Override
    public Boolean existsById(Integer id) {
        return egressoRepository.existsById(id);

    }

    @Override
    public ResponseEntity<String> deletarAnuncio(AnuncioModel anuncio) {
        if (anuncioRepository.existsById(anuncio.getId())) {
            anuncioRepository.deleteById(anuncio.getId());
            return ResponseEntity.ok("Anuncio deletada");
        } else {
            return ResponseEntity.ok("Anuncio nao encontrada");
        }
    }

    @Override
    public ResponseEntity<String> deletarCurso(CursoModel curso) {
        if (cursoRepository.existsById(curso.getId())) {
            cursoRepository.deleteById(curso.getId());
            return ResponseEntity.ok("Curso deletada");
        } else {
            return ResponseEntity.ok("Curso nao encontrada");
        }
    }

    @Override
    public ResponseEntity<String> deletarPesquisa(PesquisaCientificaModel pesquisa) {
        if (pesquisaCientificaRepository.existsById(pesquisa.getId())) {
            pesquisaCientificaRepository.deleteById(pesquisa.getId());
            return ResponseEntity.ok("Pesquisa deletada");
        } else {
            return ResponseEntity.ok("Pesquisa nao encontrada");
        }
    }

    @Override
    public ResponseEntity<String> deletarTituloAcademico(EgressoColacaoModel tituloAcademico) {
        if (egressoColacaoRepository.existsById(tituloAcademico.getId().getColacaoId())) {
            egressoColacaoRepository.deleteById(tituloAcademico.getId().getColacaoId());
            return ResponseEntity.ok("Colacao deletada");
        } else {
            return ResponseEntity.ok("Colacao nao encontrada");
        }
    }

    @Override
    public ResponseEntity<String> deletarEndereco(EnderecoModel endereco) {
        if (enderecoRepository.existsById(endereco.getId())) {
            enderecoRepository.deleteById(endereco.getId());
            return ResponseEntity.ok("Endereco deletado");
        } else {
            return ResponseEntity.ok("Endereco nao encontrado");
        }
    }
}
