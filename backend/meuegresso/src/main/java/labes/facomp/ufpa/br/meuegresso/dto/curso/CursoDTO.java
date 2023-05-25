package labes.facomp.ufpa.br.meuegresso.dto.curso;

import jakarta.validation.constraints.NotBlank;
import lombok.Builder;
import lombok.Data;

/**
 * Encapsulamento da tabela Curso a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Pedro Inácio, Alfredo Gabriel
 * @since 15/05/2023
 * @version 1.2
 */
@Data
@Builder
public class CursoDTO {

    private Integer id;

    @NotBlank(message = "Informe o nome do curso.")
    private String nome;
}
