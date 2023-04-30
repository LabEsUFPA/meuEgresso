package labes.facomp.ufpa.br.meuegresso.model;

import java.util.Set;

import org.springframework.security.core.GrantedAuthority;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * Representação da tabela Grupo presente no banco de dados.
 * Esta tabela tem como finalidade representar os papeis/permissões de cada
 * usuário no sistema.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "grupo")
@ToString(exclude = { "usuarios" })
@EqualsAndHashCode(callSuper = false, exclude = "usuarios")
public class GrupoModel extends Auditable implements GrantedAuthority {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "id_grupo", unique = true, nullable = false)
	private Integer id;

	@Column(name = "nome_grupo", unique = true, nullable = false, length = 50)
	private String nomeGrupo;

	@ManyToMany(mappedBy = "grupos", fetch = FetchType.LAZY)
	private Set<UsuarioModel> usuarios;

	@Override
	public String getAuthority() {
		return this.nomeGrupo;
	}
}
