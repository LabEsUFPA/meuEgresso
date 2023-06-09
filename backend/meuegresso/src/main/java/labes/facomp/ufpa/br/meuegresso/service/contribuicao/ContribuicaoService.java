package labes.facomp.ufpa.br.meuegresso.service.contribuicao;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface ContribuicaoService {

	/**
	 * Método responsável por persistir determinado contribuicao no banco de dados.
	 *
	 * @param contribuicaoModel Dados do contribuicao
	 * @return {@link ContribuicaoModel} Dados após serem gravados no banco de dados.
	 */
	public ContribuicaoModel save(ContribuicaoModel contribuicaoModel);

	/**
	 * Método responsável por encontrar um determinado contribuicao por sua ID.
	 *
	 * @param id ID de um contribuicao
	 * @return {@link ContribuicaoModel}
	 */
	public ContribuicaoModel findById(Integer id);

	/**
	 * Método responsável por encontrar um determinado contribuicao pelo seu
	 * egresso.
	 *
	 * @param idEgresso ID de um contribuicao
	 * @return {@link ContribuicaoModel}
	 */
	public ContribuicaoModel findByEgressoId(Integer idEgresso);

	/**
	 * Método responsável por encontrar um determinado contribuicao pelo seu
	 * egresso.
	 *
	 * @param idUsuario ID de um contribuicao
	 * @return {@link ContribuicaoModel}
	 */
	public ContribuicaoModel findByEgressoUsuarioId(Integer idUsuario);

	/**
	 * Método responsável por encontrar todos os contribuicaos cadastrados.
	 *
	 * @return {@link List<ContribuicaoModel>} Lista de objetos da classe ContribuicaoModel.
	 */
	public List<ContribuicaoModel> findAll();

	/**
	 * Método responsável por atualizar dados de um contribuicao cadastrado.
	 *
	 * @param contribuicao objeto contribuicao
	 * @throws InvalidRequestException
	 * @return {@link ContribuicaoModel}
	 */
	public ContribuicaoModel update(ContribuicaoModel contribuicao) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um contribuicao cadastrado por sua ID.
	 *
	 * @param id ID de um contribuicao
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
	public boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);
}
