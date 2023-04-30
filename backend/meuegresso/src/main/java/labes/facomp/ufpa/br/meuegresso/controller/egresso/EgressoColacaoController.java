package labes.facomp.ufpa.br.meuegresso.controller.egresso;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
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
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoTitulacaoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoColacaoService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para criar um novo EgressoColacao.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/EgressoColacao")
public class EgressoColacaoController {

	private final EgressoColacaoService egressoColacaoService;

	private final ModelMapper mapper;

	private final JwtService jwtService;

	/**
	 * Endpoint responsável por retornar a lista de EgressoColacao cadastrados no
	 * banco de dados.
	 *
	 * @return {@link EgressoTitulacaoDTO} Lista de EgressoColacao cadastrados
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@GetMapping
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public List<EgressoTitulacaoDTO> consultarEgressoColacaos() {
		return mapper.map(egressoColacaoService.findAll(), new TypeToken<List<EgressoTitulacaoDTO>>() {
		}.getType());
	}

	/**
	 * Endpoint responsável por retornar um EgressoColacao por sua ID.
	 *
	 * @param id Integer
	 * @return {@link EgressoTitulacaoDTO} Dados gravados no banco.
	 * @author Alfredo Gabriel, Camilo Santos
	 * @since 21/04/2023
	 */
	@ResponseStatus(code = HttpStatus.OK)
	@GetMapping(params = { "egressoId", "titulacaoId" })
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public EgressoTitulacaoDTO findById(@RequestParam(required = false) Integer egressoId,
			@RequestParam(required = false) Integer titulacaoId) {
		return mapper.map(
				egressoColacaoService
						.findById(EgressoTitulacaoModelId.builder().egressoId(egressoId).titulacaoId(titulacaoId).build()),
				EgressoTitulacaoDTO.class);
	}

	/**
	 * Endpoint responsavel por cadastrar o EgressoColacao.
	 *
	 * @param EgressoTitulacaoDTO Estrutura de dados contendo as informações
	 *                            necessárias para persistir o EgressoColacao.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @see {@link EgressoTitulacaoDTO}
	 * @since 21/04/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public String cadastrarEgressoColacao(@RequestBody @Valid EgressoTitulacaoDTO egressoColacaoDTO) {
		EgressoTitulacaoModel egressoColacaoModel = mapper.map(egressoColacaoDTO, EgressoTitulacaoModel.class);
		egressoColacaoService.save(egressoColacaoModel);
		return ResponseType.SUCESS_SAVE.getMessage();
	}

	/**
	 * Endpoint responsavel por atualizar o EgressoColacao.
	 *
	 * @param EgressoTitulacaoDTO Estrutura de dados contendo as informações
	 *                            necessárias para
	 *                            atualizar o EgressoColacao.
	 * @return {@link EgressoTitulacaoDTO} Dados gravados no banco com a Id
	 *         atualizada.
	 * @author Alfredo Gabriel
	 * @throws UnauthorizedRequestException
	 * @throws InvalidRequestException
	 * @since 21/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String atualizarEgressoColacao(@RequestBody @Valid EgressoTitulacaoDTO egressoColacaoDTO,
			JwtAuthenticationToken token) throws UnauthorizedRequestException, InvalidRequestException {
		if (egressoColacaoService.existsByIdAndCreatedById(egressoColacaoDTO.getId(), jwtService.getIdUsuario(token))) {
			EgressoTitulacaoModel egressoColacaoModel = mapper.map(egressoColacaoDTO, EgressoTitulacaoModel.class);
			egressoColacaoService.update(egressoColacaoModel);
			return ResponseType.SUCESS_UPDATE.getMessage();
		}
		throw new UnauthorizedRequestException();
	}

	/**
	 * Endpoint responsavel por deletar a colacao do egresso.
	 *
	 * @param tituloAcademico Estrutura de dados contendo as informações
	 *                        necessárias para deletar o titulo academico.
	 * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
	 * @author Bruno Eiki
	 * @since 17/04/2023
	 */
	@PreAuthorize("hasRole('ADMIN')")
	@DeleteMapping(params = { "egressoId", "titulacaoId" })
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public boolean deleteById(
			@RequestParam(required = false) Integer egressoId,
			@RequestParam(required = false) Integer titulacaoId) {
		return egressoColacaoService
				.deleteById(EgressoTitulacaoModelId.builder().egressoId(egressoId).titulacaoId(titulacaoId).build());
	}

}
