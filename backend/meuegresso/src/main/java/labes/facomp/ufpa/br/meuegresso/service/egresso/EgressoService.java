package labes.facomp.ufpa.br.meuegresso.service.egresso;

import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.TrabalhoPublicadoModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Joao Paulo
 * @since 16/04/2023
 * @version 1.0
 */
public interface EgressoService {

    public EgressoModel adicionarEgresso(EgressoModel egresso);

    public ContribuicaoModel adicionarContribuicao(ContribuicaoModel contribuicao);

    public EgressoEmpresaModel adicionarEmprego(EgressoEmpresaModel emprego);

    public TrabalhoPublicadoModel adicionarPesquisa(TrabalhoPublicadoModel pesquisa);

    public DepoimentoModel adicionarDepoimento(DepoimentoModel depoimento);

    /**
     * Metodos responsaveis por atualizar informacoes do egresso no banco de dados.
     * 
     * @param egresso Dados do egresso
     * @return Dados após serem gravados no banco de dados.
     * @author Pedro Inácio
     * @since 16/04/2023
     */

    public EgressoModel updateEgresso(EgressoModel egresso);

    /**
     * Metodos responsaveis por atualizar informacoes do egresso no banco de dados.
     * 
     * @param contribuicao Dados do egresso
     * @return Dados após serem atualizados no banco de dados.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    public ContribuicaoModel updateContribuicao(ContribuicaoModel contribuicao);

    /**
     * Metodos responsaveis por atualizar informacoes do egresso no banco de dados.
     * 
     * @param emprego Dados da emprego egresso
     * @return Dados após serem atualizados no banco de dados.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    public EgressoEmpresaModel updateEmprego(EgressoEmpresaModel emprego);
    
    /**
     * Metodos responsaveis por atualizar informacoes do egresso no banco de dados.
     * 
     * @param pesquisa Dados da pesquisa do egresso
     * @return Dados após serem atualizados no banco de dados.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    public TrabalhoPublicadoModel updatePesquisa(TrabalhoPublicadoModel pesquisa);
    
    /**
     * Metodos responsaveis por atualizar informacoes do egresso no banco de dados.
     * 
     * @param depoimento Dados do depoimento do egresso
     * @return Dados após serem atualizados no banco de dados.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    public DepoimentoModel updateDepoimento(DepoimentoModel depoimento);

}
