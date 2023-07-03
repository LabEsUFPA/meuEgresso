package labes.facomp.ufpa.br.meuegresso.dto.faixasalarial;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela FaixaSalarial a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Pedro Inácio, Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FaixaSalarialDTO {

    private Integer id;

    @NotBlank(message = "Insira o intervalo da faixa salarial.")
    private String faixa;
}
