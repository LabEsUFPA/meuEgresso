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
	 * @return {@link PalestraModel} Dados após serem gravados no banco de dados.
	 */
	public PalestraModel save(PalestraModel palestraModel);

	/**
	 * Método responsável por encontrar um determinado palestra por sua ID.
	 *
	 * @param id ID de um palestra
	 * @return {@link PalestraModel}
	 */
	public PalestraModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os palestras cadastrados.
	 *
	 * @return {@link List<PalestraModel>} Lista de objetos da classe PalestraModel.
	 */
	public List<PalestraModel> findAll();

	/**
	 * Método responsável por atualizar dados de um palestra cadastrado.
	 *
	 * @param palestra objeto palestra
	 * @throws InvalidRequestException
	 * @return {@link PalestraModel}
	 */
	public PalestraModel update(PalestraModel palestra) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um palestra cadastrado por sua ID.
	 *
	 * @param id ID de um palestra
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
	 * Método responsável por encontrar um determinado contribuicao pelo seu
	 * egresso.
	 *
	 * @param id ID de um contribuicao
	 * @return {@link PalestraModel}
	 */
	public PalestraModel findByEgressoId(Integer idEgresso);

	/**
	 * Método responsável por encontrar um determinado contribuicao pelo seu
	 * egresso.
	 *
	 * @param id ID de um contribuicao
	 * @return {@link PalestraModel}
	 */
	public PalestraModel findByEgressoUsuarioId(Integer idUsuario);
}
