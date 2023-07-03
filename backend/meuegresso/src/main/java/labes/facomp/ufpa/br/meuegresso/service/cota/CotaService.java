package labes.facomp.ufpa.br.meuegresso.service.cota;

import java.util.List;
import java.util.Map;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.CotaModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0.1
 */
public interface CotaService {

	/**
	 * Método responsável por persistir determinado cota no banco de dados.
	 *
	 * @param cotaModel Dados do cota
	 * @return {@link CotaModel} Dados após serem gravados no banco de dados.
	 */
	public CotaModel save(CotaModel cotaModel);

	/**
	 * Método responsável por encontrar um determinado cota por sua ID.
	 *
	 * @param id ID de um cota
	 * @return {@link CotaModel}
	 */
	public CotaModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os cotas cadastrados.
	 *
	 * @return {@link List<CotaModel>} Lista de objetos da classe CotaModel.
	 */
	public List<CotaModel> findAll();

	/**
	 * Método responsável por atualizar dados de um cota cadastrado.
	 *
	 * @param cota objeto cota
	 * @throws InvalidRequestException
	 * @return {@link CotaModel}
	 */
	public CotaModel update(CotaModel cota) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um cota cadastrado por sua ID.
	 *
	 * @param id ID de um cota
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
	public boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

	/**
	 * Método responsável por contar a quantidade de egressos por cota.
	 *
	 * @param id
	 * @param createdBy
	 * @return {@link Map<String, Integer>} nome das cotas e quantidade de egresos em cada uma.
	 */
	public Map<String, Integer> countEgressoByCota();

}
