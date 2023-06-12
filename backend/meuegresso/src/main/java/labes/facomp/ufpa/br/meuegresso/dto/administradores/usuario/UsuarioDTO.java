package labes.facomp.ufpa.br.meuegresso.dto.administradores.usuario;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.AuditableDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso.EgressoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.grupo.GrupoDTO;
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
public class UsuarioDTO extends AuditableDTO {

	private Integer id;

	@NotBlank(message = "Infome um usuário.")
	private String username;

	@Email
	@NotBlank(message = "Infome um email.")
	private String email;

	@NotBlank(message = "Infome um nome.")
	private String nome;

	@NotNull(message = "Informe uma data de nascimento.")
	private LocalDate nascimento;

	@Valid
	private EgressoDTO egresso;

	private Set<GrupoDTO> grupos = new HashSet<>();

}
