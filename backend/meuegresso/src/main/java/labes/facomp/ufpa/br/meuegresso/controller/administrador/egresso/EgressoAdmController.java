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
import labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso.EgressoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.DataNotDeletedException;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
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
@RequestMapping("/administrador/egresso")
public class EgressoAdmController {

	private final EgressoService egressoService;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsavel por buscar todas as cotas no banco.
	 *
	 * @param void
	 * @return {@link EgressoDTO} Retorna uma lista com todos as cotas.
	 * @author Bruno Eiki
	 * @since 21/04/2023
	 */
	@GetMapping
	@ResponseStatus(code = HttpStatus.OK)
	public List<EgressoDTO> buscarEgressos() {
		return mapper.map(egressoService.findAll(), new TypeToken<List<EgressoDTO>>() {
		}.getType());
	}

	/**
	 * Endpoint responsavel por atualizar a Egresso do egresso.
	 *
	 * @param EgressoDTO Estrutura de dados contendo as informações necessárias
	 *                   para atualizar a Egresso.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel.
	 * @throws InvalidRequestException
	 * @since 22/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIA')")
	public String atualizarEgresso(@RequestBody @Valid EgressoDTO egressoDTO) {
		EgressoModel egressoModel = mapper.map(egressoDTO, EgressoModel.class);
		egressoService.updateEgresso(egressoModel);
		return ResponseType.SUCESS_UPDATE.getMessage();
	}

	/**
	 * Endpoint responsavel por deletar a Egresso do egresso.
	 *
	 * @param id Integer corresponde a Id de uma Egresso.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel
	 * @throws DataNotDeletedException
	 * @since 22/04/2023
	 * @see {@link ResponseType}
	 */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	public String deleteById(Integer id) throws DataNotDeletedException {
		if (egressoService.deleteById(id)) {
			return ResponseType.SUCESS_DELETE.getMessage();
		}
		throw new DataNotDeletedException();
	}

}
