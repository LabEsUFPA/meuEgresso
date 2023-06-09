package labes.facomp.ufpa.br.meuegresso.controller.administrador.mensagem;

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
import labes.facomp.ufpa.br.meuegresso.dto.mensagem.MensagemDTO;
import labes.facomp.ufpa.br.meuegresso.dto.mensagem.MensagemStatusDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.exceptions.EmailMensagemNotFoundException;
import labes.facomp.ufpa.br.meuegresso.exceptions.EmailMessageNotValidException;
import labes.facomp.ufpa.br.meuegresso.model.MensagemModel;
import labes.facomp.ufpa.br.meuegresso.service.agendamento.AgendamentoService;
import labes.facomp.ufpa.br.meuegresso.service.mail.MailService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para criar um novo email.
 *
 * @author Camilo Santos, Pedro Inácio
 * @since 16/06/2023
 * @version 1.0.1
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/administrador/mensagem")
public class MensagemAdmController {

	private final MailService mailService;

	private final AgendamentoService agendamentoService;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsável por retornar a lista com o status das mensagens no banco
	 * de
	 * dados.
	 *
	 * @return {@link MensagemStatusDTO} Lista de emails salvos com seus status;
	 * @author Pedro Inácio
	 * @since 15/06/2023
	 */
	@GetMapping
	@ResponseStatus(code = HttpStatus.OK)
	@PreAuthorize(value = "hasRole('ADMIN') or hasRole('SECRETARIO')")
	public MensagemStatusDTO consultarStatusMensagens() {
		return agendamentoService.getMensagensStatus();
	}

	/**
	 * Endpoint responsável por retornar a lista com as mensagens no banco de
	 * dados.
	 *
	 * @return {@link List<MensagemDTO>} Lista de emails salvos.
	 * @author Pedro Inácio
	 * @since 15/06/2023
	 */
	@GetMapping(value = "/consultarMensagens")
	@ResponseStatus(code = HttpStatus.OK)
	@PreAuthorize(value = "hasRole('ADMIN') or hasRole('SECRETARIO')")
	public List<MensagemDTO> consultarMensagens() {
		return mapper.map(mailService.findAll(), new TypeToken<List<MensagemDTO>>() {
		}.getType());
	}

	/**
	 * Endpoint responsavel por atualizar o email.
	 *
	 * @param mensagemDTO Estrutura de dados contendo as informações necessárias
	 *                    para
	 *                    atualizar o emails.
	 * @return {@link String} mensagem de confirmação de atualização.
	 * @author Pedro Inácio
	 * @since 15/06/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
	public String atualizarMensagem(@RequestBody @Valid MensagemDTO mensagemDTO) throws EmailMensagemNotFoundException {
		MensagemModel resposta = mailService.update(mapper.map(mensagemDTO, MensagemModel.class));
		if (resposta == null) {
			throw new EmailMensagemNotFoundException(String.format(ErrorType.DATABASE_003.getMessage()),ErrorType.DATABASE_003.getInternalCode());
		}
		return ResponseType.SUCCESS_UPDATE.getMessage();
	}

	/**
	 * Endpoint responsável por deletar usuário por sua ID>
	 *
	 * @param id Integer do id do email
	 * @return {@link String} mensagem de confirmação de deleção.
	 * @author Pedro Inácio
	 * @since 15/06/2023
	 */
	@DeleteMapping
	@ResponseStatus(code = HttpStatus.OK)
	@PreAuthorize("hasRole('ADMIN')")
	public String deleteById(@PathVariable(name = "id") Integer id) throws EmailMensagemNotFoundException {
		if (mailService.deleteById(id)) {
			return ResponseType.SUCCESS_DELETE.getMessage();
		}
		throw new EmailMensagemNotFoundException(String.format(ErrorType.DATABASE_004.getMessage()),ErrorType.DATABASE_004.getInternalCode());
	}

	/**
	 * Endpoint responsavel por salvar o email.
	 *
	 * @param mensagemDTO Estrutura de dados contendo as informações necessárias
	 *                    para
	 *                    salvar o email.
	 * @return {@link String} mensagem de confirmação de salvamento.
	 * @author Pedro Inácio
	 * @since 15/06/2023
	 */
	@PostMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	public String save(@RequestBody @Valid MensagemDTO mensagemDTO)throws EmailMessageNotValidException {
		try{
			MensagemModel mensagemModel = mapper.map(mensagemDTO, MensagemModel.class);
			mailService.save(mensagemModel);
			return ResponseType.SUCCESS_UPDATE.getMessage();
		} catch (Exception e) {
			throw new EmailMessageNotValidException(String.format(ErrorType.REPORT_006.getMessage()),ErrorType.REPORT_006.getInternalCode());
		}
	}

}
