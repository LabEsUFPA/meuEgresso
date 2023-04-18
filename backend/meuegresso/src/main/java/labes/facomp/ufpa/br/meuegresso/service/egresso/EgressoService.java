package labes.facomp.ufpa.br.meuegresso.service.egresso;

import org.springframework.http.ResponseEntity;

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

    public TrabalhoPublicadoModel adicionarPublicacao(TrabalhoPublicadoModel publicacao);

    public DepoimentoModel adicionarDepoimento(DepoimentoModel depoimento);

    public EnderecoModel adicionarEndereco(EnderecoModel endereco);

    public AnuncioModel adicionarAnuncio(AnuncioModel anuncio);

    public PesquisaCientificaModel adicionarPesquisa(PesquisaCientificaModel pesquisa);

    public CursoModel adicionarCurso(CursoModel curso);

    public EgressoColacaoModel adicionarTituloAcademico (EgressoColacaoModel titulo);
    
    /**
     * Metodo responsavel por atualizar informacoes do egresso no banco de dados.
     * 
     * @param egresso Dados do egresso
     * @return Dados após serem gravados no banco de dados.
     * @author Pedro Inácio
     * @since 16/04/2023
     */

    public EgressoModel updateEgresso(EgressoModel egresso);

    /**
     *Metodo responsavel por atualizar informacoes do egresso no banco de dados.
     * 
     * @param contribuicao Dados do egresso
     * @return Dados após serem atualizados no banco de dados.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    public ContribuicaoModel updateContribuicao(ContribuicaoModel contribuicao);

    /**
     *Metodo responsavel por atualizar informacoes do egresso no banco de dados.
     * 
     * @param emprego Dados da emprego egresso
     * @return Dados após serem atualizados no banco de dados.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    public EgressoEmpresaModel updateEmprego(EgressoEmpresaModel emprego);
    
    /**
     *Metodo responsavel por atualizar informacoes do egresso no banco de dados.
     * 
     * @param publicacao Dados da publicacao do egresso
     * @return Dados após serem atualizados no banco de dados.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    public TrabalhoPublicadoModel updatePublicacao(TrabalhoPublicadoModel publicacao);
    
    /**
     *Metodo responsavel por atualizar informacoes do egresso no banco de dados.
     * 
     * @param depoimento Dados do depoimento do egresso
     * @return Dados após serem atualizados no banco de dados.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    public DepoimentoModel updateDepoimento(DepoimentoModel depoimento);


   

    /**
     * Metodo responsavel por deletar informacoes do egresso no banco de dados.
     * 
     * @param egresso Dados do egresso
     * @return Mensagem de confirmacao
     * @author Bruno Eiki
     * @since 17/04/2023
     */
     public ResponseEntity<String> deletarEgresso(EgressoModel egresso);

     /**
      * Metodo responsavel por deletar informacoes da contribuicao egresso no banco de dados.
      * 
      * @param contribuicao Dados de contribuicao do egresso
      * @return Mensagem de confirmacao
      * @author Bruno Eiki
      * @since 17/04/2023
      */
    public ResponseEntity<String> deletarContribuicao(ContribuicaoModel contribuicao);

    /**
     * Metodo responsavel por deletar informacoes de emprego do egresso no banco
     * de dados.
     * 
     * @param emprego Dados de emprego do egresso
     * @return Mensagem de confirmacao
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    public ResponseEntity<String> deletarEmprego(EgressoEmpresaModel emprego);

    /**
     * Metodo responsavel por deletar informacoes de publicacao do egresso no banco
     * de dados.
     * 
     * @param publicacao Dados de publicacao do egresso
     * @return Mensagem de confirmacao
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    public ResponseEntity<String> deletarPublicacao(TrabalhoPublicadoModel publicacao);

    /**
     * Metodo responsavel por deletar informacoes de depoimento do egresso no banco
     * de dados.
     * 
     * @param depoimento Dados de depoimento do egresso
     * @return Mensagem de confirmacao
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    public ResponseEntity<String> deletarDepoimento(DepoimentoModel depoimento);

    /**
     * Metodo responsavel por deletar informacoes de pesquisa do egresso no banco
     * de dados.
     * 
     * @param pesquisa Dados de pesquisa do egresso
     * @return Mensagem de confirmacao
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    public ResponseEntity<String> deletarPesquisa(PesquisaCientificaModel pesquisa);

    /**
     * Metodo responsavel por deletar informacoes de curso do egresso no banco
     * de dados.
     * 
     * @param curso Dados de curso do egresso
     * @return Mensagem de confirmacao
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    public ResponseEntity<String> deletarCurso(CursoModel curso);

    /**
     * Metodo responsavel por deletar informacoes de anuncio do egresso no banco
     * de dados.
     * 
     * @param anuncio Dados de anuncio do egresso
     * @return Mensagem de confirmacao
     * @author Bruno Eiki
     * @since 17/04/2023
     */
    public ResponseEntity<String> deletarAnuncio(AnuncioModel anuncio);

    /**
     * Metodo responsavel por deletar informacoes da colacao(titulacao) do egresso no banco
     * de dados.
     * 
     * @param tituloAcademico Dados de anuncio do egresso
     * @return Mensagem de confirmacao
     * @author Bruno Eiki
     * @since 17/04/2023
     */

    public ResponseEntity<String> deletarTituloAcademico(EgressoColacaoModel tituloAcademico);

    /**
     * Metodo responsavel por deletar informacoes do endereco do egresso
     * no banco de dados.
     * 
     * @param endereco Dados do endereco do egresso
     * @return Mensagem de confirmacao
     * @author Bruno Eiki
     * @since 17/04/2023
     */

    public ResponseEntity<String> deletarEndereco(EnderecoModel endereco);

    /**
     * Metodo responsavel por verificar se egresso existe no banco de dados.
     * 
     * @param id Id do egresso
     * @return True caso egresso exista, false do contrario.
     * @author Pedro Inácio
     * @since 16/04/2023     
     */
    public Boolean existsById(Integer id);

    /**
     *Metodo responsavel por deletar informacoes do egresso no banco de dados a partir do id.
     * 
     * @param id Id do egresso
     * @return Vazio.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    public void deleteById(Integer id);

}
