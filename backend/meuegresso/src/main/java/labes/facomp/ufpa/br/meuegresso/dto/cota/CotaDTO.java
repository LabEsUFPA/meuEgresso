package labes.facomp.ufpa.br.meuegresso.dto.cota;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Cota a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Bruno Eiki
 * @since 21/04/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CotaDTO {

    private Integer id;

    private String nome;
}
