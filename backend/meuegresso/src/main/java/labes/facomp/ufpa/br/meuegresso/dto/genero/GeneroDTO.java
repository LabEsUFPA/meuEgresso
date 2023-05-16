package labes.facomp.ufpa.br.meuegresso.dto.genero;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Gênero a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Pedro Inácio, Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class GeneroDTO {

    private Integer id;

    @NotBlank(message = "Insira o nome do gênero.")
    private String nome;

}
