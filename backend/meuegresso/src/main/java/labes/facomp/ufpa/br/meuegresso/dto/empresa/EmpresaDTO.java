package labes.facomp.ufpa.br.meuegresso.dto.empresa;

import lombok.Data;

/**
 * Encapsulamento da tabela Empresa a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Pedro Inácio
 * @since 21/04/2023
 * @version 1.0
 */
@Data
public class EmpresaDTO {
    
    private Integer id;

    private String nome;

    private String setorAtuacao;
}
