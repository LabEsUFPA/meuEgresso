package labes.facomp.ufpa.br.meuegresso.dto.administradores.empresa;

import java.util.Set;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.AuditableDTO;
import labes.facomp.ufpa.br.meuegresso.dto.endereco.EnderecoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.setoratuacao.SetorAtuacaoDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Empresa a fim de representar os dados de auditoria.
 *
 * @author Alfredo Gabriel
 * @since 22/04/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class EmpresaDTO extends AuditableDTO {

    private Integer id;

    private String nome;

    private Set<SetorAtuacaoDTO> setorAtuacoes;

    private EnderecoDTO endereco;
}
