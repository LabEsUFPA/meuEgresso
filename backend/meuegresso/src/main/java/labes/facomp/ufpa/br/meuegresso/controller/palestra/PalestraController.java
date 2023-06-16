package labes.facomp.ufpa.br.meuegresso.controller.palestra;

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
import labes.facomp.ufpa.br.meuegresso.dto.palestra.PalestraDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.PalestraModel;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.palestra.PalestraService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para criar um novo palestra.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/palestra")
public class PalestraController {

	private final PalestraService palestraService;

	private final ModelMapper mapper;

	private final JwtService jwtService;

	/**
	 * Endpoint responsável por retornar a lista de palestra cadastrados no
	 * banco de dados.
	 *
	 * @return {@link PalestraDTO} Lista de palestra cadastrados
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@GetMapping
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public List<PalestraDTO> consultarPalestras() {
		return mapper.map(palestraService.findAll(), new TypeToken<List<PalestraDTO>>() {
		}.getType());
	}

	/**
	 * Endpoint responsável por retornar um palestra por sua ID.
	 *
	 * @param id Integer
	 * @return {@link PalestraDTO} Dados gravados no banco.
	 * @author Alfredo Gabriel, Camilo Santos
	 * @since 21/04/2023
	 */
	@GetMapping(value = "/{id}")
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public PalestraDTO findById(@PathVariable Integer id) {
		return mapper.map(palestraService.findById(id), PalestraDTO.class);
	}

	/**
	 * Endpoint responsavel por cadastrar o palestra.
	 *
	 * @param palestraDTO Estrutura de dados contendo as informações necessárias
	 *                    para persistir o palestra.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @see {@link PalestraDTO}
	 * @since 21/04/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String cadastrarPalestra(@RequestBody @Valid PalestraDTO palestraDTO) {
		PalestraModel palestraModel = mapper.map(palestraDTO, PalestraModel.class);
		palestraService.save(palestraModel);
		return ResponseType.SUCCESS_SAVE.getMessage();
	}

	/**
	 * Endpoint responsavel por atualizar a contribuições do egresso.
	 *
	 * @param contribucao Estrutura de dados contendo as informações necessárias
	 *                    para atualizar a palestra.
	 * @return {@link PalestraModel} Dados gravados no banco com a Id
	 *         atualizada.
	 * @author Pedro Inácio
	 * @throws UnauthorizedRequestException
	 * @throws InvalidRequestException
	 * @since 16/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String atualizarPalestra(@RequestBody @Valid PalestraDTO palestraDTO,
			JwtAuthenticationToken token) throws UnauthorizedRequestException, InvalidRequestException {
		if (palestraService.existsByIdAndCreatedById(palestraDTO.getId(), jwtService.getIdUsuario(token))) {
			PalestraModel palestraModel = palestraService.findByEgressoUsuarioId(jwtService.getIdUsuario(token));
			palestraModel.setDescricao(palestraDTO.getDescricao());
			palestraService.update(palestraModel);
			return ResponseType.SUCCESS_UPDATE.getMessage();
		}
		throw new UnauthorizedRequestException();
	}

	/**
	 * Endpoint responsavel por deletar a palestra do egresso.
	 *
	 * @param palestra Estrutura de dados contendo as informações
	 *                 necessárias para deletar a palestra.
	 * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
	 * @author Bruno Eiki
	 * @since 17/04/2023
	 */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public boolean deleteById(Integer id) {
		return palestraService.deleteById(id);
	}

}
