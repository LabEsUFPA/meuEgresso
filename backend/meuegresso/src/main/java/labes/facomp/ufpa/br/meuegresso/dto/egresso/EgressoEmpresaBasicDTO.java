package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import labes.facomp.ufpa.br.meuegresso.dto.areaatuacao.AreaAtuacaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaBasicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.faixasalarial.FaixaSalarialDTO;
import labes.facomp.ufpa.br.meuegresso.dto.setoratuacao.SetorAtuacaoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 *
 * @author João Paulo, Pedro Inácio
 * @since 16/04/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EgressoEmpresaBasicDTO {

    private EgressoEmpresaModelId id = new EgressoEmpresaModelId();

    private EmpresaBasicDTO empresa;

    private FaixaSalarialDTO faixaSalarial;

    private AreaAtuacaoDTO areaAtuacao;

    private SetorAtuacaoDTO setorAtuacao;
}
