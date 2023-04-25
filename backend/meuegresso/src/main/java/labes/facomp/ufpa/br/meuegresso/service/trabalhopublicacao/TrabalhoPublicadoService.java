package labes.facomp.ufpa.br.meuegresso.service.trabalhopublicacao;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.TrabalhoPublicadoModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface TrabalhoPublicadoService {

	/**
	 * Método responsável por persistir determinado trabalhoPublicado no banco de dados.
	 *
	 * @param trabalhoPublicadoModel Dados do trabalhoPublicado
	 * @return Dados após serem gravados no banco de dados.
	 */
	public TrabalhoPublicadoModel save(TrabalhoPublicadoModel trabalhoPublicadoModel);

	/**
	 * Método responsável por encontrar um determinado trabalhoPublicado por sua ID.
	 *
	 * @param id ID de um trabalhoPublicado
	 * @return
	 */
	public TrabalhoPublicadoModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os trabalhoPublicados cadastrados.
	 *
	 * @return Lista de objetos da classe TrabalhoPublicadoModel.
	 */
	public List<TrabalhoPublicadoModel> findAll();

	/**
	 * Método responsável por atualizar dados de um trabalhoPublicado cadastrado.
	 *
	 * @param trabalhoPublicado objeto trabalhoPublicado
	 * @return
	 */
	public TrabalhoPublicadoModel update(TrabalhoPublicadoModel trabalhoPublicado) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um trabalhoPublicado cadastrado por sua ID.
	 *
	 * @param id ID de um trabalhoPublicado
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
