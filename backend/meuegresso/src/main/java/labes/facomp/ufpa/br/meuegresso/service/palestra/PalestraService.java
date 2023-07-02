package labes.facomp.ufpa.br.meuegresso.service.palestra;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.PalestraModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface PalestraService {

	/**
	 * Método responsável por persistir determinado palestra no banco de dados.
	 *
	 * @param palestraModel Dados do palestra
	 * @return Dados após serem gravados no banco de dados.
	 */
	public PalestraModel save(PalestraModel palestraModel);

	/**
	 * Método responsável por encontrar um determinado palestra por sua ID.
	 *
	 * @param id ID de um palestra
	 * @return
	 */
	public PalestraModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os palestras cadastrados.
	 *
	 * @return Lista de objetos da classe PalestraModel.
	 */
	public List<PalestraModel> findAll();

	/**
	 * Método responsável por atualizar dados de um palestra cadastrado.
	 *
	 * @param palestra objeto palestra
	 * @return
	 */
	public PalestraModel update(PalestraModel palestra) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um palestra cadastrado por sua ID.
	 *
	 * @param id ID de um palestra
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


	/**
	 * Método responsável por encontrar um determinado contribuicao pelo seu egresso.
	 *
	 * @param id ID de um contribuicao
	 * @return
	 */
	public PalestraModel findByEgressoId(Integer idEgresso);

	/**
	 * Método responsável por encontrar um determinado contribuicao pelo seu egresso.
	 *
	 * @param id ID de um contribuicao
	 * @return
	 */
	public PalestraModel findByEgressoUsuarioId(Integer idUsuario);
}
