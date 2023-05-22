package labes.facomp.ufpa.br.meuegresso.dto.cota;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Cota a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Bruno Eiki, Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CotaDTO {

    private Integer id;

    @NotBlank(message = "Informe o nome da cota.")
    private String nome;
}
