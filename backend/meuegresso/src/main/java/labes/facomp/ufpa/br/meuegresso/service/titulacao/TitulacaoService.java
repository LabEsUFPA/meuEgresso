package labes.facomp.ufpa.br.meuegresso.service.titulacao;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface TitulacaoService {

	/**
	 * Método responsável por persistir determinado titulacao no banco de dados.
	 *
	 * @param titulacaoModel Dados do titulacao
	 * @return Dados após serem gravados no banco de dados.
	 */
	public TitulacaoModel save(TitulacaoModel titulacaoModel);

	/**
	 * Método responsável por encontrar um determinado titulacao por sua ID.
	 *
	 * @param id ID de um titulacao
	 * @return
	 */
	public TitulacaoModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os titulacaos cadastrados.
	 *
	 * @return Lista de objetos da classe TitulacaoModel.
	 */
	public List<TitulacaoModel> findAll();

	/**
	 * Método responsável por atualizar dados de um titulacao cadastrado.
	 *
	 * @param titulacao objeto titulacao
	 * @return
	 */
	public TitulacaoModel update(TitulacaoModel titulacao) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um titulacao cadastrado por sua ID.
	 *
	 * @param id ID de um titulacao
	 */
	public boolean deleteById(Integer id);

	/**
	 * Método responsável por verificar se existe um determinado elemento.
	 *
	 * @param id
	 * @param createdBy
	 * @return
	 */
	boolean existsByIdAndCreatedById(Integer id, Integer createdBy);

	public TitulacaoModel findByNome(String nome);

}
