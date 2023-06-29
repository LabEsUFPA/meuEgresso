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
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoTitulacaoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.DataNotDeletedException;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoTitulacaoService;
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
@RequestMapping("/administrador/EgressoTitulacao")
public class EgressoTitulacaoAdmController {

	private final EgressoTitulacaoService egressoTitulacaoService;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsavel por buscar todas as cotas no banco.
	 *
	 * @param void
	 * @return {@link EgressoTitulacaoDTO} Retorna uma lista com todos as cotas.
	 * @author Bruno Eiki
	 * @since 21/04/2023
	 */
	@GetMapping
	@ResponseStatus(code = HttpStatus.OK)
	public List<EgressoTitulacaoDTO> buscarEgressoTitulacaos() {
		return mapper.map(egressoTitulacaoService.findAll(), new TypeToken<List<EgressoTitulacaoDTO>>() {
		}.getType());
	}

	/**
	 * Endpoint responsavel por atualizar a EgressoTitulacao do EgressoTitulacao.
	 *
	 * @param EgressoTitulacaoDTO Estrutura de dados contendo as informações
	 *                            necessárias
	 *                            para atualizar a EgressoTitulacao.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel.
	 * @throws InvalidRequestException
	 * @since 22/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIA')")
	public String atualizarEgressoTitulacao(@RequestBody @Valid EgressoTitulacaoDTO egressoTitulacaoDTO)
			throws InvalidRequestException {
		EgressoTitulacaoModel egressoTitulacaoModel = mapper.map(egressoTitulacaoDTO, EgressoTitulacaoModel.class);
		egressoTitulacaoService.update(egressoTitulacaoModel);
		return ResponseType.SUCCESS_UPDATE.getMessage();
	}

	/**
	 * Endpoint responsavel por deletar a EgressoTitulacao do EgressoTitulacao.
	 *
	 * @param id Integer corresponde a Id de uma EgressoTitulacao.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel
	 * @throws DataNotDeletedException
	 * @since 22/04/2023
	 * @see {@link ResponseType}
	 */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	public String deleteById(EgressoTitulacaoModelId egressoTitulacaoModelId) throws DataNotDeletedException {
		if (egressoTitulacaoService.deleteById(egressoTitulacaoModelId)) {
			return ResponseType.SUCCESS_DELETE.getMessage();
		}
		throw new DataNotDeletedException();
	}

}
