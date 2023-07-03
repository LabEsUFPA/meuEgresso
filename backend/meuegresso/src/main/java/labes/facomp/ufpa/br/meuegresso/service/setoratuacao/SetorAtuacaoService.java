package labes.facomp.ufpa.br.meuegresso.service.setoratuacao;

import java.util.List;
import java.util.Map;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface SetorAtuacaoService {

	/**
	 * Método responsável por persistir determinado setorAtuacao no banco de dados.
	 *
	 * @param setorAtuacao Dados do setorAtuacao
	 * @return {@link SetorAtuacaoModel} Dados após serem gravados no banco de dados.
	 */
	public SetorAtuacaoModel save(SetorAtuacaoModel setorAtuacao);

	/**
	 * Método responsável por encontrar um determinado setorAtuacao por sua ID.
	 *
	 * @param id ID de um setorAtuacao
	 * @return {@link SetorAtuacaoModel}
	 */
	public SetorAtuacaoModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os setor atuacao cadastrados.
	 *
	 * @return {@link List<SetorAtuacaoModel>} Lista de objetos da classe SetorAtuacaoModel.
	 */
	public List<SetorAtuacaoModel> findAll();

	/**
	 * Método responsável por atualizar dados de um setorAtuacao cadastrado.
	 *
	 * @param setorAtuacao objeto setorAtuacao
	 * @throws InvalidRequestException
	 * @return {@link SetorAtuacaoModel}
	 */
	public SetorAtuacaoModel update(SetorAtuacaoModel setorAtuacao) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um setorAtuacao cadastrado por sua ID.
	 *
	 * @param id ID de um setorAtuacao
	 * @return {@link boolean}
	 */
	public boolean deleteById(Integer id);

	/**
	 * Método responsável por encontrar um setorAtuacao cadastrado por seu nome.
	 *
	 * @param nome nome de um setorAtuacao
	 * @return {@link boolean}
	 */
	public SetorAtuacaoModel findByNome(String nome);

	/**
	 * Método responsável por verificar se um setorAtuacao existe por seu nome.
	 *
	 * @param nome nome de um setorAtuacao
	 * @return {@link boolean}
	 */
	public boolean existByNome(String nome);

	/**
	 * Método responsável por contar a quantidade de egressos por setorAtuacao.
	 *
	 * @return {@link Map<String, Integer>}
	 */
 	Map<String, Integer> countEgressoBySetorAtuacao();

}
