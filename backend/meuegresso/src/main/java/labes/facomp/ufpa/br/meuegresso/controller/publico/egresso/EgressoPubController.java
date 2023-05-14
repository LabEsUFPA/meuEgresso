package labes.facomp.ufpa.br.meuegresso.controller.publico.egresso;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import labes.facomp.ufpa.br.meuegresso.dto.publico.egresso.EgressoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para coletar os dados do Egresso
 *
 * @author Marcus Maciel Oliveira
 * @since 13/05/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/publico/egresso")
public class EgressoPubController {

    private final EgressoService egressoService;

    private final ModelMapper mapper;

	/**
	 * Endpoint responsável por retornar a lista de egressos cadastrados no banco de dados.
	 *
	 * @return {@link UsuarioAuthDTO} Lista de egressos cadastrados
	 * @author Marcus Maciel Oliveira
	 * @since 13/05/2023
	 */
	@GetMapping
	@ResponseStatus(code = HttpStatus.OK)
	public List<EgressoDTO> consultarEgressos() {
		mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STANDARD);
		return mapper.map(egressoService.findAll(), new TypeToken<List<EgressoDTO>>() {
		}.getType());
	}


	/**
	 * Endpoint responsável por coletar dados do egressos por sua ID
	 *
	 * @param id Integer
	 * @return 
	 * @author Marcus Maciel Oliveira
	 * @since 13/05/2023
	 */
	@GetMapping(value = "/{id}")
	@ResponseStatus(code = HttpStatus.OK)
	
	public EgressoDTO findById(@PathVariable Integer id) {
		mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STANDARD);
		return mapper.map(egressoService.findById(id), EgressoDTO.class);
	}

}
