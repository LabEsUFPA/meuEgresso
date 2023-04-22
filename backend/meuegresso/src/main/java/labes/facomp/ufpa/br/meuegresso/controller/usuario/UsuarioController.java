package labes.facomp.ufpa.br.meuegresso.controller.usuario;

import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
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
	public UsuarioAuthDTO findById(JwtAuthenticationToken token) {
		return mapper.map(usuarioService.findById(jwtService.getIdUsuario(token)), UsuarioAuthDTO.class);
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
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public String cadastrarUsuario(@RequestBody @Valid UsuarioDTO usuarioDTO) {
		UsuarioModel usuarioModel = mapper.map(usuarioDTO, UsuarioModel.class);
		usuarioService.save(usuarioModel);
		return ResponseType.SUCESS_SAVE.getMessage();
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
	@PreAuthorize("hasRole('EGRESSO') or hasRole('SECRETARIA') or hasRole('ADMIN')")
	@ResponseStatus(code = HttpStatus.CREATED)
	public String atualizarUsuario(@RequestBody @Valid UsuarioDTO usuarioDTO, JwtAuthenticationToken token)
			throws UnauthorizedRequestException, InvalidRequestException {
		if (usuarioService.existsByIdAndCreatedById(usuarioDTO.getId(), jwtService.getIdUsuario(token))) {
			UsuarioModel usuarioModel = mapper.map(usuarioDTO, UsuarioModel.class);
			usuarioModel = usuarioService.update(usuarioModel);
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
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	public boolean deleteById(Integer id) {
		return usuarioService.deleteById(id);
	}

}
