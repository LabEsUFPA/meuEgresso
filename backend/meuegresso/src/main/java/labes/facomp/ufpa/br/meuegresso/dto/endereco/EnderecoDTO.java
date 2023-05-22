package labes.facomp.ufpa.br.meuegresso.dto.endereco;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * Encapsulamento da tabela Endereco a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Pedro Inácio
 * @since 13/05/2023
 * @version 1.1
 */
@Data
public class EnderecoDTO {

    private Integer id;

    @NotBlank(message = "Insira o nome da cidade.")
    private String cidade;

    @NotBlank(message = "Insira o nome do estado.")
    private String estado;

    @NotBlank(message = "Insira o nome do pais.")
    private String pais;
}
