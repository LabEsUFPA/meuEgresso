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
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.MensagemModel;
import labes.facomp.ufpa.br.meuegresso.service.mail.MailService;
import labes.facomp.ufpa.br.meuegresso.service.mail.impl.MailServiceImpl;
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

	private final MailServiceImpl mailServiceImpl;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsável por retornar a lista com o status das mensagens no banco de
	 * dados.
	 *
	 * @return {@link MensagemDTO} Lista de emails salvos
	 * @author Pedro Inácio
	 * @since 15/06/2023
	 */
	@GetMapping
	@PreAuthorize(value = "hasRole('ADMIN') or hasRole('SECRETARIA')")
	public MensagemStatusDTO consultarStatusMensagens() {
		return mailService.getMensagensStatus();
	}

	@GetMapping(value = "/consultarMensagens")
	@PreAuthorize(value = "hasRole('ADMIN') or hasRole('SECRETARIA')")
	public MensagemStatusDTO consultarMensagens() {
		return mapper.map(mailService.findAll(), new TypeToken<List<MensagemDTO>>() {
		}.getType());
	}

	/**
	 * Endpoint responsavel por atualizar o email.
	 *
	 * @param MailDTO Estrutura de dados contendo as informações necessárias para
	 *                   atualizar o emails.
	 * @return {@link MensagemDTO} Dados gravados no banco com a Id atualizada.
	 * @author Pedro Inácio
	 * @since 15/06/2023
	 */
	@PutMapping
	@ResponseStatus(code = HttpStatus.CREATED)
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
	public String atualizarMensagem(@RequestBody @Valid MensagemDTO mensagemDTO) {
		if(!mailService.getTasks().isEmpty()){
			mailService.removeScheduledTask(mensagemDTO.getId());
		}
		MensagemModel mensagemModel = mapper.map(mensagemDTO, MensagemModel.class);
		mensagemModel = mailService.update(mensagemModel);
		mailService.setScheduleATask(mailServiceImpl, mensagemModel.getData(), mensagemModel.getFrequente(), mensagemModel.getAnual());
		return ResponseType.SUCCESS_UPDATE.getMessage();
	}

	/**
	 * Endpoint responsável por deletar usuário por sua ID>
	 *
	 * @param id Integer do id do email
	 * @return Boolean
	 * @author Pedro Inácio
	 * @since 15/06/2023
	 */
	@DeleteMapping
	@PreAuthorize("hasRole('ADMIN')")
	@ResponseStatus(code = HttpStatus.OK)
	public String deleteById(@PathVariable(name = "id") Integer id) {
		if (mailService.deleteById(id)) {
			return ResponseType.SUCCESS_DELETE.getMessage();
		}
		return ResponseType.FAIL_DELETE.getMessage();
	}

	/**
	 * Endpoint responsavel por salvar o email.
	 *
	 * @param mensagemDTO Estrutura de dados contendo as informações necessárias para
	 *                   salvar o email.
	 * @return {@link MensagemDTO} Dados gravados no banco com a Id atualizada.
	 * @author Pedro Inácio
	 * @since 15/06/2023
	 */
	@PostMapping
	@PreAuthorize("hasRole('ADMIN')")
	@ResponseStatus(code = HttpStatus.CREATED)
	public String save(@RequestBody @Valid MensagemDTO mensagemDTO) {
		mailService.save(mapper.map(mensagemDTO, MensagemModel.class));
		if(mailService.findAll().size() == 1){
			mailService.setEmailAnualCadastro(mailServiceImpl);
		}
		mailService.setScheduleATask(mailServiceImpl, mensagemDTO.getDataEnvio(), mensagemDTO.getFrequente(), mensagemDTO.getAnual());

		return ResponseType.SUCCESS_UPDATE.getMessage();
	}

}
