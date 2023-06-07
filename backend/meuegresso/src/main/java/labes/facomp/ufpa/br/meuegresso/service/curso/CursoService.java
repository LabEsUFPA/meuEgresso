package labes.facomp.ufpa.br.meuegresso.service.curso;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.dto.grafico.CursosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
public interface CursoService {

	/**
	 * Método responsável por persistir determinado curso no banco de dados.
	 *
	 * @param cursoModel Dados do curso
	 * @return Dados após serem gravados no banco de dados.
	 */
	public CursoModel save(CursoModel cursoModel);

	/**
	 * Método responsável por encontrar um determinado curso por sua ID.
	 *
	 * @param id ID de um curso
	 * @return
	 */
	public CursoModel findById(Integer id);

	/**
	 * Método responsável por encontrar todos os cursos cadastrados.
	 *
	 * @return Lista de objetos da classe CursoModel.
	 */
	public List<CursoModel> findAll();

	/**
	 * Método responsável por atualizar dados de um curso cadastrado.
	 *
	 * @param curso objeto curso
	 * @return
	 */
	public CursoModel update(CursoModel curso) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um curso cadastrado por sua ID.
	 *
	 * @param id ID de um curso
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

	public CursoModel findByNome(String nome);

	/**
	 * Método responsável por retornar os cursos cadastrados e a quantidade de egressos por curso.
	 * 
	 * @return {@link List<CursosGraficoDTO>} lista de DTOs com as contagens de egresso por curso.
	 */
	public List<CursosGraficoDTO> countEgressoByCurso();

}
