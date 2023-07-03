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
	 * @return {@link TitulacaoModel} Dados após serem gravados no banco de dados.
	 */
	public TitulacaoModel save(TitulacaoModel titulacaoModel);

	/**
	 * Método responsável por encontrar uma determinado titulacao por sua ID.
	 *
	 * @param id ID de um titulacao
	 * @return {@link TitulacaoModel} objeto titulacao encontrado.
	 */
	public TitulacaoModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os titulacaos cadastrados.
	 *
	 * @return {@link List<TitulacaoModel>} Lista de objetos da classe TitulacaoModel.
	 */
	public List<TitulacaoModel> findAll();

	/**
	 * Método responsável por atualizar dados de um titulacao cadastrado.
	 *
	 * @param titulacao objeto titulacao
	 * @throws InvalidRequestException
	 * @return {@link TitulacaoModel}
	 */
	public TitulacaoModel update(TitulacaoModel titulacao) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um titulacao cadastrado por sua ID.
	 *
	 * @param id ID de um titulacao
	 * @return {@link boolean}
	 */
	public boolean deleteById(Integer id);

	/**
	 * Método responsável por verificar se existe uma titulacao pela Id e Id de quem a criou.
	 *
	 * @param id
	 * @param createdBy
	 * @return {@link boolean}
	 */
	boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

	/**
	 * Método responsável por verificar se existe uma titulacao pelo nome.
	 *
	 * @param nome
	 * @return {@link TitulacaoModel}
	 */
	public TitulacaoModel findByNome(String nome);

}
