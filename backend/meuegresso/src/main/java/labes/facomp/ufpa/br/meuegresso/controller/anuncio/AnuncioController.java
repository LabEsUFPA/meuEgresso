package labes.facomp.ufpa.br.meuegresso.controller.anuncio;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import java.time.LocalDate;

import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.controller.publico.egresso.EgressoPubController;
import labes.facomp.ufpa.br.meuegresso.dto.anuncio.AnuncioDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.egresso.EgressoAnuncioDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.usuario.UsuarioDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.NotFoundFotoEgressoException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;
import labes.facomp.ufpa.br.meuegresso.service.anuncio.AnuncioService;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;
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
@RequestMapping("/anuncio")
public class AnuncioController {

	private static final Logger logger = LoggerFactory.getLogger(AnuncioController.class);

	private final UsuarioService usuarioService;

	private final AnuncioService anuncioService;

	private final ModelMapper mapper;

	private final JwtService jwtService;

	/**
	 * Endpoint responsável por retornar a lista de anuncio cadastrados no banco de
	 * dados.
	 *
	 * @return {@link AnuncioDTO} Lista de anuncio cadastrados
	 * @author Alfredo Gabriel, Marcus Maciel Oliveira
	 * @since 21/04/2023
	 */
	@GetMapping
	@ResponseStatus(code = HttpStatus.OK)
	public Page<AnuncioDTO> consultarAnuncios(
			@RequestParam(defaultValue = "0", required = false) Integer page,
			@RequestParam(defaultValue = "20", required = false) Integer size,
			@RequestParam(defaultValue = "ASC", required = false) Direction direction) {
		Page<AnuncioDTO> anuncios = anuncioService.findByDataExpiracaoAfter(LocalDate.now(), page, size, direction)
				.map(e -> mapper.map(e, AnuncioDTO.class));

		anuncios.forEach(anuncio -> {
			UsuarioDTO usuarioCriouAnuncio = mapper.map(usuarioService.findById(anuncio.getCreatedBy()),
					UsuarioDTO.class);
			if (usuarioCriouAnuncio != null) {
				EgressoAnuncioDTO egresso = usuarioCriouAnuncio.getEgresso();
				if (egresso != null) {
					try {
						usuarioCriouAnuncio.setFoto(linkTo(methodOn(
								EgressoPubController.class).getFotoEgresso(
										egresso.getId()))
								.toUri()
								.toString());
					} catch (NotFoundFotoEgressoException e1) {
						logger.info("Usuário sem foto", e1);
					}
				}
				anuncio.setCreatedByUser(usuarioCriouAnuncio);
			}
		});

		return anuncios;
	}

	/**
	 * Endpoint responsável por retornar a lista de anuncios filtrados
	 *
	 * @return {@link List<AnuncioDTO>} Lista de anuncio cadastrados
	 * @param titulo          título do anúncio deve conter
	 * @param minValorSalario valor mínimo do salário do anúncio
	 * @param maxValorSalario valor máximo do salário do anúncio
	 * @param areaEmprego     id da area de emprego o qual anúncio se refere
	 * @author João Paulo, Lucas Cantão
	 * @since 19/05/2023
	 */
	@GetMapping(value = "/busca")
	@ResponseStatus(code = HttpStatus.OK)
	public Page<AnuncioDTO> filtrarAnuncios(
			@RequestParam(name = "titulo", defaultValue = "") String titulo,
			@RequestParam(name = "areaEmprego", defaultValue = "0") Integer[] areaEmprego,
			@RequestParam(defaultValue = "0", required = false) Integer page,
			@RequestParam(defaultValue = "20", required = false) Integer size,
			@RequestParam(defaultValue = "ASC", required = false) Direction direction) {

		Page<AnuncioDTO> anuncios = anuncioService.findBySearch(titulo, areaEmprego, page, size, direction)
				.map(e -> mapper.map(e, AnuncioDTO.class));

		anuncios.forEach(anuncio -> {
			UsuarioDTO usuarioCriouAnuncio = mapper.map(usuarioService.findById(anuncio.getCreatedBy()),
					UsuarioDTO.class);
			if (usuarioCriouAnuncio != null) {
				EgressoAnuncioDTO egresso = usuarioCriouAnuncio.getEgresso();
				if (egresso != null) {
					try {
						usuarioCriouAnuncio.setFoto(linkTo(methodOn(
								EgressoPubController.class).getFotoEgresso(
										egresso.getId()))
								.toUri()
								.toString());
					} catch (NotFoundFotoEgressoException e1) {
						logger.info("Usuário sem foto", e1);
					}
				}
				anuncio.setCreatedByUser(usuarioCriouAnuncio);
			}
		});

		return anuncios;
	}

	/**
	 * Endpoint responsavel por cadastrar o anuncio.
	 *
	 * @param anuncioDTO Estrutura de dados contendo as informações necessárias para
	 *                   persistir o anuncio.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @see {@link AnuncioDTO}
	 * @since 21/04/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
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
	 * @return {@link AnuncioDTO} Dados gravados no banco com a Id atualizada.
	 * @author Alfredo Gabriel
	 * @throws UnauthorizedRequestException
	 * @throws InvalidRequestException
	 * @since 21/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public String atualizarAnuncio(@RequestBody @Valid AnuncioDTO anuncioDTO, JwtAuthenticationToken token)
			throws UnauthorizedRequestException, InvalidRequestException {
		if (anuncioService.existsByIdAndCreatedBy(anuncioDTO.getId(), jwtService.getIdUsuario(token))) {
			AnuncioModel anuncioModel = mapper.map(anuncioDTO, AnuncioModel.class);
			anuncioService.update(anuncioModel);
			return ResponseType.SUCCESS_UPDATE.getMessage();
		}
		throw new UnauthorizedRequestException();
	}

	/**
	 * Endpoint responsavel por deletar o
	 * anuncio do egresso apenas por quem o criou.
	 *
	 * @param id    id do anuncio a ser deletado
	 * @param token autenticação para deletar anúncio por quem o criou
	 * @return {@link boolean} Mensagem de confirmacao.
	 * @author Bruno Eiki, Lucas Cantão
	 * @since 17/06/2023
	 */
	@DeleteMapping(value = "/{id}")
	@ResponseStatus(code = HttpStatus.OK)
	@PreAuthorize("hasRole('EGRESSO')")
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public boolean deleteById(@PathVariable Integer id, JwtAuthenticationToken token) {
		if (anuncioService.existsByIdAndCreatedBy(id, jwtService.getIdUsuario(token))) {
			return anuncioService.deleteById(id);
		}
		return false;
	}

}
