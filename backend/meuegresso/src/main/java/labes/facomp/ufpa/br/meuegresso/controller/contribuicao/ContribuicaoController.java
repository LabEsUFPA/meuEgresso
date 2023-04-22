package labes.facomp.ufpa.br.meuegresso.controller.contribuicao;

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
import labes.facomp.ufpa.br.meuegresso.dto.contribuicao.ContribuicaoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
import labes.facomp.ufpa.br.meuegresso.service.contribuicao.ContribuicaoService;
import lombok.RequiredArgsConstructor;


/**
 * Responsável por fornecer um end-point para criar um novo contribuicao.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/contribuicao")
public class ContribuicaoController {

	private final ContribuicaoService contribuicaoService;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsável por retornar a lista de contribuicao cadastrados no banco de dados.
	 * 
	 * @return {@link ContribuicaoDTO} Lista de contribuicao cadastrados
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@GetMapping
	public List<ContribuicaoDTO> consultarContribuicaos() {
		return mapper.map(contribuicaoService.findAll(), new TypeToken<List<ContribuicaoDTO>>() {
		}.getType());
	}

	

	/**
	 * Endpoint responsável por retornar um contribuicao por sua ID.
	 * 
	 * @param id Integer
	 * @return {@link ContribuicaoDTO} Dados gravados no banco.
	 * @author Alfredo Gabriel, Camilo Santos
	 * @since 21/04/2023
	 */
	@GetMapping(value = "{id}")
	@ResponseStatus(code = HttpStatus.OK)
	public ContribuicaoDTO findById(@PathVariable Integer id) {
		return mapper.map(contribuicaoService.findById(id), ContribuicaoDTO.class);
	}


	/**
	 * Endpoint responsavel por cadastrar o contribuicao.
	 *
	 * @param contribuicaoDTO Estrutura de dados contendo as informações necessárias para persistir o contribuicao.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @see {@link ContribuicaoDTO}
	 * @since 21/04/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public String cadastrarContribuicao(@RequestBody @Valid ContribuicaoDTO contribuicaoDTO) {
		ContribuicaoModel contribuicaoModel = mapper.map(contribuicaoDTO, ContribuicaoModel.class);
		contribuicaoService.save(contribuicaoModel);
		return ResponseType.SUCESS_SAVE.getMessage();
	}

	/**
     * Endpoint responsavel por atualizar a contribuições do egresso.
     *
     * @param contribucao Estrutura de dados contendo as informações necessárias
     *                    para atualizar a contribuicao.
     * @return {@link ContribuicaoModel} Dados gravados no banco com a Id
     *         atualizada.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public ContribuicaoDTO atualizarContribuicao(@RequestBody @Valid ContribuicaoDTO contribuicaoDTO) {
		ContribuicaoModel contribuicaoModel = mapper.map(contribuicaoDTO, ContribuicaoModel.class);
		contribuicaoModel = contribuicaoService.save(contribuicaoModel);
		return mapper.map(contribuicaoModel, ContribuicaoDTO.class);
	}

	/**
     * Endpoint responsavel por deletar a contribuicao do egresso.
     *
     * @param contribuicao Estrutura de dados contendo as informações
     *                     necessárias para deletar a contribuicao.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	public boolean deleteById(Integer id) {
		return contribuicaoService.deleteById(id);
	}
	
}
