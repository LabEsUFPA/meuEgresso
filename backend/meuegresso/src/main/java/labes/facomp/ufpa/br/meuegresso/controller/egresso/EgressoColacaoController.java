package labes.facomp.ufpa.br.meuegresso.controller.egresso;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoColacaoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModelId;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoColacaoService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para criar um novo EgressoColacao.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/EgressoColacao")
public class EgressoColacaoController {

	private final EgressoColacaoService EgressoColacaoService;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsável por retornar a lista de EgressoColacao cadastrados no
	 * banco de dados.
	 * 
	 * @return {@link EgressoColacaoDTO} Lista de EgressoColacao cadastrados
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@GetMapping
	public List<EgressoColacaoDTO> consultarEgressoColacaos() {
		return mapper.map(EgressoColacaoService.findAll(), new TypeToken<List<EgressoColacaoDTO>>() {
		}.getType());
	}

	/**
	 * Endpoint responsável por retornar um EgressoColacao por sua ID.
	 * 
	 * @param id Integer
	 * @return {@link EgressoColacaoDTO} Dados gravados no banco.
	 * @author Alfredo Gabriel, Camilo Santos
	 * @since 21/04/2023
	 */
	@ResponseStatus(code = HttpStatus.OK)
	@GetMapping(params = { "egressoId", "colacaoId" })
	public EgressoColacaoDTO findById(@RequestParam(required = false) Integer egressoId,
			@RequestParam(required = false) Integer colacaoId) {
		return mapper.map(
				EgressoColacaoService
						.findById(EgressoColacaoModelId.builder().egressoId(egressoId).colacaoId(colacaoId).build()),
				EgressoColacaoDTO.class);
	}

	/**
	 * Endpoint responsavel por cadastrar o EgressoColacao.
	 *
	 * @param EgressoColacaoDTO Estrutura de dados contendo as informações
	 *                          necessárias para persistir o EgressoColacao.
	 * @return String confirmando a transação.
	 * @author Alfredo Gabriel
	 * @see {@link EgressoColacaoDTO}
	 * @since 21/04/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public String cadastrarEgressoColacao(@RequestBody @Valid EgressoColacaoDTO EgressoColacaoDTO) {
		EgressoColacaoModel EgressoColacaoModel = mapper.map(EgressoColacaoDTO, EgressoColacaoModel.class);
		EgressoColacaoService.save(EgressoColacaoModel);
		return ResponseType.SUCESS_SAVE.getMessage();
	}

	/**
	 * Endpoint responsavel por atualizar o EgressoColacao.
	 * 
	 * @param EgressoColacaoDTO Estrutura de dados contendo as informações
	 *                          necessárias para
	 *                          atualizar o EgressoColacao.
	 * @return {@link EgressoColacaoDTO} Dados gravados no banco com a Id
	 *         atualizada.
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public EgressoColacaoDTO atualizarEgressoColacao(@RequestBody @Valid EgressoColacaoDTO EgressoColacaoDTO) {
		EgressoColacaoModel EgressoColacaoModel = mapper.map(EgressoColacaoDTO, EgressoColacaoModel.class);
		EgressoColacaoModel = EgressoColacaoService.save(EgressoColacaoModel);
		return mapper.map(EgressoColacaoModel, EgressoColacaoDTO.class);
	}

	/**
     * Endpoint responsavel por deletar a colacao do egresso.
     *
     * @param tituloAcademico Estrutura de dados contendo as informações
     *                        necessárias para deletar o titulo academico.
     * @return {@link ResponseEntity<String>} Mensagem de confirmacao.
     * @author Bruno Eiki
     * @since 17/04/2023
     */
	@DeleteMapping(params = { "egressoId", "colacaoId" })
	@PreAuthorize("hasRole('ADMIN')")
	public boolean deleteById(@RequestParam(required = false) Integer egressoId,
			@RequestParam(required = false) Integer colacaoId) {
		return EgressoColacaoService
				.deleteById(EgressoColacaoModelId.builder().egressoId(egressoId).colacaoId(colacaoId).build());
	}

}
