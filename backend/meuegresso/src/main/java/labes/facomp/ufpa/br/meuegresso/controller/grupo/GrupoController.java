package labes.facomp.ufpa.br.meuegresso.controller.grupo;

import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.grupo.GrupoDTO;
import labes.facomp.ufpa.br.meuegresso.exceptions.NotFoundException;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.service.grupo.GrupoService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para criar um novo usuário.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 26/03/2023
 * @version 1.0.1
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/grupo")
public class GrupoController {

	private final GrupoService grupoService;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsavel por buscar um grupo de acordo com a ID.
	 *
	 * @param id - Integer que representa uma id no banco.
	 * @return {@link GrupoDTO} Dados recuperados no banco de dados.
	 * @author Alfredo Gabriel
	 * @since 19/04/2023
	 */
	@GetMapping(value = "/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	@ResponseStatus(code = HttpStatus.OK)
	public GrupoDTO findById(@PathVariable Integer id) {
		return mapper.map(grupoService.findById(id), GrupoDTO.class);
	}

	/**
	 * Endpoint responsavel por buscar um grupo de acordo com a ID.
	 *
	 * @param grupoNome - String que representa uma nome de um Grupo.
	 * @return {@link GrupoDTO} Dados recuperados no banco de dados.
	 * @author Alfredo Gabriel
	 * @since 19/04/2023
	 */
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping(params = { "grupoNome" })
	@ResponseStatus(code = HttpStatus.OK)
	public GrupoDTO findByNomeGrupo(@RequestParam(required = false) String grupoNome) {
		return mapper.map(grupoService.findByNomeGrupo(grupoNome), GrupoDTO.class);
	}

	/**
	 * Endpoint responsavel por cadastrar o grupo.
	 *
	 * @param usuario Estrutura de dados contendo as informações necessárias para
	 *                persistir o grupo.
	 * @return {@link GrupoDTO} Dados gravados no banco com a Id atualizada.
	 *         * @author Alfredo Gabriel
	 * @since 26/03/2023
	 */
	@PostMapping
	@PreAuthorize("hasRole('ADMIN')")
	@ResponseStatus(code = HttpStatus.CREATED)
	public GrupoDTO cadastrarGrupo(@RequestBody @Valid GrupoDTO grupoDTO) {
		GrupoModel grupoModel = mapper.map(grupoDTO, GrupoModel.class);
		grupoModel = grupoService.save(grupoModel);
		return mapper.map(grupoModel, GrupoDTO.class);
	}

	/**
	 * Endpoint responsavel por atualizar o grupo.
	 *
	 * @param grupoDTO Estrutura de dados contendo as informações necessárias para
	 *                 atualizar o grupo.
	 * @return {@link GrupoDTO} Dados atualizados no banco com a Id atualizada.
	 * @author Camilo Santos
	 * @throws NotFoundException
	 * @since 16/04/2023
	 */
	@PutMapping
	@PreAuthorize("hasRole('ADMIN')")
	@ResponseStatus(code = HttpStatus.CREATED)
	public GrupoDTO atualizarGrupo(@RequestBody @Valid GrupoDTO grupoDTO) throws NotFoundException {
		if (grupoDTO.getId() == null) {
			throw new NotFoundException();
		} else {
			GrupoModel grupoModel = mapper.map(grupoDTO, GrupoModel.class);
			grupoModel = grupoService.save(grupoModel);
			return mapper.map(grupoModel, GrupoDTO.class);
		}
	}

}
