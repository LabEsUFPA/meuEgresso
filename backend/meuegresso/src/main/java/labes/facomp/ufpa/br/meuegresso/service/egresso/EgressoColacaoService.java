package labes.facomp.ufpa.br.meuegresso.service.egresso;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModelId;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface EgressoColacaoService {

	/**
	 * Método responsável por persistir determinado egressoColacao no banco de dados.
	 *
	 * @param egressoColacaoModel Dados do egressoColacao
	 * @return Dados após serem gravados no banco de dados.
	 */
	public EgressoColacaoModel save(EgressoColacaoModel egressoColacaoModel);

	/**
	 * Método responsável por encontrar um determinado egressoColacao por sua ID.
	 *
	 * @param id ID de um egressoColacao
	 * @return
	 */
	public EgressoColacaoModel findById(EgressoColacaoModelId id);

	/**
	 * Método responsável por encontrar todos os egressoColacaos cadastrados.
	 * 
	 * @return Lista de objetos da classe EgressoColacaoModel.
	 */
	public List<EgressoColacaoModel> findAll();

	/**
	 * Método responsável por atualizar dados de um egressoColacao cadastrado.
	 * 
	 * @param egressoColacao objeto egressoColacao
	 * @return
	 */
	public EgressoColacaoModel update(EgressoColacaoModel egressoColacao) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um egressoColacao cadastrado por sua ID.
	 * 
	 * @param id ID de um egressoColacao
	 */
	public boolean deleteById(EgressoColacaoModelId id);

}
