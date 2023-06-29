package labes.facomp.ufpa.br.meuegresso.dto.publico.egresso;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.dto.areaatuacao.AreaAtuacaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.empresa.EmpresaBasicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.endereco.EnderecoPublicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.setoratuacao.SetorAtuacaoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dados que representam o relacionamento do egresso com a empresa (reduzido).
 *
 * @author Eude Monteiro
 * @since 22/06/2023
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EgressoEmpresaBasicDTO {

    @Valid
    @NotBlank(message = "Insira a id do egresso e da empresa")
    private EgressoEmpresaModelId id = new EgressoEmpresaModelId();

    @Valid
    @NotBlank(message = "Insira os dados da empresa.")
    private EmpresaBasicDTO empresa;

    @NotBlank(message = "Insira a área de atuação do egresso.")
    private AreaAtuacaoDTO areaAtuacao;

    private SetorAtuacaoDTO setorAtuacao;

    private EnderecoPublicDTO endereco;

}
