package labes.facomp.ufpa.br.meuegresso.service.faixasalarial;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface FaixaSalarialService {

	/**
	 * Método responsável por persistir determinado faixasalarial no banco de dados.
	 *
	 * @param faixasalarialModel Dados do faixasalarial
	 * @return Dados após serem gravados no banco de dados.
	 */
	public FaixaSalarialModel save(FaixaSalarialModel faixasalarialModel);

	/**
	 * Método responsável por encontrar um determinado faixasalarial por sua ID.
	 *
	 * @param id ID de um faixasalarial
	 * @return
	 */
	public FaixaSalarialModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os faixasalarials cadastrados.
	 *
	 * @return Lista de objetos da classe FaixaSalarialModel.
	 */
	public List<FaixaSalarialModel> findAll();

	/**
	 * Método responsável por atualizar dados de um faixasalarial cadastrado.
	 *
	 * @param faixasalarial objeto faixasalarial
	 * @return
	 */
	public FaixaSalarialModel update(FaixaSalarialModel faixasalarial) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um faixasalarial cadastrado por sua ID.
	 *
	 * @param id ID de um faixasalarial
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
}
