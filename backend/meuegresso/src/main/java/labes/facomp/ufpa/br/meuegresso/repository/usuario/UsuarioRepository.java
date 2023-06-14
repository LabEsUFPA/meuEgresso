package labes.facomp.ufpa.br.meuegresso.repository.usuario;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso.EgressoDashDTO;
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

	boolean existsByIdAndCreatedById(Integer id, Integer createdBy);

	boolean existsByUsernameIgnoreCase(String username);

	@Query(value = """
			SELECT u.id_usuario, u.nome_usuario, empr.nome_empresa, u.email, u.created_date,
			CASE
				WHEN ug.grupo = 'EGRESSO' AND e.usuario_id IS NOT NULL then
					CASE
						WHEN e.ativo = FALSE THEN 'excluido'
						WHEN u.valido_usuario = TRUE THEN 'completo'
						WHEN u.valido_usuario = FALSE THEN 'pendente'
					END
				ELSE 'incompleto'
			END AS status
			FROM usuario_grupo ug
			LEFT JOIN egresso e ON ug.id_usuario = e.usuario_id
			JOIN usuario u ON ug.id_usuario = u.id_usuario
			JOIN egresso_empresa ee ON ee.egresso_id_egresso  = e.id_egresso
			JOIN empresa empr ON ee.empresa_id_empresa  = empr.id_empresa
			WHERE
				ug.grupo = 'EGRESSO'
				and u.nome_usuario ilike :nomeUsuario
				and empr.nome_empresa ilike :nomeEmpresa
				and u.email ilike :email
				and u.status = :status
				and u.created_date >= :minDate::date and u.created_date <= :maxDate::date
				AND (ug.GRUPO= 'EGRESSO' AND e.usuario_id IS NOT NULL OR u.valido_usuario = FALSE);
			""", nativeQuery = true)
	Page<EgressoDashDTO> findBySearch(String nomeUsuario, String nomeEmpresa, LocalDate minDate, LocalDate maxDate,
			String status, String email, Pageable page);
}