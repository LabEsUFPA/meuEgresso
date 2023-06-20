package labes.facomp.ufpa.br.meuegresso.controller.areaemprego;

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
import labes.facomp.ufpa.br.meuegresso.dto.areaemprego.AreaEmpregoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AreaEmpregoModel;
import labes.facomp.ufpa.br.meuegresso.service.areaemprego.AreaEmpregoService;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer end-points para area de emprego do anúncio.
 *
 * @author Lucas Cantão
 * @since 18/05/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/areaemprego")
public class AreaEmpregoController {

    private final AreaEmpregoService areaEmpregoService;

    private final ModelMapper mapper;

    private final JwtService jwtService;

    /**
     * Endpoint responsavel por buscar todas as áreas de emprego.
     *
     * @return {@link List<AreaEmpregoDTO>} Retorna uma lista com todas as áreas de
     *         emprego.
     * @author Lucas Cantão
     * @since 18/05/2023
     */
    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public List<AreaEmpregoDTO> buscarGeneros() {

        return mapper.map(areaEmpregoService.findAll(), new TypeToken<List<AreaEmpregoDTO>>() {
        }.getType());
    }

    /**
     * Endpoint responsavel por adicionar uma área de emprego no banco.
     *
     * @param areaEmpregoDTO Estrutura de dados contendo as informações necessárias
     *                       para
     *                       adicionar uma Area de Emprego.
     * @return {@link String} Mensagem de confirmacao.
     * @author Lucas Cantão
     * @since 18/05/2023
     */
    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String cadastrarGenero(
            @RequestBody @Valid AreaEmpregoDTO areaEmpregoDTO) {
        AreaEmpregoModel areaEmpregoModel = mapper.map(areaEmpregoDTO, AreaEmpregoModel.class);
        areaEmpregoService.save(areaEmpregoModel);
        return ResponseType.SUCCESS_SAVE.getMessage();
    }

    /**
     * Endpoint responsavel por atualizar uma área de emprego no banco.
     *
     * @param areaEmpregoDTO Estrutura de dados contendo as informações necessárias
     *                       para
     *                       atualizar uma area de emprego.
     * @return {@link String} Mensagem de confirmacao.
     * @author Lucas Cantão
     * @since 18/05/2023
     */
    @PutMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String atualizarGenero(@RequestBody @Valid AreaEmpregoDTO areaEmpregoDTO, JwtAuthenticationToken token)
            throws InvalidRequestException, UnauthorizedRequestException {
        if (areaEmpregoService.existsByIdAndCreatedById(areaEmpregoDTO.getId(), jwtService.getIdUsuario(token))) {
            AreaEmpregoModel areaEmpregoModel = mapper.map(areaEmpregoDTO, AreaEmpregoModel.class);
            areaEmpregoService.update(areaEmpregoModel);
            return ResponseType.SUCCESS_UPDATE.getMessage();
        }
        throw new UnauthorizedRequestException();
    }

    /**
     * Endpoint responsavel por deletar uma area de emprego.
     *
     * @param areaEmpregoDTO Estrutura de dados contendo as informações necessárias
     *                       para
     *                       deletar uma area de emprego.
     * @return {@link String} Mensagem de confirmacao.
     * @author Lucas Cantão
     * @since 18/05/2023
     */
    @DeleteMapping
    @ResponseStatus(code = HttpStatus.OK)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String deletarGenero(@RequestBody @Valid AreaEmpregoDTO areaEmpregoDTO) {

        AreaEmpregoModel areaEmpregoModel = mapper.map(areaEmpregoDTO, AreaEmpregoModel.class);
        areaEmpregoService.deleteById(areaEmpregoModel.getId());
        return ResponseType.SUCCESS_DELETE.getMessage();
    }

}
