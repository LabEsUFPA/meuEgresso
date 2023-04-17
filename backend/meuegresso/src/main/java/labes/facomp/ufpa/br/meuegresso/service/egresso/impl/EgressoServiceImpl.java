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
        if(contribuicao.getId() != null){
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
    public EgressoEmpresaModel updateEmprego(EgressoEmpresaModel emprego) {
        if (emprego.getId() != null) {
            empregoRepository.save(emprego);
        }
        return null;
    }

    @Override
    public TrabalhoPublicadoModel updatePesquisa(TrabalhoPublicadoModel pesquisa) {
        if (pesquisa.getId() != null) {
            publicacaoRepository.save(pesquisa);
        }
        return null;
    }

    

}
