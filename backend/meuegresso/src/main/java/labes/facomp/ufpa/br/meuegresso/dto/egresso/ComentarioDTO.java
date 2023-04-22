package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import lombok.Data;

/**
 * Encapsulamento da tabela Comentario a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Pedro Inácio
 * @since 16/04/2023
 * @version 1.0
 */
@Data
public class ComentarioDTO {
    
    private Integer id;

    private String descricao;
}