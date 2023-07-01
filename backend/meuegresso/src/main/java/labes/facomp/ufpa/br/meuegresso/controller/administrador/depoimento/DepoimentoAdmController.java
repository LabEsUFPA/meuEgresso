package labes.facomp.ufpa.br.meuegresso.controller.administrador.depoimento;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.nimbusds.jose.shaded.gson.reflect.TypeToken;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import labes.facomp.ufpa.br.meuegresso.dto.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.NotFoundException;
import labes.facomp.ufpa.br.meuegresso.service.depoimento.DepoimentoService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/administrador/depoimento")
public class DepoimentoAdmController {

	private final DepoimentoService depoimentoService;

	private final ModelMapper mapper;
    
    @GetMapping()
	@PreAuthorize("hasRole('ADMIN')")
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public List<DepoimentoDTO> consultarDepoimentos() {
		return mapper.map(depoimentoService.findAll(), new TypeToken<List<DepoimentoDTO>>() {
		}.getType());
	}

	@GetMapping(value = "/habilitar/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	
	public ResponseType habilitarDepoimento(@PathVariable Integer id,
			JwtAuthenticationToken token) throws NotFoundException {
		
		depoimentoService.toggleAtivo(id);	
		return ResponseType.SUCCESS_UPDATE;
	}

	@GetMapping(value = "/favoritar/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	
	public ResponseType favoritarDepoimento(@PathVariable Integer id,
			JwtAuthenticationToken token) throws NotFoundException {
		
		if (depoimentoService.toggleFavoritos(id))
		{
			return ResponseType.SUCCESS_UPDATE;
		}	
		return ResponseType.FAIL_UPDATE;
	}
}

