package labes.facomp.ufpa.br.meuegresso.controller.depoimento;

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
import labes.facomp.ufpa.br.meuegresso.dto.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;
import labes.facomp.ufpa.br.meuegresso.service.depoimento.DepoimentoService;
import lombok.RequiredArgsConstructor;


/**
 * Responsável por fornecer um end-point para criar um novo depoimento.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/depoimento")
public class DepoimentoController {

	private final DepoimentoService depoimentoService;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsável por retornar a lista de depoimento cadastrados no banco de dados.
	 * 
	 * @return {@link DepoimentoDTO} Lista de depoimento cadastrados
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@GetMapping
	public List<DepoimentoDTO> consultarDepoimentos() {
		return mapper.map(depoimentoService.findAll(), new TypeToken<List<DepoimentoDTO>>() {
		}.getType());
	}

	

	/**
	 * Endpoint responsável por retornar um depoimento por sua ID.
	 * 
	 * @param id Integer
	 * @return {@link DepoimentoDTO} Dados gravados no banco.
	 * @author Alfredo Gabriel, Camilo Santos
	 * @since 21/04/2023
	 */
	@GetMapping(value = "{id}")
	@ResponseStatus(code = HttpStatus.OK)
	public DepoimentoDTO findById(@PathVariable Integer id) {
		return mapper.map(depoimentoService.findById(id), DepoimentoDTO.class);
	}


	/**
	 * Endpoint responsavel por cadastrar o depoimento.
	 *
	 * @param depoimentoDTO Estrutura de dados contendo as informações necessárias para persistir o depoimento.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @see {@link DepoimentoDTO}
	 * @since 21/04/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public String cadastrarDepoimento(@RequestBody @Valid DepoimentoDTO depoimentoDTO) {
		DepoimentoModel depoimentoModel = mapper.map(depoimentoDTO, DepoimentoModel.class);
		depoimentoService.save(depoimentoModel);
		return ResponseType.SUCESS_SAVE.getMessage();
	}

	/**
     * Endpoint responsavel por atualizar o depoimento do egresso.
     *
     * @param depoimento Estrutura de dados contendo as informações necessárias para
     *                   atualizar o depoimento.
     * @return {@link depoimentoModel} Dados gravados no banco com a Id
     *         atualizada.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public DepoimentoDTO atualizarDepoimento(@RequestBody @Valid DepoimentoDTO depoimentoDTO) {
		DepoimentoModel depoimentoModel = mapper.map(depoimentoDTO, DepoimentoModel.class);
		depoimentoModel = depoimentoService.save(depoimentoModel);
		return mapper.map(depoimentoModel, DepoimentoDTO.class);
	}

	/**
     * Endpoint responsavel por deletar o depoimento do egresso.
     *
     * @param depoimento Estrutura de dados contendo as informações
     *                   necessárias para deletar o depoimento.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	public boolean deleteById(Integer id) {
		return depoimentoService.deleteById(id);
	}
	
}
