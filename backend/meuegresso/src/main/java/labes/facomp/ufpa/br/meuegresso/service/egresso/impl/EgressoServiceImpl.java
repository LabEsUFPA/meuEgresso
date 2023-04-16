package labes.facomp.ufpa.br.meuegresso.service.egresso.impl;

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

}
