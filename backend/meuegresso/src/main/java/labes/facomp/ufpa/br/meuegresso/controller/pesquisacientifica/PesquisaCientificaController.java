package labes.facomp.ufpa.br.meuegresso.controller.pesquisacientifica;

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

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.pesquisacientifica.PesquisaCientificaDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.PesquisaCientificaModel;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.pesquisacientifica.PesquisaCientificaService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para criar um novo pesquisaCientifica.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/pesquisaCientifica")
public class PesquisaCientificaController {

	private final PesquisaCientificaService pesquisaCientificaService;

	private final ModelMapper mapper;

	private final JwtService jwtService;

	/**
	 * Endpoint responsável por retornar a lista de pesquisaCientifica cadastrados
	 * no banco de dados.
	 *
	 * @return {@link PesquisaCientificaDTO} Lista de pesquisaCientifica cadastrados
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@GetMapping
	public List<PesquisaCientificaDTO> consultarPesquisaCientificas() {
		return mapper.map(pesquisaCientificaService.findAll(), new TypeToken<List<PesquisaCientificaDTO>>() {
		}.getType());
	}

	/**
	 * Endpoint responsável por retornar um pesquisaCientifica por sua ID.
	 *
	 * @param id Integer
	 * @return {@link PesquisaCientificaDTO} Dados gravados no banco.
	 * @author Alfredo Gabriel, Camilo Santos
	 * @since 21/04/2023
	 */
	@GetMapping(value = "{id}")
	@ResponseStatus(code = HttpStatus.OK)
	public PesquisaCientificaDTO findById(@PathVariable Integer id) {
		return mapper.map(pesquisaCientificaService.findById(id), PesquisaCientificaDTO.class);
	}

	/**
	 * Endpoint responsavel por cadastrar o pesquisaCientifica.
	 *
	 * @param pesquisaCientificaDTO Estrutura de dados contendo as informações
	 *                              necessárias para persistir o pesquisaCientifica.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @see {@link PesquisaCientificaDTO}
	 * @since 21/04/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public String cadastrarPesquisaCientifica(@RequestBody @Valid PesquisaCientificaDTO pesquisaCientificaDTO) {
		PesquisaCientificaModel pesquisaCientificaModel = mapper.map(pesquisaCientificaDTO,
				PesquisaCientificaModel.class);
		pesquisaCientificaService.save(pesquisaCientificaModel);
		return ResponseType.SUCESS_SAVE.getMessage();
	}

	/**
	 * Endpoint responsavel por atualizar o pesquisaCientifica.
	 *
	 * @param pesquisaCientificaDTO Estrutura de dados contendo as informações
	 *                              necessárias para
	 *                              atualizar o pesquisaCientifica.
	 * @return {@link PesquisaCientificaDTO} Dados gravados no banco com a Id
	 *         atualizada.
	 * @author Alfredo Gabriel
	 * @throws InvalidRequestException
	 * @throws UnauthorizedRequestException
	 * @since 21/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public String atualizarPesquisaCientifica(@RequestBody @Valid PesquisaCientificaDTO pesquisaCientificaDTO, JwtAuthenticationToken token)
			throws InvalidRequestException, UnauthorizedRequestException {
		if (pesquisaCientificaService.existsByIdAndCreatedById(pesquisaCientificaDTO.getId(),
				jwtService.getIdUsuario(token))) {
			PesquisaCientificaModel pesquisaCientificaModel = mapper.map(pesquisaCientificaDTO,
					PesquisaCientificaModel.class);
			pesquisaCientificaService.update(pesquisaCientificaModel);
			return ResponseType.SUCESS_UPDATE.getMessage();
		}
		throw new UnauthorizedRequestException();
	}

	/**
	 * Endpoint responsavel por deletar a pesquisa do egresso.
	 *
	 * @param pesquisa Estrutura de dados contendo as informações
	 *                 necessárias para deletar a pesquisa.
	 * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
	 * @author Bruno Eiki
	 * @since 17/04/2023
	 */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	public boolean deleteById(Integer id) {
		return pesquisaCientificaService.deleteById(id);
	}

}
