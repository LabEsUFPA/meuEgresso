package labes.facomp.ufpa.br.meuegresso.service.areaemprego;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AreaEmpregoModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface AreaEmpregoService {

	/**
	 * Método responsável por persistir determinado areaAtuacao no banco de dados.
	 *
	 * @param areaAtuacao Dados do areaAtuacao
	 * @return Dados após serem gravados no banco de dados.
	 */
	public AreaEmpregoModel save(AreaEmpregoModel areaAtuacao);

	/**
	 * Método responsável por encontrar um determinado areaAtuacao por sua ID.
	 *
	 * @param id ID de um areaAtuacao
	 * @return
	 */
	public AreaEmpregoModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os area atuacao cadastrados.
	 *
	 * @return Lista de objetos da classe AreaEmpregoModel.
	 */
	public List<AreaEmpregoModel> findAll();

	/**
	 * Método responsável por atualizar dados de um areaAtuacao cadastrado.
	 *
	 * @param areaAtuacao objeto areaAtuacao
	 * @return
	 */
	public AreaEmpregoModel update(AreaEmpregoModel areaAtuacao) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um areaAtuacao cadastrado por sua ID.
	 *
	 * @param id ID de um areaAtuacao
	 */
	public boolean deleteById(Integer id);

	public AreaEmpregoModel findByNome(String nome);

	/**
	 * Método responsável por verificar se existe um determinado elemento.
	 *
	 * @param id
	 * @param createdBy
	 * @return
	 */
	boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

}
