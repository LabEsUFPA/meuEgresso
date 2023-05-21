package labes.facomp.ufpa.br.meuegresso.service.empresa;

import java.util.List;

import org.springframework.data.domain.Sort;

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
	public List<EmpresaModel> findAll(Sort sort);

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

	public List<EmpresaModel> findByNomeContainsIgnoreCaseOrderByNomeAsc(String nome);

}
