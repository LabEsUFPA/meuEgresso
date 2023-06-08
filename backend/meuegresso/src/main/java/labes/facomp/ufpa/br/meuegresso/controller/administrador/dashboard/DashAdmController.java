package labes.facomp.ufpa.br.meuegresso.controller.administrador.dashboard;

import java.time.LocalDate;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso.EgressoDashDTO;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoEmpresaService;
import labes.facomp.ufpa.br.meuegresso.service.grupo.GrupoService;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;
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

	private final GrupoService grupoService;
	private final UsuarioService usuarioService;
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
	public Page<EgressoDashDTO> consultarEgressoDash(
			@RequestParam(name = "nome_usuario", defaultValue = "") String nomeUsuario,
			@RequestParam(name = "nome_empresa", defaultValue = "") String nomeEmpresa,
			@RequestParam(name = "date_min", defaultValue = "2023-05-19") LocalDate dateMin,
			@RequestParam(name = "date_max", defaultValue = "2023-06-19") LocalDate dateMax,
			@RequestParam(name = "ativo", defaultValue = "") Boolean ativo,
			@RequestParam(defaultValue = "0", required = false) Integer page,
			@RequestParam(defaultValue = "20", required = false) Integer size,
			@RequestParam(defaultValue = "ASC", required = false) Direction direction) {

		GrupoModel grupoEgresso = grupoService.findByNomeGrupo("EGRESSO");

		mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);

		Page<UsuarioModel> usuariosDash = usuarioService.findBySearch(nomeUsuario, nomeEmpresa, dateMin, dateMax, ativo,
				page, size, direction);

		List<EgressoDashDTO> dtoLista = usuariosDash.getContent().stream().map(u -> {
			EgressoDashDTO egressoDash = mapper.map(u, EgressoDashDTO.class);
			egressoDash.setNomeEmpresa(
					u.getEgresso() != null ? u.getEgresso().getEmprego().getEmpresa().getNome() : "Pendente");
			egressoDash.setCompleto(u.getGrupos().contains(grupoEgresso) && u.getEgresso() != null);
			return egressoDash;
		}).toList();

		return new PageImpl<>(dtoLista, usuariosDash.getPageable(),
				usuariosDash.getTotalElements());
	}
}