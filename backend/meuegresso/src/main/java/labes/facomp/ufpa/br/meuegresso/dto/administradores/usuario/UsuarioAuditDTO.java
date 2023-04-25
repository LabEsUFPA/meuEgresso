package labes.facomp.ufpa.br.meuegresso.dto.administradores.usuario;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.AuditableDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Usuario a fim de representar os dados de auditoria.
 *
 * @author Alfredo Gabriel
 * @since 22/04/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class UsuarioAuditDTO extends AuditableDTO {

	private Integer id;

	@NotBlank(message = "Infome um usuário.")
	private String username;

	@Email
	@NotBlank(message = "Infome um email.")
	private String email;

	@NotBlank(message = "Infome um nome.")
	private String nome;

}
