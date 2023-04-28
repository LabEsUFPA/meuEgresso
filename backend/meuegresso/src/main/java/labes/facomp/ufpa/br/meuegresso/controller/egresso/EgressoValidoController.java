package labes.facomp.ufpa.br.meuegresso.controller.egresso;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoValidoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoValidoModel;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoValidoService;
import lombok.RequiredArgsConstructor;


@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/egressosValidos")
public class EgressoValidoController {

    private final ModelMapper mapper;

    private final EgressoValidoService egressosValidosService;

    @PostMapping(value="/validarEgresso")
    @ResponseStatus(code = HttpStatus.OK)
    public EgressoValidoDTO validarEgresso(@RequestBody @Valid EgressoValidoDTO egressosValidosDTO) {
        if (egressosValidosDTO.getMatricula() != null) {
            Optional<EgressoValidoModel> egressoValidoModel = egressosValidosService.findByMatricula(egressosValidosDTO.getMatricula());
            if (egressoValidoModel.isPresent()) {
                return mapper.map(egressoValidoModel, EgressoValidoDTO.class);
            }
        }
        if (egressosValidosDTO.getEmail() != null){
            Optional<EgressoValidoModel> egressoValidoModel = egressosValidosService.findByEmail(egressosValidosDTO.getEmail());
            if (egressoValidoModel.isPresent()) {
                return mapper.map(egressoValidoModel, EgressoValidoDTO.class);
            }
        }
        List<EgressoValidoModel> egressoValidoModels = egressosValidosService.findByNomeIgnoreCase(egressosValidosDTO.getNome());
        if (egressoValidoModels.size() == 1) {
            return mapper.map(egressoValidoModels.get(0), EgressoValidoDTO.class);
        } else {
            return mapper.map(egressoValidoModels.get(0), EgressoValidoDTO.class);
        }
    }

}
