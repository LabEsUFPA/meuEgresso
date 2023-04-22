package labes.facomp.ufpa.br.meuegresso.dto.cota;

import lombok.Data;

/**
 * Encapsulamento da tabela Cota a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Bruno Eiki
 * @since 21/04/2023
 * @version 1.0
 */
@Data
public class CotaDTO {
    private Integer id;

    private String nome;
}
