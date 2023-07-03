package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import labes.facomp.ufpa.br.meuegresso.dto.areaatuacao.AreaAtuacaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaBasicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.endereco.EnderecoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.faixasalarial.FaixaSalarialDTO;
import labes.facomp.ufpa.br.meuegresso.dto.setoratuacao.SetorAtuacaoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dados que representam o relacionamento do egresso com a empresa.
 *
 * @author João Paulo, Pedro Inácio, Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EgressoEmpresaDTO {

    @Valid
    @NotNull(message = "Insira a id do egresso e da empresa.")
    private EgressoEmpresaModelId id;

    @Valid
    @NotNull(message = "Informe o egresso.")
    private EgressoPublicDTO egresso;

    @Valid
    @NotNull(message = "Insira os dados da empresa.")
    private EmpresaBasicDTO empresa;

    @Valid
    @NotNull(message = "Insira o endereço")
    private EnderecoDTO endereco;

    @NotNull(message = "Insira a área de atuação do egresso.")
    private AreaAtuacaoDTO areaAtuacao;

    @Valid
    @NotNull(message = "Insira a faixa salarial.")
    private FaixaSalarialDTO faixaSalarial;

    @Valid
    @NotNull(message = "Insira o setor de atuação")
    private SetorAtuacaoDTO setorAtuacao;

}
