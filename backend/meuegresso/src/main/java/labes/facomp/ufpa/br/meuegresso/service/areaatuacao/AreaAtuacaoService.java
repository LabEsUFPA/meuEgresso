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
	 * @return Dados após serem gravados no banco de dados.
	 */
	public AreaAtuacaoModel save(AreaAtuacaoModel areaAtuacao);

	/**
	 * Método responsável por encontrar um determinado areaAtuacao por sua ID.
	 *
	 * @param id ID de um areaAtuacao
	 * @return
	 */
	public AreaAtuacaoModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os area atuacao cadastrados.
	 *
	 * @return Lista de objetos da classe AreaAtuacaoModel.
	 */
	public List<AreaAtuacaoModel> findAll();

	/**
	 * Método responsável por atualizar dados de um areaAtuacao cadastrado.
	 *
	 * @param areaAtuacao objeto areaAtuacao
	 * @return
	 */
	public AreaAtuacaoModel update(AreaAtuacaoModel areaAtuacao) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um areaAtuacao cadastrado por sua ID.
	 *
	 * @param id ID de um areaAtuacao
	 */
	public boolean deleteById(Integer id);

	public AreaAtuacaoModel findByNome(String nome);

	public Map<String, Integer> countEgressoByAreaAtuacao();

}
