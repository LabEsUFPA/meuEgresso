package labes.facomp.ufpa.br.meuegresso.service.egresso;

import org.springframework.http.ResponseEntity;

import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Joao Paulo
 * @since 16/04/2023
 * @version 1.0
 */
public interface EgressoService {

	public EgressoModel findByUsuarioId(Integer idUsuario);

	public EgressoModel adicionarEgresso(EgressoModel egresso);

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
	 * Metodo responsavel por deletar informacoes do egresso no banco de dados.
	 * 
	 * @param egresso Dados do egresso
	 * @return Mensagem de confirmacao
	 * @author Bruno Eiki
	 * @since 17/04/2023
	 */
	public ResponseEntity<String> deletarEgresso(EgressoModel egresso);

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
	 * Metodo responsavel por deletar informacoes do egresso no banco de dados a
	 * partir do id.
	 * 
	 * @param id Id do egresso
	 * @return Vazio.
	 * @author Pedro Inácio
	 * @since 16/04/2023
	 */
	public void deleteById(Integer id);

}
