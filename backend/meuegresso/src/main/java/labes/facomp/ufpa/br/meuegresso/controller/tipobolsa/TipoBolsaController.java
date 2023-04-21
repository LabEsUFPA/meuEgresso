package labes.facomp.ufpa.br.meuegresso.controller.tipobolsa;

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
import labes.facomp.ufpa.br.meuegresso.dto.egresso.TipoBolsaDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.TipoBolsaModel;
import labes.facomp.ufpa.br.meuegresso.service.tipobolsa.TipoBolsaService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/tipoBolsa")
public class TipoBolsaController {

    private final TipoBolsaService tipoBolsaService;

    private final ModelMapper mapper;

    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public List<TipoBolsaDTO> buscarTipoBolsas() {

        return mapper.map(tipoBolsaService.findAll(), new TypeToken<List<TipoBolsaDTO>>() {
        }.getType());
    }

    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    public String cadastrarTipoBolsa(
            @RequestBody @Valid TipoBolsaDTO tipoBolsaDTO) {
        TipoBolsaModel tipoBolsaModel = mapper.map(tipoBolsaDTO, TipoBolsaModel.class);
        tipoBolsaService.save(tipoBolsaModel);
        return ResponseType.SUCESS_SAVE.getMessage();
    }

    @PutMapping
    @ResponseStatus(code = HttpStatus.ACCEPTED)
    public String atualizarTipoBolsa(@RequestBody @Valid TipoBolsaDTO tipoBolsaDTO) throws InvalidRequestException {

        TipoBolsaModel tipoBolsaModel = mapper.map(tipoBolsaDTO, TipoBolsaModel.class);
        tipoBolsaService.update(tipoBolsaModel);
        return ResponseType.SUCESS_UPDATE.getMessage();
    }

    @DeleteMapping
    @ResponseStatus(code = HttpStatus.OK)
    public String deletarTipoBolsa(@RequestBody @Valid TipoBolsaDTO tipoBolsaDTO) {

        TipoBolsaModel tipoBolsaModel = mapper.map(tipoBolsaDTO, TipoBolsaModel.class);
        tipoBolsaService.deleteById(tipoBolsaModel.getId());
        return ResponseType.SUCESS_DELETE.getMessage();
    }
}
