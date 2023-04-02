package labes.facomp.ufpa.br.meuegresso.controller.usuario;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioPublicDTO;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;
import lombok.RequiredArgsConstructor;


/**
 * Responsável por fornecer um end-point para criar um novo usuário.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/usuario")
public class UsuarioController {

	private final UsuarioService usuarioService;

	private final ModelMapper mapper;


	@GetMapping
	@PreAuthorize("hasRole('ADMIN')")
	public List<UsuarioPublicDTO> consultarUsuarios() {
		return mapper.map(usuarioService.findAll(), new TypeToken<List<UsuarioPublicDTO>>() {}.getType());
	}


	/**
	 * Endpoint responsavel por cadastrar o usuário.
	 *
	 * @param usuario Estrutura de dados contendo as informações necessárias para persistir o Usuário.
	 * @return {@link UsuarioModel} Dados gravados no banco com a Id atualizada.
	 * @author Alfredo Gabriel
	 * @since 26/03/2023
	 */
	@PostMapping
	public ResponseEntity<UsuarioPublicDTO> cadastrarUsuario(@RequestBody @Valid UsuarioDTO usuarioDTO) {
		UsuarioModel usuarioModel = mapper.map(usuarioDTO, UsuarioModel.class);
		usuarioModel = usuarioService.save(usuarioModel);
		return ResponseEntity.ok(mapper.map(usuarioModel, UsuarioPublicDTO.class));
	}

}
