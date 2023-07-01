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
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoEmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoMapaDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoEmpresaService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para criar um novo egressoEmpresa.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/egressoEmpresa")
public class EgressoEmpresaController {

	private final EgressoEmpresaService egressoEmpresaService;

	private final ModelMapper mapper;

	private final JwtService jwtService;
	/**
	 * Endpoint responsável por retornar a lista de egressoEmpresa cadastrados no
	 * banco de dados.
	 *
	 * @return {@link EgressoEmpresaDTO} Lista de egressoEmpresa cadastrados
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@GetMapping
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public List<EgressoMapaDTO> consultarEgressoEmpresas() {
		return mapper.map(egressoEmpresaService.findAll(), new TypeToken<List<EgressoEmpresaDTO>>() {
		}.getType());
	}

	/**
	 * Endpoint responsável por retornar um egressoEmpresa por sua ID.
	 *
	 * @param id Integer
	 * @return {@link EgressoEmpresaDTO} Dados gravados no banco.
	 * @author Alfredo Gabriel, Camilo Santos
	 * @since 21/04/2023
	 */
	@GetMapping(params = { "egressoId", "empresaId", "enderecoId" })
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public EgressoEmpresaDTO findById(@RequestParam(required = false) Integer egressoId, @RequestParam(required = false) Integer empresaId, @RequestParam(required = false) Integer enderecoId) {
		return mapper.map(egressoEmpresaService.findById(EgressoEmpresaModelId.builder().egressoId(egressoId).empresaId(empresaId).enderecoId(enderecoId).build()),EgressoEmpresaDTO.class);
	}

	/**
	 * Endpoint responsavel por cadastrar o egressoEmpresa.
	 *
	 * @param egressoEmpresaDTO Estrutura de dados contendo as informações
	 *                          necessárias para persistir o egressoEmpresa.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @see {@link EgressoEmpresaDTO}
	 * @since 21/04/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String cadastrarEgressoEmpresa(@RequestBody @Valid EgressoEmpresaDTO egressoEmpresaDTO) {
		EgressoEmpresaModel egressoEmpresaModel = mapper.map(egressoEmpresaDTO, EgressoEmpresaModel.class);
		egressoEmpresaService.save(egressoEmpresaModel);
		return ResponseType.SUCCESS_SAVE.getMessage();
	}

	/**
	 * Endpoint responsavel por atualizar as informações de emprego do egresso.
	 *
	 * @param emprego Estrutura de dados contendo as informações necessárias para
	 *                atualizar o emprego.
	 * @return {@link EgressoEmpresaModel} Dados gravados no banco com a Id
	 *         atualizada.
	 * @author Pedro Inácio
	 * @throws UnauthorizedRequestException
	 * @throws InvalidRequestException
	 * @since 16/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String atualizarEgressoEmpresa(@RequestBody @Valid EgressoEmpresaDTO egressoEmpresaDTO,
			JwtAuthenticationToken token) throws UnauthorizedRequestException, InvalidRequestException {
		if (egressoEmpresaService.existsByIdAndCreatedBy(egressoEmpresaDTO.getId(), jwtService.getIdUsuario(token))) {
			EgressoEmpresaModel egressoEmpresaModel = mapper.map(egressoEmpresaDTO, EgressoEmpresaModel.class);
			egressoEmpresaService.update(egressoEmpresaModel);
			return ResponseType.SUCCESS_UPDATE.getMessage();
		}
		throw new UnauthorizedRequestException();
	}

	/**
	 * Endpoint responsavel por deletar o emprego do egresso.
	 *
	 * @param emprego Estrutura de dados contendo as informações
	 *                necessárias para deletar o emprego.
	 * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
	 * @author Bruno Eiki
	 * @since 17/04/2023
	 */
	@DeleteMapping(params = { "egressoId", "empresaId", "enderecoId" })
	@ResponseStatus(code = HttpStatus.OK)
	@PreAuthorize("hasRole('ADMIN')")
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public boolean deleteById(@RequestParam(required = false) Integer egressoId,@RequestParam(required = false) Integer empresaId, @RequestParam(required = false) Integer enderecoId) {
		return egressoEmpresaService.deleteById(EgressoEmpresaModelId.builder().egressoId(egressoId).empresaId(empresaId).enderecoId(enderecoId).build());
	}

}
