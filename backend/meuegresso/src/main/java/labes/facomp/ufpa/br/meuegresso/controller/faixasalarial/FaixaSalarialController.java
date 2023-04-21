package labes.facomp.ufpa.br.meuegresso.controller.faixasalarial;

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
import labes.facomp.ufpa.br.meuegresso.dto.egresso.FaixaSalarialDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;
import labes.facomp.ufpa.br.meuegresso.service.faixasalarial.FaixaSalarialService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/faixaSalarial")
public class FaixaSalarialController {

    private final FaixaSalarialService faixaSalarialService;

    private final ModelMapper mapper;

    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public List<FaixaSalarialDTO> buscarFaixaSalarials() {

        return mapper.map(faixaSalarialService.findAll(), new TypeToken<List<FaixaSalarialDTO>>() {
        }.getType());
    }

    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    public String cadastrarFaixaSalarial(
            @RequestBody @Valid FaixaSalarialDTO faixaSalarialDTO) {
        FaixaSalarialModel faixaSalarialModel = mapper.map(faixaSalarialDTO, FaixaSalarialModel.class);
        faixaSalarialService.save(faixaSalarialModel);
        return ResponseType.SUCESS_SAVE.getMessage();
    }

    @PutMapping
    @ResponseStatus(code = HttpStatus.ACCEPTED)
    public String atualizarFaixaSalarial(@RequestBody @Valid FaixaSalarialDTO faixaSalarialDTO)
            throws InvalidRequestException {

        FaixaSalarialModel faixaSalarialModel = mapper.map(faixaSalarialDTO, FaixaSalarialModel.class);
        faixaSalarialService.update(faixaSalarialModel);
        return ResponseType.SUCESS_UPDATE.getMessage();
    }

    @DeleteMapping
    @ResponseStatus(code = HttpStatus.OK)
    public String deletarFaixaSalarial(@RequestBody @Valid FaixaSalarialDTO faixaSalarialDTO) {

        FaixaSalarialModel faixaSalarialModel = mapper.map(faixaSalarialDTO, FaixaSalarialModel.class);
        faixaSalarialService.deleteById(faixaSalarialModel.getId());
        return ResponseType.SUCESS_DELETE.getMessage();
    }
}
