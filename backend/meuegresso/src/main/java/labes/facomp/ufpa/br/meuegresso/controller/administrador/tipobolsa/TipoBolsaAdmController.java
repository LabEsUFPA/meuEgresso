package labes.facomp.ufpa.br.meuegresso.controller.administrador.tipobolsa;

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
import labes.facomp.ufpa.br.meuegresso.dto.administradores.tipobolsa.TipoBolsaDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.DataNotDeletedException;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.TipoBolsaModel;
import labes.facomp.ufpa.br.meuegresso.service.tipobolsa.TipoBolsaService;
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
@RequestMapping("/administrador/tipoBolsa")
public class TipoBolsaAdmController {

	private final TipoBolsaService tipoBolsaService;

	private final ModelMapper mapper;

	/**
     * Endpoint responsavel por buscar todas as cotas no banco.
     *
     * @param void
     * @return {@link TipoBolsaDTO} Retorna uma lista com todos as cotas.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public List<TipoBolsaDTO> buscarTipoBolsas() {
        return mapper.map(tipoBolsaService.findAll(), new TypeToken<List<TipoBolsaDTO>>() {
        }.getType());
    }

	/**
	 * Endpoint responsavel por atualizar a TipoBolsa do egresso.
	 *
	 * @param TipoBolsaDTO Estrutura de dados contendo as informações necessárias
	 *                    para atualizar a TipoBolsa.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel.
	 * @throws InvalidRequestException
	 * @since 22/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIA')")
	public String atualizarTipoBolsa(@RequestBody @Valid TipoBolsaDTO tipoBolsaDTO) throws InvalidRequestException {
		TipoBolsaModel tipoBolsaModel = mapper.map(tipoBolsaDTO, TipoBolsaModel.class);
		tipoBolsaService.update(tipoBolsaModel);
		return ResponseType.SUCCESS_UPDATE.getMessage();
	}

	/**
	 * Endpoint responsavel por deletar a TipoBolsa do egresso.
	 *
	 * @param id Integer corresponde a Id de uma TipoBolsa.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel
	 * @throws DataNotDeletedException
	 * @since 22/04/2023
	 * @see {@link ResponseType}
	 */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	public String deleteById(Integer id) throws DataNotDeletedException {
		if (tipoBolsaService.deleteById(id)) {
			return ResponseType.SUCCESS_DELETE.getMessage();
		}
		throw new DataNotDeletedException();
	}

}
