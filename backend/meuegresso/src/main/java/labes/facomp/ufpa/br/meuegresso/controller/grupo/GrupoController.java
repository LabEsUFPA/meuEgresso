package labes.facomp.ufpa.br.meuegresso.controller.grupo;

import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.grupo.GrupoDTO;
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
	 * Endpoint responsavel por cadastrar o grupo.
	 *
	 * @param usuario Estrutura de dados contendo as informações necessárias para
	 *                persistir o grupo.
	 * @return {@link GrupoDTO} Dados gravados no banco com a Id atualizada.
	 * @author Alfredo Gabriel
	 * @since 26/03/2023
	 */
	@PostMapping
	public ResponseEntity<GrupoDTO> cadastrarUsuario(@RequestBody @Valid GrupoDTO grupoDTO) {
		GrupoModel grupoModel = mapper.map(grupoDTO, GrupoModel.class);
		grupoModel = grupoService.save(grupoModel);
		return ResponseEntity.ok(mapper.map(grupoModel, GrupoDTO.class));
	}

	/**
	 * Endpoint responsavel por atualizar o grupo.
	 * 
	 * @param grupoDTO Estrutura de dados contendo as informações necessárias para
	 *                 atualizar o grupo.
	 * @return {@link GrupoDTO} Dados atualizados no banco com a Id atualizada.
	 * @author Camilo Santos
	 * @since 16/04/2023
	 */
	@PutMapping
	public ResponseEntity<GrupoDTO> atualizarUsuario(@RequestBody @Valid GrupoDTO grupoDTO) {
		GrupoModel grupoModel = mapper.map(grupoDTO, GrupoModel.class);
		grupoModel = grupoService.save(grupoModel);
		return ResponseEntity.ok(mapper.map(grupoModel, GrupoDTO.class));
	}

}
