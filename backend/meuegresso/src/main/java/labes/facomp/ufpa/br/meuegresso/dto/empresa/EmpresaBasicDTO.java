package labes.facomp.ufpa.br.meuegresso.dto.empresa;

import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.endereco.EnderecoDTO;
import lombok.Data;

/**
 * Encapsulamento da tabela Empresa a fim de representar somente os dados não
 * sensiveis (reduzido).
 *
 * @author Pedro Inácio, Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
public class EmpresaBasicDTO {

    private Integer id;

    @NotBlank(message = "Insira o nome da empresa.")
    private String nome;

    private String setorAtuacoes;

    private EnderecoDTO endereco;
}
