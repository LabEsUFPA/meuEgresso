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
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoTitulacaoService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para criar um novo EgressoTitulacao.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/egressoTitulacao")
public class EgressoTitulacaoController {

	private final EgressoTitulacaoService egressoTitulacaoService;

	private final ModelMapper mapper;

	private final JwtService jwtService;

	/**
	 * Endpoint responsável por retornar a lista de EgressoTitulacao cadastrados no
	 * banco de dados.
	 *
	 * @return {@link EgressoTitulacaoDTO} Lista de EgressoTitulacao cadastrados
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@GetMapping
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public List<EgressoTitulacaoDTO> consultarEgressoTitulacaos() {
		return mapper.map(egressoTitulacaoService.findAll(), new TypeToken<List<EgressoTitulacaoDTO>>() {
		}.getType());
	}

	/**
	 * Endpoint responsável por retornar um EgressoTitulacao por sua ID.
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
				egressoTitulacaoService
						.findById(EgressoTitulacaoModelId.builder().egressoId(egressoId).titulacaoId(titulacaoId)
								.build()),
				EgressoTitulacaoDTO.class);
	}

	/**
	 * Endpoint responsavel por cadastrar o EgressoTitulacao.
	 *
	 * @param EgressoTitulacaoDTO Estrutura de dados contendo as informações
	 *                            necessárias para persistir o EgressoTitulacao.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @see {@link EgressoTitulacaoDTO}
	 * @since 21/04/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public String cadastrarEgressoTitulacao(@RequestBody @Valid EgressoTitulacaoDTO egressoTitulacaoDTO) {
		EgressoTitulacaoModel egressoTitulacaoModel = toModel(egressoTitulacaoDTO);
		egressoTitulacaoService.save(egressoTitulacaoModel);
		return ResponseType.SUCCESS_SAVE.getMessage();
	}

	/**
	 * Endpoint responsavel por atualizar o EgressoTitulacao.
	 *
	 * @param EgressoTitulacaoDTO Estrutura de dados contendo as informações
	 *                            necessárias para
	 *                            atualizar o EgressoTitulacao.
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
	public String atualizarEgressoTitulacao(@RequestBody @Valid EgressoTitulacaoDTO egressoTitulacaoDTO,
			JwtAuthenticationToken token) throws UnauthorizedRequestException, InvalidRequestException {
		if (egressoTitulacaoService.existsByIdAndCreatedById(egressoTitulacaoDTO.getId(),
				jwtService.getIdUsuario(token))) {
			EgressoTitulacaoModel egressoTitulacaoModel = toModel(egressoTitulacaoDTO);
			egressoTitulacaoService.update(egressoTitulacaoModel);
			return ResponseType.SUCCESS_UPDATE.getMessage();
		}
		throw new UnauthorizedRequestException();
	}

	/**
	 * Endpoint responsavel por deletar a t do egresso.
	 *
	 * @param tituloAcademico Estrutura de dados contendo as informações
	 *                        necessárias para deletar o titulo academico.
	 * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
	 * @author Bruno Eiki
	 * @since 17/04/2023
	 */
	@PreAuthorize("hasRole('ADMIN')")
	@ResponseStatus(code = HttpStatus.OK)
	@DeleteMapping(params = { "egressoId", "titulacaoId" })
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String deleteById(@RequestParam(required = false) Integer egressoId,
			@RequestParam(required = false) Integer titulacaoId) {
		if (egressoTitulacaoService.deleteById(
			EgressoTitulacaoModelId.builder().egressoId(egressoId).titulacaoId(titulacaoId).build())) {
			return ResponseType.SUCCESS_DELETE.getMessage();
		}
		return ResponseType.FAIL_DELETE.getMessage();
	}

	private EgressoTitulacaoModel toModel(EgressoTitulacaoDTO egressoTitulacaoDTO) {
		var curso = mapper.map(egressoTitulacaoDTO.getCurso(), CursoModel.class);
		var empresa = mapper.map(egressoTitulacaoDTO.getEmpresa(), EmpresaModel.class);
		var titulacao = mapper.map(egressoTitulacaoDTO.getTitulacao(), TitulacaoModel.class);
		var id = egressoTitulacaoDTO.getId();
		return EgressoTitulacaoModel.builder().id(id).curso(curso).empresa(empresa)
				.titulacao(titulacao).egresso(EgressoModel.builder().id(id.getEgressoId()).build()).build();

	}

}
