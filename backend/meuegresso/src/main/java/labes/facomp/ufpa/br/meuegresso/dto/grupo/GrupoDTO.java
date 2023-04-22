package labes.facomp.ufpa.br.meuegresso.dto.grupo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Grupo a fim de representar somente os dados não sensiveis.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GrupoDTO {

	private Integer idGrupo;

	private String nomeGrupo;
}
