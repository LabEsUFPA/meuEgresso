package labes.facomp.ufpa.br.meuegresso.dto.empresa;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.endereco.EnderecoDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Empresa a fim de representar somente os dados não
 * sensiveis (reduzido).
 *
 * @author Pedro Inácio, Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EmpresaBasicDTO {

    private Integer id;

    @NotBlank(message = "Insira o nome da empresa.")
    private String nome;

    @Valid
    private EnderecoDTO endereco;
}
