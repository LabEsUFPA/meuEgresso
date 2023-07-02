package labes.facomp.ufpa.br.meuegresso.service.areaatuacao;

import java.util.List;
import java.util.Map;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AreaAtuacaoModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface AreaAtuacaoService {

	/**
	 * Método responsável por persistir determinado areaAtuacao no banco de dados.
	 *
	 * @param areaAtuacao Dados do areaAtuacao
	 * @return {@link AreaAtuacaoModel} Dados após serem gravados no banco de dados.
	 */
	public AreaAtuacaoModel save(AreaAtuacaoModel areaAtuacao);

	/**
	 * Método responsável por encontrar um determinado areaAtuacao por sua ID.
	 *
	 * @param id ID de um areaAtuacao
	 * @return {@link AreaAtuacaoModel}
	 */
	public AreaAtuacaoModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os area atuacao cadastrados.
	 *
	 * @return {@link List<AreaAtuacaoModel>} Lista de objetos da classe AreaAtuacaoModel.
	 */
	public List<AreaAtuacaoModel> findAll();

	/**
	 * Método responsável por atualizar dados de um areaAtuacao cadastrado.
	 *
	 * @param areaAtuacao objeto areaAtuacao
	 * @throws InvalidRequestException
	 * @return {@link AreaAtuacaoModel}
	 */
	public AreaAtuacaoModel update(AreaAtuacaoModel areaAtuacao) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um areaAtuacao cadastrado por sua ID.
	 *
	 * @param id ID de um areaAtuacao
	 * @return {@link boolean}
	 */
	public boolean deleteById(Integer id);

	/**
	 * Método responsável por encontrar uma areaAtuacao pelo seu nome.
	 *
	 * @param nome objeto areaAtuacao
	 * @return {@link AreaAtuacaoModel}
	 */
	public AreaAtuacaoModel findByNome(String nome);

	/**
	 * Método responsável por contar a quantidade de egressos por areaAtuacao.
	 *
	 * @return {@link Map<String, Integer>} nome da AreaAtuacao e quantidade de egressos em cada.
	 */
	public Map<String, Integer> countEgressoByAreaAtuacao();

}
