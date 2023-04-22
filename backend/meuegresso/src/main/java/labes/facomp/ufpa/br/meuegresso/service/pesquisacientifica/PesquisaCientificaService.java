package labes.facomp.ufpa.br.meuegresso.service.pesquisacientifica;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.PesquisaCientificaModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface PesquisaCientificaService {

	/**
	 * Método responsável por persistir determinado pesquisaCientifica no banco de dados.
	 *
	 * @param pesquisaCientificaModel Dados do pesquisaCientifica
	 * @return Dados após serem gravados no banco de dados.
	 */
	public PesquisaCientificaModel save(PesquisaCientificaModel pesquisaCientificaModel);

	/**
	 * Método responsável por encontrar um determinado pesquisaCientifica por sua ID.
	 *
	 * @param id ID de um pesquisaCientifica
	 * @return
	 */
	public PesquisaCientificaModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os pesquisaCientificas cadastrados.
	 * 
	 * @return Lista de objetos da classe PesquisaCientificaModel.
	 */
	public List<PesquisaCientificaModel> findAll();

	/**
	 * Método responsável por atualizar dados de um pesquisaCientifica cadastrado.
	 * 
	 * @param pesquisaCientifica objeto pesquisaCientifica
	 * @return
	 */
	public PesquisaCientificaModel update(PesquisaCientificaModel pesquisaCientifica) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um pesquisaCientifica cadastrado por sua ID.
	 * 
	 * @param id ID de um pesquisaCientifica
	 */
	public boolean deleteById(Integer id);

}
