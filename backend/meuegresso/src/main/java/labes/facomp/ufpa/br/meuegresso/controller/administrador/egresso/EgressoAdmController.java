package labes.facomp.ufpa.br.meuegresso.controller.administrador.egresso;

import java.io.IOException;

import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.enumeration.UsuarioStatus;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.StatusUsuarioModel;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import labes.facomp.ufpa.br.meuegresso.service.statususuario.StatusUsuarioService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um endpoint ao administrador para deletar foto de
 * Egresso.
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

    private final StatusUsuarioService statusUsuarioService;

    /**
     * Endpoint responsavel por deletar o egresso.
     *
     * @param egressoPublicDTO Estrutura de dados contendo as informações
     *                         necessárias para deletar o egresso.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki, Marcus Maciel Oliveira
     * @since 05/06/2023
     */
    @DeleteMapping(value = "/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    @ResponseStatus(code = HttpStatus.OK)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String deletarEgresso(@PathVariable Integer id) {
        EgressoModel egressoModel = egressoService.findById(id);
        if (egressoModel != null) {
            egressoService.deleteById(id);
            statusUsuarioService.save(StatusUsuarioModel.builder().usuarioId(egressoModel.getUsuario().getId())
                    .nome(egressoModel.getUsuario().getNome())
                    .status(UsuarioStatus.EXCLUIDO).build());
            return ResponseType.SUCCESS_DELETE.getMessage();
        }
        return ResponseType.FAIL_DELETE.getMessage();
    }

    @DeleteMapping(value = "/foto/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    @ResponseStatus(code = HttpStatus.OK)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String deleteFotoEgresso(@PathVariable Integer id) throws IOException {
        EgressoModel egressoModel = egressoService.findById(id);
        if (egressoModel.getFotoNome() != null) {
            egressoService.deleteFile(egressoModel.getFotoNome());
            egressoModel.setFotoNome(null);
            egressoService.updateEgresso(egressoModel);
            return ResponseType.SUCCESS_IMAGE_DELETE.getMessage();
        }
        return ResponseType.FAIL_IMAGE_DELETE.getMessage();
    }

}