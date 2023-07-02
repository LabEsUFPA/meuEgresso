package labes.facomp.ufpa.br.meuegresso.controller.endereco;

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
import labes.facomp.ufpa.br.meuegresso.dto.endereco.EnderecoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.endereco.EnderecoService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para criar um novo endereco.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/endereco")
public class EnderecoController {

	private final EnderecoService enderecoService;

	private final ModelMapper mapper;

	private final JwtService jwtService;

	/**
	 * Endpoint responsável por retornar a lista de endereco cadastrados no banco de
	 * dados.
	 *
	 * @return {@link EnderecoDTO} Lista de endereco cadastrados
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@GetMapping
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public List<EnderecoDTO> consultarEnderecos() {
		return mapper.map(enderecoService.findAll(), new TypeToken<List<EnderecoDTO>>() {
		}.getType());
	}

	/**
	 * Endpoint responsável por retornar um endereco por sua ID.
	 *
	 * @param id Integer
	 * @return {@link EnderecoDTO} Dados gravados no banco.
	 * @author Alfredo Gabriel, Camilo Santos
	 * @since 21/04/2023
	 */
	@GetMapping(value = "/{id}")
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public EnderecoDTO findById(@PathVariable Integer id) {
		return mapper.map(enderecoService.findById(id), EnderecoDTO.class);
	}

	/**
	 * Endpoint responsavel por cadastrar o endereco.
	 *
	 * @param enderecoDTO Estrutura de dados contendo as informações necessárias
	 *                    para persistir o endereco.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @see {@link EnderecoDTO}
	 * @since 21/04/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String cadastrarEndereco(@RequestBody @Valid EnderecoDTO enderecoDTO) {
		EnderecoModel enderecoModel = mapper.map(enderecoDTO, EnderecoModel.class);
		enderecoService.save(enderecoModel);
		return ResponseType.SUCCESS_SAVE.getMessage();
	}

	/**
	 * Endpoint responsavel por atualizar o endereco.
	 *
	 * @param enderecoDTO Estrutura de dados contendo as informações necessárias
	 *                    para
	 *                    atualizar o endereco.
	 * @return {@link EnderecoDTO} Dados gravados no banco com a Id atualizada.
	 * @author Alfredo Gabriel
	 * @throws InvalidRequestException
	 * @throws UnauthorizedRequestException
	 * @since 21/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String atualizarEndereco(@RequestBody @Valid EnderecoDTO enderecoDTO,
			JwtAuthenticationToken token) throws InvalidRequestException, UnauthorizedRequestException {
		if (enderecoService.existsByIdAndCreatedById(enderecoDTO.getId(), jwtService.getIdUsuario(token))) {
			EnderecoModel enderecoModel = mapper.map(enderecoDTO, EnderecoModel.class);
			enderecoService.update(enderecoModel);
			return ResponseType.SUCCESS_UPDATE.getMessage();
		}
		throw new UnauthorizedRequestException();
	}

	/**
	 * Endpoint responsavel por deletar o endereco do egresso.
	 *
	 * @param endereco Estrutura de dados contendo as informações
	 *                 necessárias para deletar o endereco.
	 * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
	 * @author Bruno Eiki
	 * @since 17/04/2023
	 */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public boolean deleteById(Integer id) {
		return enderecoService.deleteById(id);
	}

}
