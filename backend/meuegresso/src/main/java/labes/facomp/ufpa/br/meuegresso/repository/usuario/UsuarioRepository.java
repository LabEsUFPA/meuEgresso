package labes.facomp.ufpa.br.meuegresso.repository.usuario;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import jakarta.persistence.Tuple;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;

/**
 * Interface utilizada para realizar a comunicação entre a aplicação é o banco
 * de dados.
 * Nota: O Spring Boot irá cuidar da implementação da mesma.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
public interface UsuarioRepository extends CrudRepository<UsuarioModel, Integer> {
	Optional<UsuarioModel> findByUsernameIgnoreCase(String username);

	List<UsuarioModel> findAll();

	<T> Optional<T> findByEmailIgnoreCase(String email, Class<T> type);

	boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

	boolean existsByUsernameIgnoreCase(String username);

	boolean existsByEmail(String email);

	@Query(nativeQuery = true, value = """
			SELECT u.email, u.created_date
			FROM usuario u
			JOIN egresso e ON u.id_usuario = e.usuario_id
			WHERE e.ativo = true;
			""")
	List<Tuple> findByEmailAndData();

	/**
	 * Método responsável por retornar dados para o EgressoDashDTO
	 *
	 * @author Bruno Eiki
	 * @return Um objeto com informações sobre o id do usuário e do egresso,
	 * nome do usuário, seu status de cadastro, nome da empresa, e-mail, data
	 * de criação e foto.
	 * @since 12/06/2023
	 */
	@Query(nativeQuery = true, value = """
			SELECT
			u.id_usuario,
			e.id_egresso,
			upper(u.nome_usuario),
			empr.nome_empresa,
			u.email,
			u.created_date,
			e.foto_egresso,
			CASE
			WHEN ug.grupo = 'EGRESSO' AND e.usuario_id IS NOT NULL THEN
			CASE
			WHEN u.valido_usuario = FALSE THEN 'pendente'
			WHEN u.valido_usuario = TRUE THEN 'completo'
			END
			ELSE 'incompleto'
			END AS status
			FROM
			usuario_grupo ug
			LEFT JOIN egresso e ON ug.id_usuario = e.usuario_id
			JOIN usuario u ON ug.id_usuario = u.id_usuario
			LEFT JOIN egresso_empresa ee ON ee.egresso_id_egresso = e.id_egresso
			LEFT JOIN empresa empr ON ee.empresa_id_empresa = empr.id_empresa
			WHERE
			ug.grupo = 'EGRESSO'
			AND (
			CASE
			WHEN ug.grupo = 'EGRESSO' AND e.usuario_id IS NOT NULL THEN
			CASE
			WHEN u.valido_usuario = TRUE THEN 'completo'
			WHEN u.valido_usuario = FALSE THEN 'pendente'
			END
			ELSE 'incompleto'
			END) in (:status)
			AND u.nome_usuario ilike %:nomeUsuario%
			ORDER BY
			CASE WHEN :ordenacao = 'ASC'  THEN u.created_date END ASC,
			CASE WHEN :ordenacao = 'DESC' THEN u.created_date END DESC
			""")
	List<Tuple> findBySearch(
			@Param("nomeUsuario") String nomeUsuario,
			@Param("status") String[] status,
			@Param("ordenacao") String ordenacao);


	/**
	 * Método responsável por retornar dados para notificação do status
	 *
	 * @author AlfredoGabriel, Eude Monteiro
	 * @return Um objeto map com informações sobre o nome do usuário,
	 *         seu status de cadastro e data de modificação.
	 * @since 12/06/2023
	 */
	@Query(value = """
			WITH usuario_status AS (
			SELECT
			upper(u.nome_usuario) AS nome_usuario,
			u.id_usuario,
			su.status,
			u.last_modified_date
			FROM
			usuario_grupo_aud ug
			LEFT JOIN egresso_aud e ON ug.id_usuario = e.usuario_id
			JOIN status_usuario su ON su.usuario_id_status_usuario = ug.id_usuario
			JOIN usuario_aud u ON ug.id_usuario = u.id_usuario
			WHERE
			ug.grupo = 'EGRESSO'
			AND u.nome_usuario ILIKE %:nome%
			and case
			WHEN ug.grupo = 'EGRESSO' AND e.usuario_id IS NOT NULL THEN
			case
			when u.revtype = 2 then 'excluido'
			LOWER(su.status) ilike %:status%
			AND (ug.grupo = 'EGRESSO' AND e.usuario_id IS NOT NULL OR u.valido_usuario = FALSE)
			)
			SELECT
			nome_usuario,
			id_usuario,
			status,
			last_modified_date
			FROM
			(
			SELECT
			nome_usuario,
			id_usuario,
			status,
			last_modified_date,
			lag(status) OVER (ORDER BY last_modified_date) AS prev_status
			FROM
			usuario_status
			) t
			WHERE
			status <> prev_status OR prev_status IS NULL
			""", nativeQuery = true)

	List<Tuple> getStatus(
			@Param("nome") String nome,
			@Param("status") String status);
}