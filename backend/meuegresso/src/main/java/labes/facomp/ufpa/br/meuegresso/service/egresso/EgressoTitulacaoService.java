package labes.facomp.ufpa.br.meuegresso.service.egresso;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface EgressoTitulacaoService {

	/**
	 * Método responsável por persistir determinado egressoTitulacao no banco de
	 * dados.
	 *
	 * @param egressoTitulacaoModel Dados do egressoTitulacao
	 * @return Dados após serem gravados no banco de dados.
	 */
	public EgressoTitulacaoModel save(EgressoTitulacaoModel egressoTitulacaoModel);

	/**
	 * Método responsável por encontrar um determinado egressoTitulacao por sua ID.
	 *
	 * @param id ID de um EgressoTitulacaoModelId
	 * @return EgressoTitulacaoModel
	 */
	public EgressoTitulacaoModel findById(EgressoTitulacaoModelId id);

	/**
	 * Método responsável por encontrar todos os egressoTitulacaos cadastrados.
	 *
	 * @return Lista de objetos da classe egressoTitulacaoModel.
	 */
	public List<EgressoTitulacaoModel> findAll();

	/**
	 * Método responsável por atualizar dados de um egressoTitulacao cadastrado.
	 *
	 * @param egressoTitulacao objeto egressoTitulacao
	 * @return EgressoTitulacaoModel
	 */
	public EgressoTitulacaoModel update(EgressoTitulacaoModel egressoTitulacao) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um egressoTitulacao cadastrado por sua ID.
	 *
	 * @param id de EgressoTitulacaoModelId
	 * @return boolean
	 */
	public boolean deleteById(EgressoTitulacaoModelId id);

	/**
	 * Método responsável por verificar se existe um determinado elemento.
	 *
	 * @param id de EgressoTitulacaoModelId
	 * @param createdBy
	 * @return boolean
	 */
	boolean existsByIdAndCreatedById(EgressoTitulacaoModelId id, Integer createdBy);


}
