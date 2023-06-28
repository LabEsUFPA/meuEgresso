package labes.facomp.ufpa.br.meuegresso.controller.genero;

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
import labes.facomp.ufpa.br.meuegresso.dto.genero.GeneroDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.genero.GeneroService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer end-points para genero.
 *
 * @author Bruno Eiki
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/genero")
public class GeneroController {

    private final GeneroService generoService;

    private final ModelMapper mapper;

    private final JwtService jwtService;

    /**
     * Endpoint responsavel por buscar todos generos do banco.
     *
     * @return {@link List<GeneroDTO} Retorna uma lista com todos os generos.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public List<GeneroDTO> buscarGeneros() {

        return mapper.map(generoService.findAll(), new TypeToken<List<GeneroDTO>>() {
        }.getType());
    }

    /**
     * Endpoint responsavel por adicionar uma genero no banco.
     *
     * @param generoDTO Estrutura de dados contendo as informações necessárias para
     *                  adicionar uma cota.
     * @return {@link String} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String cadastrarGenero(
            @RequestBody @Valid GeneroDTO generoDTO) {
        GeneroModel generoModel = mapper.map(generoDTO, GeneroModel.class);
        generoService.save(generoModel);
        return ResponseType.SUCCESS_SAVE.getMessage();
    }

    /**
     * Endpoint responsavel por atualizar um genero no banco.
     *
     * @param generoDTO Estrutura de dados contendo as informações necessárias para
     *                  atualizar um genero.
     * @return {@link String} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @throws UnauthorizedRequestException
     * @since 21/04/2023
     */
    @PutMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String atualizarGenero(@RequestBody @Valid GeneroDTO generoDTO, JwtAuthenticationToken token)
            throws InvalidRequestException, UnauthorizedRequestException {
        if (generoService.existsByIdAndCreatedBy(generoDTO.getId(), jwtService.getIdUsuario(token))) {
            GeneroModel generoModel = mapper.map(generoDTO, GeneroModel.class);
            generoService.update(generoModel);
            return ResponseType.SUCCESS_UPDATE.getMessage();
        }
        throw new UnauthorizedRequestException();
    }

    /**
     * Endpoint responsavel por deletar um genero no banco.
     *
     * @param generoDTO Estrutura de dados contendo as informações necessárias para
     *                  deletar um genero.
     * @return {@link String} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @DeleteMapping
    @ResponseStatus(code = HttpStatus.OK)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String deletarGenero(@RequestBody @Valid GeneroDTO generoDTO) {

        GeneroModel generoModel = mapper.map(generoDTO, GeneroModel.class);
        generoService.deleteById(generoModel.getId());
        return ResponseType.SUCCESS_DELETE.getMessage();
    }
}
