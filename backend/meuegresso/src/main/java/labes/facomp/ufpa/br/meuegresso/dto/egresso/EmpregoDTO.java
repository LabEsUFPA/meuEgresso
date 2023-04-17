package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;
import lombok.Data;

/**
 * 
 *
 * @author João Paulo
 * @since 16/04/2023
 * @version 1.0
 */
@Data
public class EmpregoDTO {

    private EgressoEmpresaModelId id;

    @Valid
    private EgressoModel egresso;

    private EmpresaModel empresa;

    private FaixaSalarialModel faixaSalarial;
}
