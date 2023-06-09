
package labes.facomp.ufpa.br.meuegresso.controller.usuario;

import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.EmailAlreadyExistsException;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.NameAlreadyExistsException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
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
	public String atualizarUsuario(
			@RequestBody @Valid UsuarioDTO usuarioDTO, JwtAuthenticationToken token)
			throws UnauthorizedRequestException, InvalidRequestException, NameAlreadyExistsException,
			EmailAlreadyExistsException {
		if (jwtService.getIdUsuario(token).equals(usuarioDTO.getId())) {
			UsuarioModel usuarioModelBack = usuarioService.findById(jwtService.getIdUsuario(token));
			UsuarioModel usuarioModelFront = mapper.map(usuarioDTO, UsuarioModel.class);

			if (usuarioModelFront.getNome() != null) {
				usuarioModelBack.setNome(usuarioModelFront.getNome());
			}

			if (usuarioModelFront.getEmail() != null) {
				// código legado por que o && nao deu bom
				if (usuarioModelBack.getEmail().equals(usuarioModelFront.getEmail())) {
					usuarioModelBack.setEmail(usuarioModelFront.getEmail());
				} else {
					if (usuarioService.existsByEmail(usuarioModelFront.getEmail())) {
						throw new EmailAlreadyExistsException();
					} else {
						usuarioModelBack.setEmail(usuarioModelFront.getEmail());
					}
				}
				usuarioModelBack.setEmail(usuarioModelFront.getEmail());
			}

			if (usuarioModelFront.getUsername() != null) {
				if (usuarioModelBack.getUsername().equals(usuarioModelFront.getUsername())) {
					usuarioModelBack.setUsername(usuarioModelFront.getUsername());
				} else {
					if (usuarioService.existsByUsername(usuarioModelFront.getUsername())) {
						throw new NameAlreadyExistsException(
								String.format(ErrorType.USER_001.getMessage(), usuarioModelFront.getUsername()),
								ErrorType.USER_001.getInternalCode());
					} else {
						usuarioModelBack.setUsername(usuarioModelFront.getUsername());
					}
				}
			}

			if (usuarioModelFront.getPassword() != null) {
				usuarioModelBack.setPassword(usuarioModelFront.getPassword());
				usuarioService.save(usuarioModelBack); // salva com senha codificada
			} else {
				usuarioService.update(usuarioModelBack); // evita atualizar extritamente uma nova senha codificada
			}
			return ResponseType.SUCCESS_UPDATE.getMessage();
		}
		throw new UnauthorizedRequestException();
	}
}
