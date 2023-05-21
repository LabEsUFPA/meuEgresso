package labes.facomp.ufpa.br.meuegresso.dto.administradores.grupo;

import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.AuditableDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Grupo a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class GrupoDTO extends AuditableDTO {

	private Integer id;

	@NotBlank(message = "Insira o nome do grupo.")
	private String nomeGrupo;
}
