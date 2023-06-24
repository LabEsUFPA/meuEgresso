package labes.facomp.ufpa.br.meuegresso.dto.publico.empresa;

import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.dto.publico.endereco.EnderecoPublicDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Empresa a fim de representar somente os dados não
 * sensíveis (reduzido) para rota pública.
 *
 * @author Eude Monteiro
 * @since 22/06/2023 
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmpresaBasicDTO {

    private Integer id;

    @NotBlank(message = "Insira o nome da empresa.")
    private String nome;

    private EnderecoPublicDTO endereco;
}