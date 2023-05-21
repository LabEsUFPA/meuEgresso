package labes.facomp.ufpa.br.meuegresso.dto.anuncio;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * Encapsulamento da tabela Comentario a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Pedro Inácio, Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
public class ComentarioDTO {

    private Integer id;

    @NotBlank(message = "Informe o conteudo do comentario.")
    private String descricao;

    private Integer anuncioId;

}
