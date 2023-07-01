package labes.facomp.ufpa.br.meuegresso.service.empresa;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;

import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.LocalPosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface EmpresaService {

	/**
	 * Método responsável por persistir determinado empresa no banco de dados.
	 *
	 * @param empresaModel Dados do empresa
	 * @return Dados após serem gravados no banco de dados.
	 */
	public EmpresaModel save(EmpresaModel empresaModel);

	/**
	 * Método responsável por encontrar um determinado empresa por sua ID.
	 *
	 * @param id ID de um empresa
	 * @return
	 */
	public EmpresaModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os empresas cadastrados.
	 *
	 * @return Lista de objetos da classe EmpresaModel.
	 */
	public Page<EmpresaModel> findAll(Integer page, Integer size, Direction direction);

	/**
	 * Método responsável por encontrar todos os empresas referentes à empresa
	 * cadastrados.
	 *
	 * @return Lista de objetos da classe EmpresaModel.
	 */
	public Page<EmpresaModel> findAllByIsEmpregoTrue(Integer page, Integer size, Direction direction);

	/**
	 * Método responsável por encontrar todos as universidades cadastrados.
	 *
	 * @return Lista de objetos da classe EmpresaModel.
	 */
	public Page<EmpresaModel> findAllByIsEmpregoFalse(Integer page, Integer size, Direction direction);

	/**
	 * Método responsável por atualizar dados de um empresa cadastrado.
	 *
	 * @param empresa objeto empresa
	 * @return
	 */
	public EmpresaModel update(EmpresaModel empresa) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um empresa cadastrado por sua ID.
	 *
	 * @param id ID de um empresa
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

	public EmpresaModel findByNome(String nome);

	/**
	 * Método responsável por retornar as Pós graduações cadastradas e a quantidade
	 * de
	 * egressos por pós.
	 *
	 * @return {@link List<LocalPosGraficoDTO>} lista de DTOs com as contagens de
	 *         egresso por pós.
	 */
	public List<LocalPosGraficoDTO> countEgressoByPos();

	public Page<EmpresaModel> findByNomeContainsIgnoreCaseOrderByNomeAsc(Integer page, Integer size,
			Direction direction,
			String nome);

	public Page<EmpresaModel> findByNomeContainsIgnoreCaseAndIsEmpregoTrueOrderByNomeAsc(Integer page, Integer size,
			Direction direction,
			String nome);

	public Page<EmpresaModel> findByNomeContainsIgnoreCaseAndIsEmpregoFalseOrderByNomeAsc(Integer page, Integer size,
			Direction direction,
			String nome);
}