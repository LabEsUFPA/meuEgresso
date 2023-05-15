package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.dto.areaatuacao.AreaAtuacaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaCastroEgressoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.faixasalarial.FaixaSalarialDTO;
import labes.facomp.ufpa.br.meuegresso.dto.setoratuacao.SetorAtuacaoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dados que representam o relacionamento do egresso com a empresa (reduzido).
 *
 * @author João Paulo, Pedro Inácio, Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
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
    private EmpresaCastroEgressoDTO empresa;

    @NotBlank(message = "Insira a faixa salarial.")
    private FaixaSalarialDTO faixaSalarial;

    @NotBlank(message = "Insira a área de atuação do egresso.")
    private AreaAtuacaoDTO areaAtuacao;

    private SetorAtuacaoDTO setorAtuacao;
}
