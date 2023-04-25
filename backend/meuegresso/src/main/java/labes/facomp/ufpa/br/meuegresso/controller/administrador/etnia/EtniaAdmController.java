package labes.facomp.ufpa.br.meuegresso.controller.administrador.etnia;

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
import labes.facomp.ufpa.br.meuegresso.dto.etnia.EtniaDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.DataNotDeletedException;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EtniaModel;
import labes.facomp.ufpa.br.meuegresso.service.etnia.EtniaService;
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
@RequestMapping("/administrador/curso")
public class EtniaAdmController {

	private final EtniaService etniaService;

	private final ModelMapper mapper;

	/**
     * Endpoint responsavel por buscar todas as cotas no banco.
     *
     * @param void
     * @return {@link EtniaDTO} Retorna uma lista com todos as cotas.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public List<EtniaDTO> buscaretnias() {
        return mapper.map(etniaService.findAll(), new TypeToken<List<EtniaDTO>>() {
        }.getType());
    }

	/**
	 * Endpoint responsavel por atualizar a etnia do egresso.
	 *
	 * @param etniaDTO Estrutura de dados contendo as informações necessárias
	 *                    para atualizar a etnia.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel.
	 * @throws InvalidRequestException
	 * @since 22/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIA')")
	public String atualizaretnia(@RequestBody @Valid EtniaDTO etniaDTO) throws InvalidRequestException {
		EtniaModel etniaModel = mapper.map(etniaDTO, EtniaModel.class);
		etniaService.update(etniaModel);
		return ResponseType.SUCESS_UPDATE.getMessage();
	}

	/**
	 * Endpoint responsavel por deletar a etnia do egresso.
	 *
	 * @param id Integer corresponde a Id de uma etnia.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel
	 * @throws DataNotDeletedException
	 * @since 22/04/2023
	 * @see {@link ResponseType}
	 */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	public String deleteById(Integer id) throws DataNotDeletedException {
		if (etniaService.deleteById(id)) {
			return ResponseType.SUCESS_DELETE.getMessage();
		}
		throw new DataNotDeletedException();
	}

}
