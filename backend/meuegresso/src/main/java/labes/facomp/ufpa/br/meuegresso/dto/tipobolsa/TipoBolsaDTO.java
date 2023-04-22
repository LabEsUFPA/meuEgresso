package labes.facomp.ufpa.br.meuegresso.dto.tipobolsa;

import lombok.Data;

/**
 * Encapsulamento da tabela TipoBolsa a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Pedro Inácio
 * @since 16/04/2023
 * @version 1.0
 */
@Data
public class TipoBolsaDTO {
    
    private Integer id;
    
    private String nome;

    private double remuneracao;
}
