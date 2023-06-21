package labes.facomp.ufpa.br.meuegresso.controller.administrador.usuario;

import java.util.List;
import java.util.Set;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.usuario.UsuarioDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioRegistroAdmin;
import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.NameAlreadyExistsException;
import labes.facomp.ufpa.br.meuegresso.exceptions.NotFoundException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnalthorizedRegisterException;
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
@RequestMapping("/administrador/usuario")
public class UsuarioAdmController {

	private final UsuarioService usuarioService;

	private final ModelMapper mapper;

	private final JwtService jwtService;

	/**
	 * Endpoint responsável por retornar a lista de usuários cadastrados no banco de
	 * dados.
	 *
	 * @return {@link UsuarioAuthDTO} Lista de usuários cadastrados
	 * @author Alfredo Gabriel, Camilo Santos
	 * @since 18/04/2023
	 */
	@GetMapping
	@PreAuthorize(value = "hasRole('ADMIN') or hasRole('SECRETARIO')")
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public List<UsuarioAuthDTO> consultarUsuarios() {
		return mapper.map(usuarioService.findAll(), new TypeToken<List<UsuarioAuthDTO>>() {
		}.getType());
	}

	/**
	 * Endpoint responsavel por cadastrar o usuário admin, secretário e egresso.
	 *
	 * @param usuarioDTO Estrutura de dados contendo as informações necessárias para
	 *                   persistir o Usuário.
	 * @return String confirmando a transação.
	 * @author Lucas Cantão
	 * @throws NotFoundException
	 * @throws NameAlreadyExistsException
	 * @throws UnalthorizedRegisterException
	 * @see {@link UsuarioDTO}
	 * @since 20/06/2023
	 */
	@PostMapping(value = "/register")
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
	@ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public ResponseEntity<String> cadastrarUsuario(@RequestBody @Valid UsuarioRegistroAdmin usuarioDTO,JwtAuthenticationToken token)
			throws NameAlreadyExistsException, UnalthorizedRegisterException {
		if (usuarioService.existsByUsername(usuarioDTO.getUsername())) {
			throw new NameAlreadyExistsException(
					String.format(ErrorType.USER_001.getMessage(), usuarioDTO.getUsername()),ErrorType.USER_001.getInternalCode());
		}

		UsuarioModel usuarioModelTeste = usuarioService.findById(jwtService.getIdUsuario(token));
		Set<Grupos> gruposUsuario = usuarioModelTeste.getGrupos();

		if(!gruposUsuario.contains(Grupos.ADMIN)){
			Set<Grupos> grupos = usuarioDTO.getGrupos();
			for(Grupos grupo :grupos){
				if (grupo.getAuthority().equals("ROLE_ADMIN") || grupo.getAuthority().equals("ROLE_SECRETARIO")) {
					throw new UnalthorizedRegisterException(String.format(ErrorType.UNAUTHORIZED_REGISTER.getMessage()),ErrorType.UNAUTHORIZED_REGISTER.getInternalCode());
				}
			}
		}
		mapper.getConfiguration().setSkipNullEnabled(true);

		UsuarioModel usuarioModel = mapper.map(usuarioDTO, UsuarioModel.class);

		usuarioService.save(usuarioModel);
		return new ResponseEntity<>(ResponseType.SUCCESS_SAVE.getMessage(), null, HttpStatus.CREATED);
	}

	/**
	 * Endpoint responsavel por atualizar o usuário.
	 *
	 * @param usuarioDTO Estrutura de dados contendo as informações necessárias para
	 *                   atualizar o Usuário.
	 * @return {@link UsuarioAuthDTO} Dados gravados no banco com a Id atualizada.
	 * @author Camilo Santos
	 * @throws InvalidRequestException
	 * @throws UnauthorizedRequestException
	 * @since 16/04/2023
	 */
	@PutMapping(value = "/{id}")
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
	@ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public UsuarioAuthDTO atualizarUsuario(@RequestBody @Valid UsuarioDTO usuarioDTO) throws InvalidRequestException {
		UsuarioModel usuarioModel = mapper.map(usuarioDTO, UsuarioModel.class);
		usuarioModel = usuarioService.update(usuarioModel);
		return mapper.map(usuarioModel, UsuarioAuthDTO.class);
	}

	@PutMapping(value = "/{id}/ativo")
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public ResponseType toggleAtivoUsuario(@PathVariable Integer id) throws NotFoundException {
		usuarioService.toggleAtivo(id);
		return ResponseType.SUCCESS_UPDATE;
	}

	@PutMapping(value = "/{id}/valido")
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public ResponseType toggleValidoUsuario(@PathVariable Integer id) throws NotFoundException {
		usuarioService.toggleValido(id);
		return ResponseType.SUCCESS_UPDATE;
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
			return ResponseType.SUCCESS_DELETE.getMessage();
		}
		return ResponseType.FAIL_DELETE.getMessage();
	}

}
