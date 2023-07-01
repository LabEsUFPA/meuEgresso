package labes.facomp.ufpa.br.meuegresso.service.egresso;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.MalformedURLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import labes.facomp.ufpa.br.meuegresso.exceptions.NotFoundFotoEgressoException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Joao Paulo
 * @since 16/04/2023
 * @version 1.0
 */
public interface EgressoService {

	public EgressoModel findByUsuarioId(Integer idUsuario);

	/**
	 * Metodo responsavel retornar lista de idades dos egressos.
	 *
	 * @param nenhum
	 * @return Lista com idade de todos os egressos
	 * @author Pedro Inácio
	 * @since 19/05/2023
	 */
	public List<Integer> findAllIdades();

	public EgressoModel findById(Integer id);

	public List<EgressoModel> findAll();

	public List<EgressoModel> findAllByUsuarioValidoIsTrue();

	public EgressoModel findByIdAndUsuarioValidoIsTrue(Integer id);

	public EgressoModel save(EgressoModel egresso);

	/**
	 * Metodo responsavel por atualizar informacoes do egresso no banco de dados.
	 *
	 * @param egresso Dados do egresso
	 * @return Dados após serem gravados no banco de dados.
	 * @author Pedro Inácio
	 * @since 16/04/2023
	 */
	public EgressoModel update(EgressoModel egresso);

	/**
	 * Metodo responsavel por verificar se egresso existe no banco de dados.
	 *
	 * @param id Id do egresso
	 * @return True caso egresso exista, false do contrario.
	 * @author Pedro Inácio
	 * @since 16/04/2023
	 */
	public boolean existsById(Integer id);

	/**
	 * Metodo responsavel por deletar informacoes do egresso no banco de dados a
	 * partir do id.
	 *
	 * @param id Id do egresso
	 * @return
	 * @author Pedro Inácio
	 * @since 16/04/2023
	 */
	public boolean deleteById(Integer id);

	/**
	 * Método responsável por verificar se existe um determinado elemento.
	 *
	 * @param id
	 * @param createdBy
	 * @return boolean
	 */
	boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

	/**
	 * Método responsável pelo retorno do caminho da foto como um URI
	 *
	 * @param fotoNomeString
	 * @return
	 * @throws MalformedURLException
	 * @throws FileNotFoundException
	 * @author Camilo Santos
	 * @since 07/05/2023
	 */
	public Resource getFileAsResource(String fotoNomeString) throws NotFoundFotoEgressoException;

	/**
	 * Método responsável por deletar foto pelo nome
	 *
	 * @param fotoNomeString
	 * @throws IOException
	 * @author Camilo Santos
	 * @since 12/05/2023
	 */
	public void deleteFile(String fotoNomeString) throws IOException;

	/**
	 * Método responsável pelo salvamento da foto em um arquivo local
	 *
	 * @param nomeAnexo
	 * @param arquivo
	 * @throws IOException
	 * @author Camilo Santos
	 * @since 07/05/2023
	 */
	public void saveFoto(String nomeAnexo, MultipartFile arquivo) throws IOException;

	/**
	 * Método responsável por verificar se matrícula já está associada a um egresso
	 *
	 * @param matricula
	 * @return True caso matricula exista, false do contrario.
	 * @author Bruno Eiki
	 * @since 21/06/2023
	 */
	public boolean existsMatricula(String matricula);

	public Map<Integer, Integer> countAgeFromEgressos();

	public Map<String, Integer> countFezPos();

	public Map<String, Integer> countTipoAluno();

	public Map<String, Integer> countBolsista();

	public Map<Double, Integer> countRemuneracaoBolsa();

	public Map<LocalDate, Long> countEgressoPorData();

	public Map<LocalDate, Long> countEgressoPorMesEAno();

	public Map<Integer, Long> countEgressoPorAno();

	public Map<String, Integer> countCotista();

	public Map<String, Integer> countInteressePos();

	/**
	 * Método responsável por deletar todos os dados da tabela egresso
	 */
	public void deleteAll();

}
