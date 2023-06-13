package labes.facomp.ufpa.br.meuegresso.repository.usuario;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

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

	boolean existsByIdAndCreatedById(Integer id, Integer createdBy);

	boolean existsByUsernameIgnoreCase(String username);

	@Query(value = """
			select u
			from
			usuario u
			join
			u.grupos g
			where
			g.nomeGrupo = 'EGRESSO'
			and u.createdDate >= :minDate and u.createdDate <= :maxDate
			and u.nome = :nomeUsuario
			and u.ativo = :ativo
			and u.id in (select e.usuario.id from egresso e where e.emprego.empresa.nome
			ilike :nomeEmpresa)
			and u.email ilike :email
			""")
	Page<UsuarioModel> findBySearch(String nomeUsuario, String nomeEmpresa,
			LocalDate minDate, LocalDate maxDate,
			Boolean ativo, Pageable page);

	@Query(value = """
			    SELECT u.nome_usuario, u.id_usuario,
			    CASE
			        WHEN ug.id_grupo = 3 AND e.usuario_id IS NOT NULL THEN
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
			    WHERE ug.id_grupo = 3
			    AND (ug.id_grupo = 3 AND e.usuario_id IS NOT NULL OR u.valido_usuario = FALSE)
			""", nativeQuery = true)
	List<Tuple> setStatus();
}
