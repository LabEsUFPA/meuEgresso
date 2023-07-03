package labes.facomp.ufpa.br.meuegresso.dto.palestra;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento referentes as palestras que o egresso pode ministrar (reduzido).
 *
 * @author Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PalestraDTO {

    private Integer id;

    @NotBlank(message = "Insira a descrição dos topicos que você pode abordar na palestra.")
    private String descricao;

    private Integer egressoId;
}
