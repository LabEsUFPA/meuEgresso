package labes.facomp.ufpa.br.meuegresso.dto.administradores.endereco;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Endereco a fim de representar os dados de auditoria.
 *
 * @author Alfredo Gabriel
 * @since 22/04/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EnderecoAttDTO {

    private Integer id;

    @NotBlank(message = "Insira o nome da cidade.")
    private String cidade;

    @NotBlank(message = "Insira o nome do estado.")
    private String estado;

    @NotBlank(message = "Insira o nome do país.")
    private String pais;

    private Integer cidadeId;

}
