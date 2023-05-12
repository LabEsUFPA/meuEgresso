package labes.facomp.ufpa.br.meuegresso.controller.usuario;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoMapaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoEmpresaService;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para criar um novo usuário.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0.1
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/usuario")
public class UsuarioController {

	private final UsuarioService usuarioService;

	private final EgressoEmpresaService egressoEmpresaService;

	private final ModelMapper mapper;

	private final JwtService jwtService;

	/**
	 * Endpoint responsável por retornar um ussário por sua ID.
	 *
	 * @param id Integer
	 * @return {@link UsuarioAuthDTO} Dados gravados no banco.
	 * @author Alfredo Gabriel, Camilo Santos
	 * @since 21/04/2023
	 */
	@GetMapping
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public UsuarioAuthDTO findById(JwtAuthenticationToken token) {
		return mapper.map(usuarioService.findById(jwtService.getIdUsuario(token)), UsuarioAuthDTO.class);
	}

	/**
	 * Endpoint responsável por retornar uma lista de egressoMapaDTO para
	 * disponibilizar dados no mapa sociodemográfico
	 *
	 * @param id Integer
	 * @return {@link TIPO_RETORNO}
	 * @author Bruno Eiki, Pedro Inácio
	 * @since 08/05/2023
	 */
	@GetMapping(value = "/mapa")
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public List<EgressoMapaDTO> findAllEgressoMapaDTO() {
		return egressoEmpresaService.findAllEgressoMapaDTO();
	}

	/**
	 * Endpoint responsavel por atualizar o usuário.
	 *
	 * @param usuarioDTO Estrutura de dados contendo as informações necessárias para
	 *                   atualizar o Usuário.
	 * @return {@link UsuarioAuthDTO} Dados gravados no banco com a Id atualizada.
	 * @author Camilo Santos
	 * @throws UnauthorizedRequestException
	 * @throws InvalidRequestException
	 * @since 16/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	@PreAuthorize("hasRole('EGRESSO') or hasRole('SECRETARIA') or hasRole('ADMIN')")
	public String atualizarUsuario(
			@RequestBody @Valid UsuarioDTO usuarioDTO, JwtAuthenticationToken token)
			throws UnauthorizedRequestException, InvalidRequestException {
		if (jwtService.getIdUsuario(token).equals(usuarioDTO.getId())) {
			UsuarioModel usuarioModel = usuarioService.findById(jwtService.getIdUsuario(token));
			mapper.map(usuarioDTO, usuarioModel);
			usuarioService.update(usuarioModel);
			return ResponseType.SUCESS_UPDATE.getMessage();
		}
		throw new UnauthorizedRequestException();
	}

	/**
	 * Endpoint responsável por deletar usuário por sua ID>
	 *
	 * @param id Integer
	 * @return Boolean
	 * @author Camilo Santos
	 * @since 19/04/2023
	 */
	@DeleteMapping(value = "/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String deleteById(@PathVariable(name = "id") Integer id) {
		if (usuarioService.deleteById(id)) {
			return ResponseType.SUCESS_DELETE.getMessage();
		} else {
			return ResponseType.FAIL_DELETE.getMessage();
		}
	}

}
