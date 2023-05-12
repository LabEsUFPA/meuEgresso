package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaMapaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioMapaDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import lombok.Data;

/**
 *  Representa os dados do egresso a serem mostrados no mapa
 *
 * @author Bruno Eiki, Pedro Inácio
 * @since 08/05/2023
 * @version 1.0
 */
@Data
public class EgressoMapaDTO {

    private EgressoEmpresaModelId id;

    @Valid
    private UsuarioMapaDTO usuario;

    @Valid
    private EmpresaMapaDTO empresaMapaDTO;
}
