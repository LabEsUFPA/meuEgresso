package labes.facomp.ufpa.br.meuegresso.controller.administrador.mensagem;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ScheduledFuture;

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
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.MensagemModel;
import labes.facomp.ufpa.br.meuegresso.service.agendamento.AgendamentoService;
import labes.facomp.ufpa.br.meuegresso.service.agendamento.impl.AgendamentoServiceImpl;
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

	private final AgendamentoServiceImpl agendamentoServiceImpl;

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
	@PreAuthorize(value = "hasRole('ADMIN') or hasRole('SECRETARIO')")
	public MensagemStatusDTO consultarStatusMensagens() {
		return agendamentoService.getMensagensStatus();
	}

	/**
	 * Endpoint responsável por retornar a lista com o agendamento de tarefas das
	 * mensagens no banco de
	 * dados.
	 *
	 * @return {@link Map<String, ScheduledFuture<?>>} Lista de tarefas agendadas de
	 *         mensagens salvos com seus status;
	 * @author Pedro Inácio
	 * @since 18/06/2023
	 */
	@GetMapping(value = "/tarefasMensagens")
	@PreAuthorize(value = "hasRole('ADMIN') or hasRole('SECRETARIO')")
	public Map<String, ScheduledFuture<?>> consultarTarefasMensagens() {
		return 	agendamentoService.getTasks();
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
	public String atualizarMensagem(@RequestBody @Valid MensagemDTO mensagemDTO) {
		mailService.update(mapper.map(mensagemDTO, MensagemModel.class));
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
	@PreAuthorize("hasRole('ADMIN')")
	@ResponseStatus(code = HttpStatus.OK)
	public String deleteById(@PathVariable(name = "id") Integer id) {
		if (mailService.deleteById(id)) {
			if(mailService.findAll().isEmpty() && !agendamentoService.getTasks().isEmpty()){
				agendamentoService.removeScheduledTask();
			}
			return ResponseType.SUCCESS_DELETE.getMessage();
		}
		return ResponseType.FAIL_DELETE.getMessage();
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
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
	@ResponseStatus(code = HttpStatus.CREATED)
	public String save(@RequestBody @Valid MensagemDTO mensagemDTO) {
		MensagemModel mensagemModel = mapper.map(mensagemDTO, MensagemModel.class);
		mensagemModel.setDataEnviada(mensagemModel.getDataEnvio());
		if(mailService.findAll().isEmpty() || agendamentoService.getTasks().isEmpty()){
			agendamentoService.setScheduleATask(agendamentoServiceImpl);
		}
		mailService.save(mensagemModel);
		return ResponseType.SUCCESS_UPDATE.getMessage();
	}

}
