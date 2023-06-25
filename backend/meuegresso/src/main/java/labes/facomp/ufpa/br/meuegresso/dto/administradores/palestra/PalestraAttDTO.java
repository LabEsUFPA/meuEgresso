package labes.facomp.ufpa.br.meuegresso.dto.administradores.palestra;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento referentes as palestras que o egresso pode ministrar
 * (reduzido).
 *
 * @author Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PalestraAttDTO {

    private Integer id;

    @NotBlank(message = "Insira a descrição dos topicos para serem abordados na palestra.")
    private String descricao;

}
