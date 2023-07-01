package labes.facomp.ufpa.br.meuegresso.dto.depoimento;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dados de depoimento do egresso.
 *
 * @author João Paulo, Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DepoimentoDTO {

    private Integer id;

    @NotBlank(message = "Informe o conteudo do depoimento.")
    private String descricao;

    @Builder.Default
    private Boolean ativo = false;

    @Builder.Default
    private Boolean favorito = false;
}
