package labes.facomp.ufpa.br.meuegresso.controller.administrador.areaemprego;

import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.areaemprego.AreaEmpregoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AreaEmpregoModel;
import labes.facomp.ufpa.br.meuegresso.service.areaemprego.AreaEmpregoService;
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
@RequestMapping("/administrador/areaemprego")
public class AreaEmpregoAdmController {

	private final AreaEmpregoService areaEmpregoService;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsavel por adicionar uma área de emprego no banco.
	 *
	 * @param areaEmpregoDTO Estrutura de dados contendo as informações necessárias
	 *                       para
	 *                       adicionar uma Area de Emprego.
	 * @return {@link String} Mensagem de confirmacao.
	 * @author Lucas Cantão
	 * @since 18/05/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String cadastrarAreasEmprego(
			@RequestBody @Valid AreaEmpregoDTO areaEmpregoDTO) {
		AreaEmpregoModel areaEmpregoModel = mapper.map(areaEmpregoDTO, AreaEmpregoModel.class);
		areaEmpregoService.save(areaEmpregoModel);
		return ResponseType.SUCCESS_SAVE.getMessage();
	}

	/**
	 * Endpoint responsavel por atualizar uma área de emprego no banco.
	 *
	 * @param areaEmpregoDTO Estrutura de dados contendo as informações necessárias
	 *                       para
	 *                       atualizar uma area de emprego.
	 * @return {@link String} Mensagem de confirmacao.
	 * @author Lucas Cantão, Marcus Maciel
	 * @since 18/05/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.ACCEPTED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String atualizarAreaEmprego(@RequestBody @Valid AreaEmpregoDTO areaEmpregoDTO)
			throws InvalidRequestException {
		AreaEmpregoModel areaEmpregoModel = mapper.map(areaEmpregoDTO, AreaEmpregoModel.class);
		areaEmpregoService.update(areaEmpregoModel);
		return ResponseType.SUCCESS_UPDATE.getMessage();
	}

	/**
	 * Endpoint responsavel por deletar uma area de emprego.
	 *
	 * @param areaEmpregoDTO Estrutura de dados contendo as informações necessárias
	 *                       para
	 *                       deletar uma area de emprego.
	 * @return {@link String} Mensagem de confirmacao.
	 * @author Lucas Cantão
	 * @since 18/05/2023
	 */
	@DeleteMapping
	@ResponseStatus(code = HttpStatus.OK)
	@PreAuthorize("hasRole('ADMIN')")
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String deletarAreaEmprego(@RequestBody @Valid AreaEmpregoDTO areaEmpregoDTO) {
		AreaEmpregoModel areaEmpregoModel = mapper.map(areaEmpregoDTO, AreaEmpregoModel.class);
		areaEmpregoService.deleteById(areaEmpregoModel.getId());
		return ResponseType.SUCCESS_DELETE.getMessage();
	}

}
