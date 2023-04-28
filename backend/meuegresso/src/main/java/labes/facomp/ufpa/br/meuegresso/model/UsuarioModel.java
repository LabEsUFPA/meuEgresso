package labes.facomp.ufpa.br.meuegresso.model;

import java.util.Collection;
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
import jakarta.persistence.OneToOne;
import jakarta.persistence.Transient;
import jakarta.persistence.UniqueConstraint;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * Representação da tabela Usuario presente no banco de dados.
 * Esta tabela tem como finalidade representar os usuários que podem realizar
 * login no sistema.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "usuario")
@EqualsAndHashCode(callSuper = false, exclude = "grupos")
public class UsuarioModel extends Auditable implements UserDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "id_usuario", unique = true, nullable = false)
	private Integer id;

	@Column(name = "login_usuario", unique = true, nullable = false, updatable = false, length = 100)
	private String username;

	@Column(name = "senha_usuario", nullable = false, unique = false, length = 80)
	private String password;

	@Column(name = "email", nullable = false, unique = false, length = 50)
	private String email;

	@Column(name = "nome_usuario", nullable = false, unique = false, length = 30)
	private String nome;

	@OneToOne(mappedBy = "usuario", fetch = FetchType.EAGER)
	private transient EgressoModel egresso;

	@ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.MERGE })
	@JoinTable(name = "usuario_grupo", joinColumns = { @JoinColumn(name = "id_usuario") }, inverseJoinColumns = {
			@JoinColumn(name = "id_grupo") }, uniqueConstraints = @UniqueConstraint(columnNames = { "id_usuario",
					"id_grupo" }))
	private Set<GrupoModel> grupos;

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

	@Transient
	public String getFirstName() {
		return this.nome.split(" ")[0];
	}

	@Transient
	public String getLastName() {
		return this.nome.replace(getFirstName(), "");
	}
}
