package labes.facomp.ufpa.br.meuegresso.dto.grupo;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Grupo a fim de representar somente os dados não sensiveis.
 *
 * @author Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GrupoDTO {

	private Integer id;

	@NotBlank(message = "Insira o nome do grupo.")
	private String nomeGrupo;
}
