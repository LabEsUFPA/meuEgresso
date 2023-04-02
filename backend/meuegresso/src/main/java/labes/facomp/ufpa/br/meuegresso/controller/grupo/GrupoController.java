package labes.facomp.ufpa.br.meuegresso.controller.grupo;

import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
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
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/grupo")
public class GrupoController {

	private final GrupoService grupoService;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsavel por cadastrar o usuário.
	 *
	 * @param usuario Estrutura de dados contendo as informações necessárias para persistir o Usuário.
	 * @return {@link GrupoModel} Dados gravados no banco com a Id atualizada.
	 * @author Alfredo Gabriel
	 * @since 26/03/2023
	 */
	@PostMapping(value="/cadastrar")
	public ResponseEntity<GrupoDTO> cadastrarUsuario(@RequestBody @Valid GrupoDTO grupoDTO) {
		GrupoModel grupoModel = mapper.map(grupoDTO, GrupoModel.class);
		grupoModel = grupoService.save(grupoModel);
		return ResponseEntity.ok(mapper.map(grupoModel, GrupoDTO.class));
	}

}
