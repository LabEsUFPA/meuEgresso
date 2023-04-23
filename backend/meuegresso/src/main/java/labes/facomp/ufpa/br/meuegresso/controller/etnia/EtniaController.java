package labes.facomp.ufpa.br.meuegresso.controller.etnia;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.http.HttpStatus;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.etnia.EtniaDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EtniaModel;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.etnia.EtniaService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer end-points para Etnia.
 *
 * @author Bruno Eiki
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/etnia")
public class EtniaController {

    private final EtniaService etniaService;

    private final ModelMapper mapper;

    private final JwtService jwtService;

    /**
     * Endpoint responsavel por buscar todas as etnias no banco.
     *
     * @param void
     * @return {@link List<EtniaDTO>} Retorna uma lista com todas etnias.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
    public List<EtniaDTO> buscarEtnias() {

        return mapper.map(etniaService.findAll(), new TypeToken<List<EtniaDTO>>() {
        }.getType());
    }

    /**
     * Endpoint responsavel por adicionar uma etnia no banco.
     *
     * @param etniaDTO Estrutura de dados contendo as informações necessárias para
     *                 adicionar uma cota.
     * @return {@link String} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String cadastrarEtnia(
            @RequestBody @Valid EtniaDTO etniaDTO) {
        EtniaModel etniaModel = mapper.map(etniaDTO, EtniaModel.class);
        etniaService.save(etniaModel);
        return ResponseType.SUCESS_SAVE.getMessage();
    }

    /**
     * Endpoint responsavel por atualizar uma etnia no banco.
     *
     * @param etniaDTO Estrutura de dados contendo as informações necessárias para
     *                 atualizar uma cota.
     * @return {@link String} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @throws UnauthorizedRequestException
     * @since 21/04/2023
     */
    @PutMapping
    @ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String atualizarEtnia(@RequestBody @Valid EtniaDTO etniaDTO,
            JwtAuthenticationToken token) throws InvalidRequestException, UnauthorizedRequestException {
        if (etniaService.existsByIdAndCreatedById(etniaDTO.getId(), jwtService.getIdUsuario(token))) {
            EtniaModel etniaModel = mapper.map(etniaDTO, EtniaModel.class);
            etniaService.update(etniaModel);
            return ResponseType.SUCESS_UPDATE.getMessage();
        }
        throw new UnauthorizedRequestException();
    }

    /**
     * Endpoint responsavel por deletar uma etnia no banco.
     *
     * @param etniaDTO Estrutura de dados contendo as informações necessárias para
     *                 deletar uma cota.
     * @return {@link String} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @DeleteMapping
    @ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String deletarEtnia(@RequestBody @Valid EtniaDTO etniaDTO) {

        EtniaModel etniaModel = mapper.map(etniaDTO, EtniaModel.class);
        etniaService.deleteById(etniaModel.getId());
        return ResponseType.SUCESS_DELETE.getMessage();
    }
}