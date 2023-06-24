package labes.facomp.ufpa.br.meuegresso.repository.usuario;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import jakarta.persistence.Tuple;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.projections.usuario.RecoveryPasswordProjection;

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

	Optional<RecoveryPasswordProjection> findByEmailIgnoreCase(String email);

	boolean existsByIdAndCreatedById(Integer id, Integer createdBy);

	boolean existsByUsernameIgnoreCase(String username);

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
	 * @author Eude Monteiro
	 * @return Um objeto map com informações sobre o nome do usuário,
	 *         seu status de cadastro e data de modificação.
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
			when ug.grupo = 'EGRESSO' then
		case
			when e.ativo = false then 'inativo'
			when u.valido_usuario = true then 'completo'
			when u.valido_usuario = false and e.usuario_id is not null then 'pendente'
			when u.valido_usuario = false and e.usuario_id is null then 'incompleto'
		end
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
			when ug.grupo = 'EGRESSO' then
		case
			when e.ativo = false then 'inativo'
			when u.valido_usuario = true then 'completo'
			when u.valido_usuario = false and e.usuario_id is not null then 'pendente'
			when u.valido_usuario = false and e.usuario_id is null then 'incompleto'
		end
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

	@Query(value = """
			with usuario_status as (select 
	u.nome_usuario, 
	u.id_usuario,
	case
		when ug.grupo = 'EGRESSO' then
		case
			when u.revtype = 2 then 'excluido'
			when e.ativo = false then 'inativo'
			when u.valido_usuario = true then 'completo'
			when u.valido_usuario = false and e.usuario_id is not null then 'pendente'
			when u.valido_usuario = false and e.usuario_id is null then 'incompleto'
		end
	end as status,
	u.last_modified_date
from 
	usuario_grupo_aud ug 
	LEFT JOIN egresso_aud e ON ug.id_usuario = e.usuario_id
	JOIN usuario_aud u ON ug.id_usuario = u.id_usuario
where
	ug.grupo = 'EGRESSO'
	and u.nome_usuario ilike %:nome%
	
	and (
		case
			when ug.grupo = 'EGRESSO' then
				case
					when u.revtype = 2 then 'excluido'
					when e.ativo = false then 'inativo'
					when u.valido_usuario = true then 'completo'
					when u.valido_usuario = false and e.usuario_id is not null then 'pendente'
					when u.valido_usuario = false and e.usuario_id is null then 'incompleto'
				end
		end
		ilike %:status%
	)
)
select 
	nome_usuario,
	id_usuario,
	status,
	last_modified_date
from
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
    status <> prev_status OR prev_status IS NULL;
			""", nativeQuery = true)

	List<Tuple> getStatus(
			@Param("nome") String nome,
			@Param("status") String status);
}
