package labes.facomp.ufpa.br.meuegresso.service.egresso.impl;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.TrabalhoPublicadoModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.ContribuicaoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.DepoimentoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EmpregoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.PublicacaoRepository;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EgressoServiceImpl implements EgressoService {

    private final ContribuicaoRepository contribuicaoRepository;
    private final EgressoRepository egressoRepository;
    private final PublicacaoRepository publicacaoRepository;
    private final DepoimentoRepository depoimentoRepository;
    private final EmpregoRepository empregoRepository;

    @Override
    public EgressoModel adicionarEgresso(EgressoModel egresso) {
        return egressoRepository.save(egresso);
    }

    @Override
    public ContribuicaoModel adicionarContribuicao(ContribuicaoModel contribuicao) {
        return contribuicaoRepository.save(contribuicao);
    }

    @Override
    public EgressoEmpresaModel adicionarEmprego(EgressoEmpresaModel emprego) {
        return empregoRepository.save(emprego);

    }

    @Override
    public TrabalhoPublicadoModel adicionarPesquisa(TrabalhoPublicadoModel pesquisa) {
        return publicacaoRepository.save(pesquisa);

    }

    @Override
    public DepoimentoModel adicionarDepoimento(DepoimentoModel depoimento) {
        return depoimentoRepository.save(depoimento);

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
    public ResponseEntity<String> deletarEmprego(EgressoEmpresaModel emprego) {
        if (empregoRepository.existsById(emprego.getId())) {
            empregoRepository.deleteById(emprego.getId());
            return ResponseEntity.ok("Emprego deletado");
        } else {
            return ResponseEntity.ok("Emprego nao encontrado");
        }
    }

    @Override
    public ResponseEntity<String> deletarPesquisa(TrabalhoPublicadoModel publicacao) {
        if (publicacaoRepository.existsById(publicacao.getId())) {
            publicacaoRepository.deleteById(publicacao.getId());
            return ResponseEntity.ok("Pesquisa deletada");
        } else {
            return ResponseEntity.ok("Pesquisa nao encontrada");
        }
    }

    @Override
    public Boolean existsById(Integer id) {
        return egressoRepository.existsById(id);
    
    }
}
