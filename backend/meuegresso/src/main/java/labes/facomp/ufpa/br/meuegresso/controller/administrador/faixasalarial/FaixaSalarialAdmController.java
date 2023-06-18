package labes.facomp.ufpa.br.meuegresso.controller.administrador.faixasalarial;

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
import labes.facomp.ufpa.br.meuegresso.dto.faixasalarial.FaixaSalarialDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.DataNotDeletedException;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;
import labes.facomp.ufpa.br.meuegresso.service.faixasalarial.FaixaSalarialService;
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
@RequestMapping("/administrador/faixaSalarial")
public class FaixaSalarialAdmController {

	private final FaixaSalarialService faixaSalarialService;

	private final ModelMapper mapper;

	/**
     * Endpoint responsavel por buscar todas as cotas no banco.
     *
     * @param void
     * @return {@link FaixaSalarialDTO} Retorna uma lista com todos as cotas.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public List<FaixaSalarialDTO> buscarFaixaSalarials() {
        return mapper.map(faixaSalarialService.findAll(), new TypeToken<List<FaixaSalarialDTO>>() {
        }.getType());
    }

	/**
	 * Endpoint responsavel por atualizar a FaixaSalarial do egresso.
	 *
	 * @param FaixaSalarialDTO Estrutura de dados contendo as informações necessárias
	 *                    para atualizar a FaixaSalarial.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel.
	 * @throws InvalidRequestException
	 * @since 22/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIA')")
	public String atualizarFaixaSalarial(@RequestBody @Valid FaixaSalarialDTO faixaSalarialDTO) throws InvalidRequestException {
		FaixaSalarialModel faixaSalarialModel = mapper.map(faixaSalarialDTO, FaixaSalarialModel.class);
		faixaSalarialService.update(faixaSalarialModel);
		return ResponseType.SUCCESS_UPDATE.getMessage();
	}

	/**
	 * Endpoint responsavel por deletar a FaixaSalarial do egresso.
	 *
	 * @param id Integer corresponde a Id de uma FaixaSalarial.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel
	 * @throws DataNotDeletedException
	 * @since 22/04/2023
	 * @see {@link ResponseType}
	 */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	public String deleteById(Integer id) throws DataNotDeletedException {
		if (faixaSalarialService.deleteById(id)) {
			return ResponseType.SUCCESS_DELETE.getMessage();
		}
		throw new DataNotDeletedException();
	}

}
