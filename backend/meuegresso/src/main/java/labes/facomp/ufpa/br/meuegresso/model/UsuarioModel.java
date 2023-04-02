package labes.facomp.ufpa.br.meuegresso.model;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Representação da tabela Usuario presente no banco de dados.
 * Esta tabela tem como finalidade representar os usuários que podem realizar login no sistema.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Data
@Entity(name = "usuario")
@EqualsAndHashCode(callSuper = false, exclude = "grupos")
public class UsuarioModel extends Auditable implements UserDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "id_usuario", nullable = false, unique = true)
	private Integer idUsuario;

	@Column(name = "login_usuario", nullable = false, unique = true, length = 100)
	private String username;

	@Column(name = "senha_usuario", nullable = false, unique = false, length = 100)
	private String password;

	@ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.MERGE })
	@JoinTable(name = "usuario_grupo", joinColumns = { @JoinColumn(name = "id_usuario") }, inverseJoinColumns = {
			@JoinColumn(name = "id_grupo") })
	private Set<GrupoModel> grupos = new HashSet<>();

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.grupos;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return this.ativo;
	}
}
