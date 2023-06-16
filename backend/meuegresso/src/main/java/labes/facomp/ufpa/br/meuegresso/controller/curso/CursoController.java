package labes.facomp.ufpa.br.meuegresso.controller.curso;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.http.HttpStatus;
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
import labes.facomp.ufpa.br.meuegresso.dto.curso.CursoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.curso.CursoService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para criar um novo curso.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/curso")
public class CursoController {

	private final CursoService cursoService;

	private final ModelMapper mapper;

	private final JwtService jwtService;

	/**
	 * Endpoint responsável por retornar a lista de curso cadastrados no banco de
	 * dados.
	 *
	 * @return {@link CursoDTO} Lista de curso cadastrados
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@GetMapping
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public List<CursoDTO> consultarCursos() {
		return mapper.map(cursoService.findAll(), new TypeToken<List<CursoDTO>>() {
		}.getType());
	}

	/**
	 * Endpoint responsável por retornar um curso por sua ID.
	 *
	 * @param id Integer
	 * @return {@link CursoDTO} Dados gravados no banco.
	 * @author Alfredo Gabriel, Camilo Santos
	 * @since 21/04/2023
	 */
	@GetMapping(value = "/{id}")
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public CursoDTO findById(@PathVariable Integer id) {
		return mapper.map(cursoService.findById(id), CursoDTO.class);
	}

	/**
	 * Endpoint responsavel por cadastrar o curso.
	 *
	 * @param cursoDTO Estrutura de dados contendo as informações necessárias para
	 *                 persistir o curso.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @see {@link CursoDTO}
	 * @since 21/04/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String cadastrarCurso(@RequestBody @Valid CursoDTO cursoDTO) {
		CursoModel cursoModel = mapper.map(cursoDTO, CursoModel.class);
		cursoService.save(cursoModel);
		return ResponseType.SUCCESS_SAVE.getMessage();
	}

	/**
	 * Endpoint responsavel por atualizar o curso.
	 *
	 * @param cursoDTO Estrutura de dados contendo as informações necessárias para
	 *                 atualizar o curso.
	 * @return {@link CursoDTO} Dados gravados no banco com a Id atualizada.
	 * @author Alfredo Gabriel
	 * @throws UnauthorizedRequestException
	 * @since 21/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String atualizarCurso(@RequestBody @Valid CursoDTO cursoDTO, JwtAuthenticationToken token)
			throws UnauthorizedRequestException {
		if (cursoService.existsByIdAndCreatedById(cursoDTO.getId(), jwtService.getIdUsuario(token))) {
			CursoModel cursoModel = mapper.map(cursoDTO, CursoModel.class);
			cursoService.save(cursoModel);
			return ResponseType.SUCCESS_UPDATE.getMessage();
		}
		throw new UnauthorizedRequestException();
	}

	/**
	 * Endpoint responsavel por deletar o curso do egresso.
	 *
	 * @param curso Estrutura de dados contendo as informações
	 *              necessárias para deletar o curso.
	 * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
	 * @author Bruno Eiki
	 * @since 17/04/2023
	 */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public boolean deleteById(Integer id) {
		return cursoService.deleteById(id);
	}

}
