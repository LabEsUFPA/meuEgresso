package labes.facomp.ufpa.br.meuegresso.controller.egresso;

import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoPublicDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/egresso")
public class EgressoController {

    private EgressoService egressoService;
    private final ModelMapper mapper;

    @PostMapping
    public ResponseEntity<EgressoPublicDTO> cadastrarEgresso(@RequestBody EgressoPublicDTO egresso) {
        EgressoModel egressoModel = mapper.map(egresso, EgressoModel.class);
        egressoModel = egressoService.adicionarEgresso(egressoModel);
        return ResponseEntity.ok(mapper.map(egressoModel, EgressoPublicDTO.class));
    }


}
