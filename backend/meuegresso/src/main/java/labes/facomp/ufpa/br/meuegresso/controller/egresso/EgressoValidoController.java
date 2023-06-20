package labes.facomp.ufpa.br.meuegresso.controller.egresso;

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
import labes.facomp.ufpa.br.meuegresso.exceptions.NotValidEgressoException;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoValidoService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/egressoValido")
public class EgressoValidoController {

    private final ModelMapper mapper;

    private final EgressoValidoService egressosValidosService;

    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    public EgressoValidoDTO validarEgresso(@RequestBody @Valid EgressoValidoDTO egressosValidosDTO)
            throws NotValidEgressoException {
        return mapper.map(egressosValidosService.validarEgresso(Optional.of(egressosValidosDTO.getMatricula()),
                Optional.of(egressosValidosDTO.getNome()), Optional.of(egressosValidosDTO.getEmail())), EgressoValidoDTO.class);
    }

}
