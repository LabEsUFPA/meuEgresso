package labes.facomp.ufpa.br.meuegresso.service.egresso;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.EmpresaGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface EgressoEmpresaService {

	/**
	 * Método responsável por persistir determinado egressoEmpresa no banco de
	 * dados.
	 *
	 * @param egressoEmpresaModel Dados do egressoEmpresa
	 * @return {@link EgressoEmpresaModel} Dados após serem gravados no banco de dados.
	 */
	public EgressoEmpresaModel save(EgressoEmpresaModel egressoEmpresaModel);

	/**
	 * Método responsável por encontrar um determinado egressoEmpresa por sua ID.
	 *
	 * @param id EgressoEmpresaModelId
	 * @return {@link EgressoEmpresaModel} EgressoEmpresaModel
	 */
	public EgressoEmpresaModel findById(EgressoEmpresaModelId id);

	/**
	 * Método responsável por encontrar todos os egressoEmpresas cadastrados.
	 *
	 * @return {@link List<EgressoEmpresaModel>} Lista de objetos da classe EgressoEmpresaModel.
	 */
	public List<EgressoEmpresaModel> findAll();

	/**
	 * Método responsável por encontrar todos os egressoEmpresas cadastrados nos quais os usuarios sejam validos.
	 *
	 * @return {@link List<EgressoEmpresaModel>} Lista de objetos da classe EgressoEmpresaModel.
	 */
	public List<EgressoEmpresaModel> findAllByEgressoUsuarioValidoIsTrue();


	/**
	 * Método responsável por atualizar dados de um egressoEmpresa cadastrado.
	 *
	 * @param egressoEmpresa objeto egressoEmpresa
	 * @throws InvalidRequestException
	 * @return {@link EgressoEmpresaModel} objeto de EgressoEmpresaModel
	 */
	public EgressoEmpresaModel update(EgressoEmpresaModel egressoEmpresa) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um egressoEmpresa cadastrado por sua ID.
	 *
	 * @param id de EgressoEmpresaModelId
	 * @return {@link boolean}
	 */
	public boolean deleteById(EgressoEmpresaModelId id);

	/**
	 * Método responsável por verificar se existe um determinado elemento.
	 *
	 * @param id
	 * @param createdBy
	 * @return {@link boolean} boolean
	 */
	boolean existsByIdAndCreatedBy(EgressoEmpresaModelId id, Integer createdBy);

	/**
	 * Método responsável por retornar os dados para o mapa sociodemográfico
	 *
	 * @return {@link List<EgressoEmpresaModel>}
	 */
	public List<EgressoEmpresaModel> findAllEgressoMapa();

	/**
	 * Método responsável por retornar os dados para o grafico de emprego
	 *
	 * @return {@link List<EmpresaGraficoDTO>}
	 */
	public List<EmpresaGraficoDTO> countEgressoByEmpresas();

}
