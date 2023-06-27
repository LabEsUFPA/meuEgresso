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
	 * @return Dados após serem gravados no banco de dados.
	 */
	public CotaModel save(CotaModel cotaModel);

	/**
	 * Método responsável por encontrar um determinado cota por sua ID.
	 *
	 * @param id ID de um cota
	 * @return
	 */
	public CotaModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os cotas cadastrados.
	 *
	 * @return Lista de objetos da classe CotaModel.
	 */
	public List<CotaModel> findAll();

	/**
	 * Método responsável por atualizar dados de um cota cadastrado.
	 *
	 * @param cota objeto cota
	 * @return
	 */
	public CotaModel update(CotaModel cota) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um cota cadastrado por sua ID.
	 *
	 * @param id ID de um cota
	 */
	public boolean deleteById(Integer id);

	/**
	 * Método responsável por verificar se existe um determinado elemento.
	 *
	 * @param id
	 * @param createdBy
	 * @return
	 */
	public boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

	public Map<String, Integer> countEgressoByCota();

}
