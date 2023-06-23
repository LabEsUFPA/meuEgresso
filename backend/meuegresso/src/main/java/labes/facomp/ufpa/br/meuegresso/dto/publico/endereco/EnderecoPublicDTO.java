package labes.facomp.ufpa.br.meuegresso.dto.publico.endereco;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Endereco sem os dados de auditoria (para
 * rota pública).
 *
 * @author Eude Monteiro
 * @since 22/04/2023 
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EnderecoPublicDTO {

    private Integer id;

    @NotBlank(message = "Insira o nome da cidade.")
    private String cidade;

    @NotBlank(message = "Insira o nome do estado.")
    private String estado;

    @NotBlank(message = "Insira o nome do país.")
    private String pais;
}
