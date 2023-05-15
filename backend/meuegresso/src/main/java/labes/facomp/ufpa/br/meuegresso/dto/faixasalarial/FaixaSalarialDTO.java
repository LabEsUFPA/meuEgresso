package labes.facomp.ufpa.br.meuegresso.dto.faixasalarial;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela FaixaSalarial a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Pedro Inácio
 * @since 16/04/2023
 * @version 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FaixaSalarialDTO {
    
    private Integer id;
    
    private String faixa;
}
