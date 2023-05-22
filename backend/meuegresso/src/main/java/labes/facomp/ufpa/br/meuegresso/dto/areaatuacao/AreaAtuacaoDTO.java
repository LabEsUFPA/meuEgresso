package labes.facomp.ufpa.br.meuegresso.dto.areaatuacao;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Area Atuação.
 *
 * @author Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AreaAtuacaoDTO {

    private Integer id;

    @NotBlank(message = "Informe o nome da area de atuação.")
    private String nome;

}