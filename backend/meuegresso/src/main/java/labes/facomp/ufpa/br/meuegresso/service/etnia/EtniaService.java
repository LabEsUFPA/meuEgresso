package labes.facomp.ufpa.br.meuegresso.service.etnia;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EtniaModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface EtniaService {

	/**
	 * Método responsável por persistir determinado etnia no banco de dados.
	 *
	 * @param etniaModel Dados do etnia
	 * @return Dados após serem gravados no banco de dados.
	 */
	public EtniaModel save(EtniaModel etniaModel);

	/**
	 * Método responsável por encontrar um determinado etnia por sua ID.
	 *
	 * @param id ID de um etnia
	 * @return
	 */
	public EtniaModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os etnias cadastrados.
	 * 
	 * @return Lista de objetos da classe EtniaModel.
	 */
	public List<EtniaModel> findAll();

	/**
	 * Método responsável por atualizar dados de um etnia cadastrado.
	 * 
	 * @param etnia objeto etnia
	 * @return
	 */
	public EtniaModel update(EtniaModel etnia) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um etnia cadastrado por sua ID.
	 * 
	 * @param id ID de um etnia
	 */
	public boolean deleteById(Integer id);

}
