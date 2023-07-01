package labes.facomp.ufpa.br.meuegresso.controller.publico.depoimento;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nimbusds.jose.shaded.gson.reflect.TypeToken;

import labes.facomp.ufpa.br.meuegresso.dto.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.service.depoimento.DepoimentoService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/publico/depoimento")
public class DepoimentoPubController {
    
	private final DepoimentoService depoimentoService;

	private final ModelMapper mapper;

    @GetMapping
	public List<DepoimentoDTO> consultarDepoimentosEgresso() {
        mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STANDARD);
		return mapper.map(depoimentoService.findAllFavoritos(), new TypeToken<List<DepoimentoDTO>>() {
		}.getType());
	}
}
