package labes.facomp.ufpa.br.meuegresso.controller.titulacao;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.titulacao.TitulacaoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.service.titulacao.TitulacaoService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/titulacao")
public class TitulacaoController {

    private final TitulacaoService titulacaoService;

    private final ModelMapper mapper;

    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public List<TitulacaoDTO> buscarTitulacaos() {

        return mapper.map(titulacaoService.findAll(), new TypeToken<List<TitulacaoDTO>>() {
        }.getType());
    }

    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    public String cadastrarTitulacao(
            @RequestBody @Valid TitulacaoDTO titulacaoDTO) {
        TitulacaoModel titulacaoModel = mapper.map(titulacaoDTO, TitulacaoModel.class);
        titulacaoService.save(titulacaoModel);
        return ResponseType.SUCESS_SAVE.getMessage();
    }

    @PutMapping
    @ResponseStatus(code = HttpStatus.ACCEPTED)
    public String atualizarTitulacao(@RequestBody @Valid TitulacaoDTO titulacaoDTO) throws InvalidRequestException {

        TitulacaoModel titulacaoModel = mapper.map(titulacaoDTO, TitulacaoModel.class);
        titulacaoService.update(titulacaoModel);
        return ResponseType.SUCESS_UPDATE.getMessage();
    }

    @DeleteMapping
    @ResponseStatus(code = HttpStatus.OK)
    public String deletarTitulacao(@RequestBody @Valid TitulacaoDTO titulacaoDTO) {

        TitulacaoModel titulacaoModel = mapper.map(titulacaoDTO, TitulacaoModel.class);
        titulacaoService.deleteById(titulacaoModel.getId());
        return ResponseType.SUCESS_DELETE.getMessage();
    }
}
