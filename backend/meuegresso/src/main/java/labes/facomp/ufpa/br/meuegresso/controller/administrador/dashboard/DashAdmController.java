package labes.facomp.ufpa.br.meuegresso.controller.administrador.dashboard;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso.EgressoDashDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoEmpresaService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para o dashboard do administrador.
 *
 * @author Bruno Eiki
 * @since 06/06/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/administrador/dashboard")
public class DashAdmController {

	private final EgressoEmpresaService egressoEmpresaService;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsável por retornar uma lista de egressoDashDTO para
	 * disponibilizar dados no dashboard do administrador
	 *
	 * @param void
	 * @return List<EgressoDashDTO>
	 * @author Bruno Eiki
	 * @since 06/06/2023
	 */
	@GetMapping
	@PreAuthorize("hasRole('ADMIN')")
	@ResponseStatus(code = HttpStatus.OK)
	public List<EgressoDashDTO> findAllEgressoDashDTO() {
		List<EgressoEmpresaModel> egressoEmpresaModels = egressoEmpresaService.findAll();

		mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);

		return egressoEmpresaModels.stream().map(e -> {
			EgressoDashDTO egressoMapa = mapper.map(e, EgressoDashDTO.class);
			egressoMapa.setNomeEgresso(e.getEgresso().getUsuario().getNome());
			egressoMapa.setNomeEmpresa(e.getEmpresa().getNome());
			return egressoMapa;
		}).toList();
	}
}