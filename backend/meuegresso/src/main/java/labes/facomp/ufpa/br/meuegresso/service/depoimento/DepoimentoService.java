package labes.facomp.ufpa.br.meuegresso.service.depoimento;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface DepoimentoService {

	/**
	 * Método responsável por persistir determinado depoimento no banco de dados.
	 *
	 * @param depoimentoModel Dados do depoimento
	 * @return {@link DepoimentoModel} Dados após serem gravados no banco de dados.
	 */
	public DepoimentoModel save(DepoimentoModel depoimentoModel);

	/**
	 * Método responsável por encontrar um determinado depoimento por sua ID.
	 *
	 * @param id ID de um depoimento
	 * @return {@link DepoimentoModel}
	 */
	public DepoimentoModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os depoimentos cadastrados.
	 *
	 * @return {@link List<DepoimentoModel>} Lista de objetos da classe DepoimentoModel.
	 */
	public List<DepoimentoModel> findAll();

	/**
	 * Método responsável por atualizar dados de um depoimento cadastrado.
	 *
	 * @param depoimento objeto depoimento
	 * @throws InvalidRequestException
	 * @return {@link DepoimentoModel}
	 */
	public DepoimentoModel update(DepoimentoModel depoimento) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um depoimento cadastrado por sua ID.
	 *
	 * @param id ID de um depoimento
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
}
