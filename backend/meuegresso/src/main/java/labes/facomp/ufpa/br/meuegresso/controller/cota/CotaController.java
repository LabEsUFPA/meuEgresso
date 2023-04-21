package labes.facomp.ufpa.br.meuegresso.controller.cota;

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
import labes.facomp.ufpa.br.meuegresso.dto.egresso.CotaDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.CotaModel;
import labes.facomp.ufpa.br.meuegresso.service.cota.CotaService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping()
public class CotaController {

    private final CotaService cotaService;

    private final ModelMapper mapper;

    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public List<CotaDTO> buscarCotas() {

        return mapper.map(cotaService.findAll(), new TypeToken<List<CotaDTO>>() {
        }.getType());
    }

    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    public String cadastrarCota(
            @RequestBody @Valid CotaDTO cotaDTO) {
        CotaModel cotaModel = mapper.map(cotaDTO, CotaModel.class);
        cotaService.save(cotaModel);
        return ResponseType.COTA_SUCESS_SAVE.getMessage();
    }

    @PutMapping
    @ResponseStatus(code = HttpStatus.ACCEPTED)
    public String atualizarCota(@RequestBody @Valid CotaDTO cotaDTO) throws InvalidRequestException {

        CotaModel cotaModel = mapper.map(cotaDTO, CotaModel.class);
        cotaService.update(cotaModel);
        return ResponseType.COTA_SUCESS_UPDATE.getMessage();
    }

    @DeleteMapping
    @ResponseStatus(code = HttpStatus.OK)
    public String deletarCota(@RequestBody @Valid CotaDTO cotaDTO) throws InvalidRequestException {

        CotaModel cotaModel = mapper.map(cotaDTO, CotaModel.class);
        cotaService.deleteById(cotaModel.getId());
        return ResponseType.COTA_SUCESS_DELETE.getMessage();
    }
}
