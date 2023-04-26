package labes.facomp.ufpa.br.meuegresso.controller.administrador.trabalhopublicado;

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
import labes.facomp.ufpa.br.meuegresso.dto.administradores.trabalhopublicado.TrabalhoPublicadoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.DataNotDeletedException;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.TrabalhoPublicadoModel;
import labes.facomp.ufpa.br.meuegresso.service.trabalhopublicacao.TrabalhoPublicadoService;
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
@RequestMapping("/administrador/trabalhoPublicado")
public class TrabalhoPublicadoAdmController {

	private final TrabalhoPublicadoService trabalhoPublicadoService;

	private final ModelMapper mapper;

	/**
     * Endpoint responsavel por buscar todas as cotas no banco.
     *
     * @param void
     * @return {@link TrabalhoPublicadoDTO} Retorna uma lista com todos as cotas.
     * @author Bruno Eiki
     * @since 21/04/2023
     */
    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public List<TrabalhoPublicadoDTO> buscarTrabalhoPublicados() {
        return mapper.map(trabalhoPublicadoService.findAll(), new TypeToken<List<TrabalhoPublicadoDTO>>() {
        }.getType());
    }

	/**
	 * Endpoint responsavel por atualizar a TrabalhoPublicado do egresso.
	 *
	 * @param TrabalhoPublicadoDTO Estrutura de dados contendo as informações necessárias
	 *                    para atualizar a TrabalhoPublicado.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel.
	 * @throws InvalidRequestException
	 * @since 22/04/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIA')")
	public String atualizarTrabalhoPublicado(@RequestBody @Valid TrabalhoPublicadoDTO trabalhoPublicadoDTO) throws InvalidRequestException {
		TrabalhoPublicadoModel trabalhoPublicadoModel = mapper.map(trabalhoPublicadoDTO, TrabalhoPublicadoModel.class);
		trabalhoPublicadoService.update(trabalhoPublicadoModel);
		return ResponseType.SUCESS_UPDATE.getMessage();
	}

	/**
	 * Endpoint responsavel por deletar a TrabalhoPublicado do egresso.
	 *
	 * @param id Integer corresponde a Id de uma TrabalhoPublicado.
	 * @return Mensagem de confirmacao.
	 * @author Alfredo Gabriel
	 * @throws DataNotDeletedException
	 * @since 22/04/2023
	 * @see {@link ResponseType}
	 */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	public String deleteById(Integer id) throws DataNotDeletedException {
		if (trabalhoPublicadoService.deleteById(id)) {
			return ResponseType.SUCESS_DELETE.getMessage();
		}
		throw new DataNotDeletedException();
	}

}
