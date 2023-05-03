package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.faixasalarial.FaixaSalarialDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import lombok.Data;

/**
 * 
 *
 * @author João Paulo, Pedro Inácio
 * @since 16/04/2023
 * @version 1.0
 */
@Data
public class EgressoEmpresaDTO {

    private EgressoEmpresaModelId id;

    @Valid
    private EgressoPublicDTO egresso;

    private EmpresaDTO empresa;

    private String areaAtuacao;

    private FaixaSalarialDTO faixaSalarial;
}
