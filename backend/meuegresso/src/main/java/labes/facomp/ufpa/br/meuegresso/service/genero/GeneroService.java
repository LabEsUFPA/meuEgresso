package labes.facomp.ufpa.br.meuegresso.service.genero;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface GeneroService {

	/**
	 * Método responsável por persistir determinado genero no banco de dados.
	 *
	 * @param generoModel Dados do genero
	 * @return Dados após serem gravados no banco de dados.
	 */
	public GeneroModel save(GeneroModel generoModel);

	/**
	 * Método responsável por encontrar um determinado genero por sua ID.
	 *
	 * @param id ID de um genero
	 * @return
	 */
	public GeneroModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os generos cadastrados.
	 *
	 * @return Lista de objetos da classe GeneroModel.
	 */
	public List<GeneroModel> findAll();

	/**
	 * Método responsável por atualizar dados de um genero cadastrado.
	 *
	 * @param genero objeto genero
	 * @return
	 */
	public GeneroModel update(GeneroModel genero) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um genero cadastrado por sua ID.
	 *
	 * @param id ID de um genero
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
