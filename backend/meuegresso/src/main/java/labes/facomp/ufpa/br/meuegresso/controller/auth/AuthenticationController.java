package labes.facomp.ufpa.br.meuegresso.controller.auth;

import java.time.Duration;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

import org.modelmapper.ModelMapper;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.config.properties.TokenProperties;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationRequest;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationResponse;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioRegistro;
import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.NameAlreadyExistsException;
import labes.facomp.ufpa.br.meuegresso.exceptions.NotValidEgressoException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoValidoModel;
import labes.facomp.ufpa.br.meuegresso.model.RecuperacaoSenhaModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.service.auth.AuthService;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoValidoService;
import labes.facomp.ufpa.br.meuegresso.service.mail.MailService;
import labes.facomp.ufpa.br.meuegresso.service.recuperacao_senha.RecuperacaoSenhaService;
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

	private final ModelMapper mapper;

	private final JwtService jwtService;

	private final MailService mailService;

	private final AuthService authService;

	private final UsuarioService usuarioService;

	private final TokenProperties tokenProperties;

	private final EgressoValidoService egressosValidosService;

	private final AuthenticationManager authenticationManager;

	private final RecuperacaoSenhaService recuperacaoSenhaService;

	/**
	 * Endpoint responsavel por autentica um determinado usuário.
	 *
	 * @param authenticationRequest Recebe o usuario e senha para realizar login.
	 * @return {@link AuthenticationResponse} Token autenticado.
	 * @author Alfredo Gabriel
	 * @throws NotFoundException
	 * @since 26/03/2023
	 */
	@PostMapping(value = "/login")
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public ResponseEntity<AuthenticationResponse> authenticationUser(
			@RequestBody AuthenticationRequest authenticationRequest,
			HttpServletRequest request) {

		Authentication auth = authenticationManager.authenticate(
				UsernamePasswordAuthenticationToken.unauthenticated(authenticationRequest.getUsername(),
						authenticationRequest.getPassword()));

		String token = authService.authenticate((UsuarioModel) auth.getPrincipal());

		ResponseCookie cookie = ResponseCookie.from("Token", token)
				.httpOnly(false)
				.secure(false)
				.domain(tokenProperties.getDomain())
				.sameSite("Lax")
				.path("/")
				.maxAge(Duration.ofHours(tokenProperties.getExpiresHours()))
				.build();

		return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, cookie.toString())
				.body(AuthenticationResponse.builder().token(token).build());
	}

	@PostMapping(value = "/atualizarCookie")
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public ResponseEntity<AuthenticationResponse> authenticationUser(JwtAuthenticationToken tokenAtual,
			HttpServletRequest request) {

		UsuarioModel usuario = usuarioService.findById(jwtService.getIdUsuario(tokenAtual));

		String token = authService.authenticate(usuario);

		ResponseCookie cookie = ResponseCookie.from("Token", token)
				.httpOnly(false)
				.secure(false)
				.domain(tokenProperties.getDomain())
				.sameSite("Lax")
				.path("/")
				.maxAge(Duration.ofHours(tokenProperties.getExpiresHours()))
				.build();

		return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, cookie.toString())
				.body(AuthenticationResponse.builder().token(token).build());
	}

	/**
	 * Endpoint responsavel por cadastrar o usuário.
	 *
	 * @param usuarioDTO Estrutura de dados contendo as informações necessárias para
	 *                   persistir o Usuário.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @throws NotFoundException
	 * @throws NameAlreadyExistsException
	 * @throws NotValidEgressoException
	 * @see {@link UsuarioDTO}
	 * @since 26/03/2023
	 */
	@PostMapping(value = "/register")
	@ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String cadastrarUsuario(@RequestBody @Valid UsuarioRegistro usuarioDTO)
			throws NameAlreadyExistsException {
		if (usuarioService.existsByUsername(usuarioDTO.getUsername())) {
			throw new NameAlreadyExistsException(
					String.format(ErrorType.USER_001.getMessage(), usuarioDTO.getUsername()),
					ErrorType.USER_001.getInternalCode());
		}
		mapper.getConfiguration().setSkipNullEnabled(true);

		UsuarioModel usuarioModel = mapper.map(usuarioDTO, UsuarioModel.class);

		EgressoValidoModel egressoValido;
		try {
			egressoValido = egressosValidosService.validarEgresso(Optional.ofNullable(usuarioDTO.getRegistration()),
					Optional.ofNullable(usuarioDTO.getNome()), Optional.ofNullable(usuarioDTO.getEmail()));
			mapper.map(egressoValido, usuarioModel);
		} catch (NotValidEgressoException e) {
			usuarioModel.setValido(false);
		}

		usuarioModel.setGrupos(Set.of(Grupos.EGRESSO));
		usuarioModel = usuarioService.save(usuarioModel);
		mailService.usuarioCadastrado(usuarioModel);
		return ResponseType.SUCCESS_SAVE.getMessage();
	}

	@PostMapping(value = "/recoveryPassword/{token}")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void recuperarSenha(@PathVariable String token, @RequestBody String password) throws UnauthorizedRequestException {
		RecuperacaoSenhaModel recuperacaoSenha = recuperacaoSenhaService.tokenValido(UUID.fromString(token));
		UsuarioModel usuarioModel = recuperacaoSenha.getUsuario();
		usuarioModel.setPassword(password);
		usuarioService.save(usuarioModel);
	}

	@PostMapping(value = "/recoveryPassword")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public ResponseType solicitacaoRecuperarSenha(@RequestBody String email,
			@RequestParam(required = false) Optional<String> redirect, @RequestHeader("Host") String header) {
		recuperacaoSenhaService.cadastrarSolicitacaoRecuperacao(email, redirect.orElse("https://" + header));
		return ResponseType.SOLICITACAO_REALIZADA_SUCESSO;
	}

}
