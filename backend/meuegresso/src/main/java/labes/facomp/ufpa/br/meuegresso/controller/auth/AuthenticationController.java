package labes.facomp.ufpa.br.meuegresso.controller.auth;

import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationRequest;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationResponse;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.service.auth.AuthService;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para a authenticação do usuario.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthenticationController {

	private final AuthService authService;

	private final AuthenticationManager authenticationManager;

	private final ModelMapper mapper;

	private final UsuarioService usuarioService;

	/**
	 * Endpoint responsavel por autentica um determinado usuário.
	 *
	 * @param authenticationRequest Recebe o usuario e senha para realizar login.
	 * @return {@link AuthenticationResponse} Token autenticado.
	 * @author Alfredo Gabriel
	 * @since 26/03/2023
	 */
	@PostMapping(value = "/login")
	@ResponseStatus(code = HttpStatus.OK)
	public AuthenticationResponse authenticationUser(
			@RequestBody AuthenticationRequest authenticationRequest) {
		Authentication auth = authenticationManager.authenticate(
				UsernamePasswordAuthenticationToken.unauthenticated(authenticationRequest.getUsername(),
						authenticationRequest.getPassword()));
		return AuthenticationResponse.builder().token(authService.authenticate(auth)).build();
	}

	/**
	 * Endpoint responsavel por cadastrar o usuário.
	 *
	 * @param usuarioDTO Estrutura de dados contendo as informações necessárias para
	 *                   persistir o Usuário.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @see {@link UsuarioDTO}
	 * @since 26/03/2023
	 */
	@PostMapping(value = "/register")
	@ResponseStatus(code = HttpStatus.CREATED)
	public String cadastrarUsuario(@RequestBody @Valid UsuarioDTO usuarioDTO) {
		UsuarioModel usuarioModel = mapper.map(usuarioDTO, UsuarioModel.class);
		usuarioService.save(usuarioModel);
		return ResponseType.SUCESS_SAVE.getMessage();
	}

}
