package labes.facomp.ufpa.br.meuegresso.controller.administrador.egresso;

import java.io.IOException;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import lombok.RequiredArgsConstructor;


/**
 * Responsável por fornecer um endpoint ao administrador para deletar foto de Egresso.
 * 
 * @author Camilo Santos
 * @since 13/05/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/administrador/egresso")
public class EgressoAdmController {
    
    private final EgressoService egressoService;

    @ResponseStatus(code = HttpStatus.OK)
    @DeleteMapping(value = "/foto/{id}")
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String deleteFotoEgresso(@PathVariable Integer id) throws IOException {
        EgressoModel egressoModel = egressoService.findById(id);
        if (egressoModel.getFotoNome() != null) {
            egressoService.deleteFile(egressoModel.getFotoNome());
            egressoModel.setFotoNome(null);
            egressoService.updateEgresso(egressoModel);
            return ResponseType.SUCESS_IMAGE_DELETE.getMessage();
        }
        return ResponseType.FAIL_IMAGE_DELETE.getMessage();
    }

}
