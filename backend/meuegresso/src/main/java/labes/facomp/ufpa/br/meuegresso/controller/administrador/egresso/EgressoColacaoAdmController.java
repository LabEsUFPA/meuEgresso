package labes.facomp.ufpa.br.meuegresso.controller.administrador.egresso;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoColacaoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.DataNotDeletedException;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModelId;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoColacaoService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para criar um novo cota.
 *
 * @author Pedro Inácio
 * @since 24/04/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/administrador/EgressoColacao")
public class EgressoColacaoAdmController {

	private final EgressoColacaoService egressoColacaoService;

	private final ModelMapper mapper;

	/**
     * Endpoint responsavel por buscar todas as cotas no banco.
     *
     * @param void
     * @return {@link EgressoColacaoDTO} Retorna uma lista com todos as cotas.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public List<EgressoColacaoDTO> buscarEgressoColacaos() {
        return mapper.map(egressoColacaoService.findAll(), new TypeToken<List<EgressoColacaoDTO>>() {
        }.getType());
    }

	/**
	 * Endpoint responsavel por atualizar a EgressoColacao do egressoColacao.
	 *
	 * @param EgressoColacaoDTO Estrutura de dados contendo as informações necessárias
	 *                    para atualizar a EgressoColacao.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel.
	 * @throws InvalidRequestException
	 * @since 22/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIA')")
	public String atualizarEgressoColacao(@RequestBody @Valid EgressoColacaoDTO egressoColacaoDTO) throws InvalidRequestException {
		EgressoColacaoModel egressoColacaoModel = mapper.map(egressoColacaoDTO, EgressoColacaoModel.class);
		egressoColacaoService.update(egressoColacaoModel);
		return ResponseType.SUCESS_UPDATE.getMessage();
	}

	/**
	 * Endpoint responsavel por deletar a EgressoColacao do egressoColacao.
	 *
	 * @param id Integer corresponde a Id de uma EgressoColacao.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel
	 * @throws DataNotDeletedException
	 * @since 22/04/2023
	 * @see {@link ResponseType}
	 */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	public String deleteById(EgressoColacaoModelId egressoColacaoModelId) throws DataNotDeletedException {
		if (egressoColacaoService.deleteById(egressoColacaoModelId)) {
			return ResponseType.SUCESS_DELETE.getMessage();
		}
		throw new DataNotDeletedException();
	}

}
