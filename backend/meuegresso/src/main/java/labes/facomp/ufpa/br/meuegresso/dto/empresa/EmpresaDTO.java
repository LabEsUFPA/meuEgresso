package labes.facomp.ufpa.br.meuegresso.dto.empresa;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.endereco.EnderecoDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Empresa a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Pedro Inácio
 * @since 21/04/2023
 * @version 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EmpresaDTO {

    private Integer id;

    private String nome;

    private String setorAtuacao;

    private String areaAtuacao;

    private Integer faixaSalarialId;

    private EnderecoDTO endereco;

    private Boolean isEmprego;
}
