package labes.facomp.ufpa.br.meuegresso.controller.titulacao;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/titulacao")
public class TitulacaoController {

    private final TitulacaoService titulacaoService;

    private final ModelMapper mapper;

    private final JwtService jwtService;

    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public List<TitulacaoDTO> buscarTitulacaos() {

        return mapper.map(titulacaoService.findAll(), new TypeToken<List<TitulacaoDTO>>() {
        }.getType());
    }

    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String cadastrarTitulacao(
            @RequestBody @Valid TitulacaoDTO titulacaoDTO) {
        TitulacaoModel titulacaoModel = mapper.map(titulacaoDTO, TitulacaoModel.class);
        titulacaoService.save(titulacaoModel);
        return ResponseType.SUCESS_SAVE.getMessage();
    }

    @PutMapping
    @ResponseStatus(code = HttpStatus.ACCEPTED)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String atualizarTitulacao(@RequestBody @Valid TitulacaoDTO titulacaoDTO, JwtAuthenticationToken token)
            throws InvalidRequestException, UnauthorizedRequestException {
        if (jwtService.getIdUsuario(token).equals(titulacaoDTO.getId())) {
            TitulacaoModel titulacaoModel = mapper.map(titulacaoDTO, TitulacaoModel.class);
            titulacaoService.update(titulacaoModel);
            return ResponseType.SUCESS_UPDATE.getMessage();
        }
        throw new UnauthorizedRequestException();
    }

    @DeleteMapping(value = "/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    @ResponseStatus(code = HttpStatus.OK)
    @Operation(security = { @SecurityRequirement(name = "Bearer") })
    public String deleteById(@PathVariable(name = "id") Integer id) {
        if (titulacaoService.deleteById(id)) {
            return ResponseType.SUCESS_DELETE.getMessage();
        } else {
            return ResponseType.FAIL_DELETE.getMessage();
        }
    }
}
