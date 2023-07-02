package labes.facomp.ufpa.br.meuegresso.service.endereco;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface EnderecoService {

	/**
	 * Método responsável por persistir determinado endereco no banco de dados.
	 *
	 * @param enderecoModel Dados do endereco
	 * @return {@link EnderecoModel} Dados após serem gravados no banco de dados.
	 */
	public EnderecoModel save(EnderecoModel enderecoModel);

	/**
	 * Método responsável por encontrar um determinado endereco por sua ID.
	 *
	 * @param id ID de um endereco
	 * @return {@link EnderecoModel}
	 */
	public EnderecoModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os enderecos cadastrados.
	 *
	 * @return {@link List<EnderecoModel>} Lista de objetos da classe EnderecoModel.
	 */
	public List<EnderecoModel> findAll();

	/**
	 * Método responsável por atualizar dados de um endereco cadastrado.
	 *
	 * @param endereco objeto endereco
	 * @throws InvalidRequestException
	 * @return {@link EnderecoModel}
	 */
	public EnderecoModel update(EnderecoModel endereco) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um endereco cadastrado por sua ID.
	 *
	 * @param id ID de um endereco
	 * @return {@link boolean}
	 */
	public boolean deleteById(Integer id);

	/**
	 * Método responsável por verificar se existe um determinado elemento.
	 *
	 * @param id
	 * @param createdBy
	 * @return {@link boolean}
	 */
	boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

	/**
	 * Método responsável por encontrar endereço pela cidade, estado e país.
	 *
	 * @param cidade
	 * @param estado
	 * @param pais
	 * @return {@link EnderecoModel}
	 */
	EnderecoModel findByCidadeAndEstadoAndPais(String cidade, String estado, String pais);
}
