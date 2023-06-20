package labes.facomp.ufpa.br.meuegresso.controller.titulacao;

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
import labes.facomp.ufpa.br.meuegresso.dto.titulacao.TitulacaoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.titulacao.TitulacaoService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer end-points para tipo bolsa.
 *
 * @author Bruno Eiki
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/titulacao")
public class TitulacaoController {

    private final TitulacaoService titulacaoService;

    private final ModelMapper mapper;

    private final JwtService jwtService;

    /**
     * Endpoint responsavel por buscar todas as Titulacao do banco.
     *
     * @return {@link List<TitulacaoDTO>} Retorna uma lista com todos os Titulacao.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public List<TitulacaoDTO> buscarTitulacaos() {

        return mapper.map(titulacaoService.findAll(), new TypeToken<List<TitulacaoDTO>>() {
        }.getType());
    }

    /**
     * Endpoint responsavel por adicionar um Titulacao no banco.
     *
     * @param titulacaoDTO Estrutura de dados contendo as informações necessárias
     *                     para
     *                     adicionar um titulacao.
     * @return {@link String} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String cadastrarTitulacao(
            @RequestBody @Valid TitulacaoDTO titulacaoDTO) {
        TitulacaoModel titulacaoModel = mapper.map(titulacaoDTO, TitulacaoModel.class);
        titulacaoService.save(titulacaoModel);
        return ResponseType.SUCCESS_SAVE.getMessage();
    }

    /**
     * Endpoint responsavel por atualizar uma Titulacao no banco.
     *
     * @param titulacaoDTO Estrutura de dados contendo as informações necessárias
     *                     para
     *                     atualizar uma Titulacao.
     * @param token login para ter a permissão para atualizar a titulacao
     * @return {@link String} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @PutMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String atualizarTitulacao(@RequestBody @Valid TitulacaoDTO titulacaoDTO, JwtAuthenticationToken token)
            throws InvalidRequestException, UnauthorizedRequestException {
        if (titulacaoService.existsByIdAndCreatedById(titulacaoDTO.getId(), jwtService.getIdUsuario(token))) {
            TitulacaoModel titulacaoModel = mapper.map(titulacaoDTO, TitulacaoModel.class);
            titulacaoService.update(titulacaoModel);
            return ResponseType.SUCCESS_UPDATE.getMessage();
        }
        throw new UnauthorizedRequestException();
    }

    /**
     * Endpoint responsavel por deletar uma Titulacao no banco.
     *
     * @param titulacaoDTO Estrutura de dados contendo as informações necessárias
     *                     para
     *                     deletar um Titulacao.
     * @return {@link String} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @DeleteMapping
    @ResponseStatus(code = HttpStatus.OK)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String deletarTitulacao(@RequestBody @Valid TitulacaoDTO titulacaoDTO) {

        TitulacaoModel titulacaoModel = mapper.map(titulacaoDTO, TitulacaoModel.class);
        titulacaoService.deleteById(titulacaoModel.getId());
        return ResponseType.SUCCESS_DELETE.getMessage();
    }
}
