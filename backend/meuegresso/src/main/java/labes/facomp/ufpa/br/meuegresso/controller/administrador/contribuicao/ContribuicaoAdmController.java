package labes.facomp.ufpa.br.meuegresso.controller.administrador.contribuicao;

import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.contribuicao.ContribuicaoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.DataNotDeletedException;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
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
@RequestMapping("/administrador/contribuicao")
public class ContribuicaoAdmController {

	private final ContribuicaoService contribuicaoService;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsavel por atualizar a contribuições do egresso.
	 *
	 * @param contribuicaoDTO Estrutura de dados contendo as informações necessárias
	 *                    para atualizar a contribuicao.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel.
	 * @throws InvalidRequestException
	 * @since 22/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIA')")
	public String atualizarContribuicao(@RequestBody @Valid ContribuicaoDTO contribuicaoDTO) throws InvalidRequestException {
		ContribuicaoModel contribuicaoModel = mapper.map(contribuicaoDTO, ContribuicaoModel.class);
		contribuicaoService.update(contribuicaoModel);
		return ResponseType.SUCESS_UPDATE.getMessage();
	}

	/**
	 * Endpoint responsavel por deletar a contribuicao do egresso.
	 *
	 * @param id Integer corresponde a Id de uma contribuicao.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel
	 * @throws DataNotDeletedException
	 * @since 22/04/2023
	 * @see {@link ResponseType}
	 */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	public String deleteById(Integer id) throws DataNotDeletedException {
		if (contribuicaoService.deleteById(id)) {
			return ResponseType.SUCESS_DELETE.getMessage();
		}
		throw new DataNotDeletedException();
	}

}
