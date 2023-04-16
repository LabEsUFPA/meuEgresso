package labes.facomp.ufpa.br.meuegresso.service.egresso;

import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.TrabalhoPublicadoModel;


public interface EgressoService {

    public EgressoModel adicionarEgresso(EgressoModel egresso);

    public ContribuicaoModel adicionarContribuicao(ContribuicaoModel contribuicao);

    public EgressoEmpresaModel adicionarEmprego(EgressoEmpresaModel emprego);

    public TrabalhoPublicadoModel adicionarPesquisa(TrabalhoPublicadoModel pesquisa);

    public DepoimentoModel adicionarDepoimento(DepoimentoModel depoimento);

}
