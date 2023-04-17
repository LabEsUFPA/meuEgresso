package labes.facomp.ufpa.br.meuegresso.dto.usuario;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoPublicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grupo.GrupoDTO;
import lombok.Data;

/**
 * Encapsulamento da tabela Grupo a fim de representar somente os dados não
 * sensiveis.
 * Nota: Use este DTO somente para persistir o usuário, não retorne o mesmo.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Data
public class UsuarioPublicDTO {

	private Integer idUsuario;

	@NotBlank(message = "Infome um usuário.")
	private String username;

	@NotBlank(message = "Infome uma senha.")
	private String password;

	@Email(message = "Informe um e-mail valido.")
	@NotBlank(message = "Infome um email.")
	private String email;

	@NotBlank(message = "Infome um nome.")
	private String nome;

	private Date nascimento;

	@Valid
	private EgressoPublicDTO egresso;

	private Set<GrupoDTO> grupos = new HashSet<>();
}
