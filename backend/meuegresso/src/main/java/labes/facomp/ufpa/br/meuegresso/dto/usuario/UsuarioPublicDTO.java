package labes.facomp.ufpa.br.meuegresso.dto.usuario;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoPublicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grupo.GrupoDTO;
import lombok.Data;

/**
 * Encapsulamento da tabela Grupo a fim de representar somente os dados não
 * sensiveis.
 * Nota: Use este DTO somente para persistir o usuário, não retorne o mesmo.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 26/03/2023
 * @version 1.0.1
 */
@Data
public class UsuarioPublicDTO {

	private Integer id;

	@NotBlank(message = "Infome um usuário.")
	private String username;

	@Email(message = "Informe um e-mail valido.")
	@NotBlank(message = "Infome um email.")
	private String email;

	@NotBlank(message = "Infome um nome.")
	private String nome;

	@NotNull(message = "Infome uma data de nascimento.")
	private Date nascimento;

	@Valid
	private EgressoPublicDTO egresso;

	private Set<GrupoDTO> grupos = new HashSet<>();
}
