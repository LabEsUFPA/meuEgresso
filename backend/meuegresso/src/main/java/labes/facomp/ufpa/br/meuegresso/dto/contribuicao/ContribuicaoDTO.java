package labes.facomp.ufpa.br.meuegresso.dto.contribuicao;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dados referentes a contribuição do egresso.
 *
 * @author João Paulo, Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContribuicaoDTO {

    private Integer id;

    @NotBlank(message = "Informe a descrição da contribuição.")
    private String descricao;

}
