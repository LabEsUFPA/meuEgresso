package labes.facomp.ufpa.br.meuegresso.dto.grupo;

import lombok.Data;

/**
 * Encapsulamento da tabela Grupo a fim de representar somente os dados não sensiveis.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Data
public class GrupoDTO {

    private Integer idGrupo;

    private String nomeGrupo;
}
