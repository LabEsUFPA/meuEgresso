package labes.facomp.ufpa.br.meuegresso.controller.administrador.anuncio;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.anuncio.AnuncioDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.DataNotDeletedException;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;
import labes.facomp.ufpa.br.meuegresso.service.anuncio.AnuncioService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para criar um novo anuncio.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/administrador/anuncio")
public class AnuncioAdmController {

	private final AnuncioService anuncioService;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsavel por buscar todas as anuncios no banco.
	 *
	 * @param void
	 * @return {@link AnuncioDTO} Retorna uma lista com todos as anuncios.
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@GetMapping
	@ResponseStatus(code = HttpStatus.OK)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIA')")
	public Page<AnuncioDTO> buscarAnuncios(
			@RequestParam(defaultValue = "0", required = false) Integer page,
			@RequestParam(defaultValue = "20", required = false) Integer size,
			@RequestParam(defaultValue = "ASC", required = false) Direction direction) {
		return mapper.map(anuncioService.findAll(page, size, direction), new TypeToken<List<AnuncioDTO>>() {
		}.getType());
	}

	/**
	 * Endpoint responsavel por cadastrar o anuncio.
	 *
	 * @param anuncioDTO Estrutura de dados contendo as informações necessárias para
	 *                   persistir o anuncio.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @see {@link AnuncioDTO} {@link ResponseType}
	 * @since 22/04/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIA')")
	public String cadastrarAnuncio(@RequestBody @Valid AnuncioDTO anuncioDTO) {
		AnuncioModel anuncioModel = mapper.map(anuncioDTO, AnuncioModel.class);
		anuncioService.save(anuncioModel);
		return ResponseType.SUCCESS_SAVE.getMessage();
	}

	/**
	 * Endpoint responsavel por atualizar o anuncio.
	 *
	 * @param anuncioDTO Estrutura de dados contendo as informações necessárias para
	 *                   atualizar o anuncio.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @throws InvalidRequestException
	 * @see {@link AnuncioDTO} {@link ResponseType}
	 * @since 22/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIA')")
	public String atualizarAnuncio(@RequestBody @Valid AnuncioDTO anuncioDTO)
			throws InvalidRequestException {
		AnuncioModel anuncioModel = mapper.map(anuncioDTO, AnuncioModel.class);
		anuncioService.update(anuncioModel);
		return ResponseType.SUCCESS_UPDATE.getMessage();
	}

	/**
	 * Endpoint responsavel por deletar o anuncio do egresso.
	 *
	 * @param id Integer corresponde a Id de um anuncio.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel
	 * @throws DataNotDeletedException
	 * @see {@link ResponseType}
	 * @since 22/04/2023
	 */
	@DeleteMapping(value = "/{id}")
	@ResponseStatus(code = HttpStatus.OK)
	@PreAuthorize("hasRole('ADMIN')")
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String deleteById(@PathVariable Integer id) throws DataNotDeletedException {
		if (anuncioService.deleteById(id)) {
			return ResponseType.SUCCESS_DELETE.getMessage();
		}
		throw new DataNotDeletedException();
	}

}
