package labes.facomp.ufpa.br.meuegresso.service.tipobolsa;

import java.util.List;
import java.util.Map;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.TipoBolsaModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface TipoBolsaService {

	/**
	 * Método responsável por persistir determinado tipoBolsa no banco de dados.
	 *
	 * @param tipoBolsaModel Dados do tipoBolsa
	 * @return Dados após serem gravados no banco de dados.
	 */
	public TipoBolsaModel save(TipoBolsaModel tipoBolsaModel);

	/**
	 * Método responsável por encontrar um determinado tipoBolsa por sua ID.
	 *
	 * @param id ID de um tipoBolsa
	 * @return
	 */
	public TipoBolsaModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os tipoBolsas cadastrados.
	 *
	 * @return Lista de objetos da classe TipoBolsaModel.
	 */
	public List<TipoBolsaModel> findAll();

	/**
	 * Método responsável por atualizar dados de um tipoBolsa cadastrado.
	 *
	 * @param tipoBolsa objeto tipoBolsa
	 * @return
	 */
	public TipoBolsaModel update(TipoBolsaModel tipoBolsa) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um tipoBolsa cadastrado por sua ID.
	 *
	 * @param id ID de um tipoBolsa
	 */
	public boolean deleteById(Integer id);

	/**
	 * Método responsável por verificar se existe um determinado elemento.
	 *
	 * @param id
	 * @param createdBy
	 * @return
	 */
	boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

	Map<String, Integer> countEgressoForBolsa();
}
