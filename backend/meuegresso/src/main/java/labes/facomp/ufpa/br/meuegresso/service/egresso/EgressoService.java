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
	 * @return {@link List<Integer>} Lista com idade de todos os egressos
	 * @author Pedro Inácio
	 * @since 19/05/2023
	 */
	public List<Integer> findAllIdades();

	/**
	 * Metodo responsavel por encontrar o egresso pela sua id.
	 *
	 * @param id
	 * @return {@link EgressoModel}
	 * @author Eude Monteiro
	 * @since 12/05/2023
	 */
	public EgressoModel findById(Integer id);

	/**
	 * Metodo responsavel retornar lista de todos os egressos.
	 *
	 * @return {@link List<EgressoModel>}
	 * @author Pedro Inácio
	 * @since 24/04/2023
	 */
	public List<EgressoModel> findAll();

	/**
	 * Metodo responsavel retornar lista de todos os egressos por usuario valido.
	 *
	 * @return {@link List<EgressoModel>}
	 * @author Alfredo Gabriel
	 * @since 28/06/2023
	 */
	public List<EgressoModel> findAllByUsuarioValidoIsTrue();

	/**
	 * Metodo responsavel por encontrar o egresso pela sua id e se for usuario valido.
	 *
	 * @param id
	 * @return {@link EgressoModel}
	 * @author Alfredo Gabriel
	 * @since 28/06/2023
	 */
	public EgressoModel findByIdAndUsuarioValidoIsTrue(Integer id);

	/**
	 * Método responsável por persistir determinado EgressoModel no banco de dados.
	 *
	 * @param egresso Dados do EgressoModel
	 * @return {@link EgressoModel}  Dados após serem gravados no banco de dados.
	 */
	public EgressoModel save(EgressoModel egresso);

	/**
	 * Metodo responsavel por atualizar informacoes do egresso no banco de dados.
	 *
	 * @param egresso Dados do egresso
	 * @return {@link EgressoModel} Dados após serem gravados no banco de dados.
	 * @author Pedro Inácio
	 * @since 16/04/2023
	 */
	public EgressoModel update(EgressoModel egresso);

	/**
	 * Metodo responsavel por verificar se egresso existe no banco de dados.
	 *
	 * @param id Id do egresso
	 * @return {@link boolean}
	 * @author Pedro Inácio
	 * @since 16/04/2023
	 */
	public boolean existsById(Integer id);

	/**
	 * Metodo responsavel por deletar informacoes do egresso no banco de dados a
	 * partir do id.
	 *
	 * @param id Id do egresso
	 * @return {@link boolean}
	 * @author Pedro Inácio
	 * @since 16/04/2023
	 */
	public boolean deleteById(Integer id);

	/**
	 * Método responsável verificar se egresso existe pela id do usuario.
	 *
	 * @param id id do usuario
	 * @return {@link boolean}
	 */
	public boolean existsByUsuarioId(Integer id);


	/**
	 * Método responsável por verificar se existe um determinado elemento.
	 *
	 * @param id
	 * @param createdBy
	 * @return {@link boolean}
	 */
	boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

	/**
	 * Método responsável pelo retorno do caminho da foto como um URI
	 *
	 * @param fotoNomeString
	 * @return {@link Resource}
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
	 * @return {@link boolean}
	 * @author Bruno Eiki
	 * @since 21/06/2023
	 */
	public boolean existsMatricula(String matricula);

	/**
	 * Metodo responsavel por contar quantidade de egressos que tem determinada idade e as idades dos egressos.
	 *
	 * @return {@link Map<Integer, Integer>} idade e quantidade egressos que tem essa idade
	 * @author Pedro Inácio, Alfredo Gabriel
	 */
	public Map<Integer, Integer> countAgeFromEgressos();

	/**
	 * Metodo responsavel por contar quantidade de egressos que são pós-graduados e não são.
	 *
	 * @return {@link Map<String, Integer>}
	 * @author Pedro Inácio, Alfredo Gabriel
	 */
	public Map<String, Integer> countFezPos();

	/**
	 * Metodo responsavel por contar quantidade de egressos que são graduados e são pós graduados.
	 *
	 * @return {@link Map<String, Integer>}
	 * @author Pedro Inácio, Alfredo Gabriel
	 */
	public Map<String, Integer> countTipoAluno();

	/**
	 * Metodo responsavel por contar quantidade de egressos que são bolsistas e não são.
	 *
	 * @return {@link Map<String, Integer>}
	 * @author Pedro Inácio, Alfredo Gabriel
	 */
	public Map<String, Integer> countBolsista();

	/**
	 * Metodo responsavel por contar quantidade de egressos que tem em determinada média de remuneção das bolsas.
	 *
	 * @return {@link Map<Double, Integer>} média das bolsas e quantidade egressos que tem essa remuneção.
	 * @author Pedro Inácio, Alfredo Gabriel
	 */
	public Map<Double, Integer> countRemuneracaoBolsa();

	/**
	 * Metodo responsavel por contar quantidade de egressos que tem em determinada data.
	 *
	 * @return {@link Map<Integer, Long>} egressos por data
	 */
	public Map<LocalDate, Long> countEgressoPorData();

	/**
	 * Metodo responsavel por contar quantidade de egressos que tem em determinado mês.
	 *
	 * @return {@link Map<Integer, Long>} egressos por mês
	 */
	public Map<LocalDate, Long> countEgressoPorMesEAno();

	/**
	 * Metodo responsavel por contar quantidade de egressos que tem em determinado ano.
	 *
	 * @return {@link Map<Integer, Long>} egressos por ano
	 */
	public Map<Integer, Long> countEgressoPorAno();

	/**
	 * Metodo responsavel por contar quantidade de egressos que são cotistas e não são.
	 *
	 * @return {@link Map<String, Integer>}
	 * @author Pedro Inácio, Alfredo Gabriel
	 */
	public Map<String, Integer> countCotista();

	/**
	 * Metodo responsavel por contar quantidade de egressos que tem e não tem interesse em fazer pós-graduação.
	 *
	 * @return {@link Map<String, Integer>}
	 * @author Pedro Inácio, Alfredo Gabriel
	 */
	public Map<String, Integer> countInteressePos();

	/**
	 * Método responsável por deletar todos os dados da tabela egresso
	 */
	public void deleteAll();

}
