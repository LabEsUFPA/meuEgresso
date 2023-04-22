package labes.facomp.ufpa.br.meuegresso.controller.trabalhopublicado;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
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
import labes.facomp.ufpa.br.meuegresso.dto.egresso.TrabalhoPublicadoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.TrabalhoPublicadoModel;
import labes.facomp.ufpa.br.meuegresso.service.trabalhopublicacao.TrabalhoPublicadoService;
import lombok.RequiredArgsConstructor;


/**
 * Responsável por fornecer um end-point para criar um novo trabalhoPublicado.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/trabalhoPublicado")
public class TrabalhoPublicadoController {

	private final TrabalhoPublicadoService trabalhoPublicadoService;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsável por retornar a lista de trabalhoPublicado cadastrados no banco de dados.
	 * 
	 * @return {@link TrabalhoPublicadoDTO} Lista de trabalhoPublicado cadastrados
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@GetMapping
	public List<TrabalhoPublicadoDTO> consultarTrabalhoPublicados() {
		return mapper.map(trabalhoPublicadoService.findAll(), new TypeToken<List<TrabalhoPublicadoDTO>>() {
		}.getType());
	}

	

	/**
	 * Endpoint responsável por retornar um trabalhoPublicado por sua ID.
	 * 
	 * @param id Integer
	 * @return {@link TrabalhoPublicadoDTO} Dados gravados no banco.
	 * @author Alfredo Gabriel, Camilo Santos
	 * @since 21/04/2023
	 */
	@GetMapping(value = "{id}")
	@ResponseStatus(code = HttpStatus.OK)
	public TrabalhoPublicadoDTO findById(@PathVariable Integer id) {
		return mapper.map(trabalhoPublicadoService.findById(id), TrabalhoPublicadoDTO.class);
	}


	/**
	 * Endpoint responsavel por cadastrar o trabalhoPublicado.
	 *
	 * @param trabalhoPublicadoDTO Estrutura de dados contendo as informações necessárias para persistir o trabalhoPublicado.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @see {@link TrabalhoPublicadoDTO}
	 * @since 21/04/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public String cadastrarTrabalhoPublicado(@RequestBody @Valid TrabalhoPublicadoDTO trabalhoPublicadoDTO) {
		TrabalhoPublicadoModel trabalhoPublicadoModel = mapper.map(trabalhoPublicadoDTO, TrabalhoPublicadoModel.class);
		trabalhoPublicadoService.save(trabalhoPublicadoModel);
		return ResponseType.SUCESS_SAVE.getMessage();
	}

	/**
	 * Endpoint responsavel por atualizar o trabalhoPublicado.
	 * 
	 * @param trabalhoPublicadoDTO Estrutura de dados contendo as informações necessárias para
	 *                   atualizar o trabalhoPublicado.
	 * @return {@link TrabalhoPublicadoDTO} Dados gravados no banco com a Id atualizada.
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public TrabalhoPublicadoDTO atualizarTrabalhoPublicado(@RequestBody @Valid TrabalhoPublicadoDTO trabalhoPublicadoDTO) {
		TrabalhoPublicadoModel trabalhoPublicadoModel = mapper.map(trabalhoPublicadoDTO, TrabalhoPublicadoModel.class);
		trabalhoPublicadoModel = trabalhoPublicadoService.save(trabalhoPublicadoModel);
		return mapper.map(trabalhoPublicadoModel, TrabalhoPublicadoDTO.class);
	}

	/**
     * Endpoint responsavel por deletar a publicacao do egresso.
     *
     * @param publicacao Estrutura de dados contendo as informações
     *                   necessárias para deletar a publicacao.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	public boolean deleteById(Integer id) {
		return trabalhoPublicadoService.deleteById(id);
	}
	
}
