package labes.facomp.ufpa.br.meuegresso.service.mail;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ScheduledFuture;

import labes.facomp.ufpa.br.meuegresso.dto.mensagem.MensagemStatusDTO;
import labes.facomp.ufpa.br.meuegresso.model.MensagemModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos, Pedro Inácio
 * @since 11/06/2023
 * @version 1.0
 */
public interface MailService {

    /**
    * metodo para enviar o email.
    *
    * @param usuarioModel Dados do usuário
    * @author Alfredo Gabriel
    * @since 11/06/2023
    */
    public void sendEmail(String to, String subject, String text);

    /**
    * metodo para enviar o email para um usuario.
    *
    * @param usuarioModel Dados do usuário
    * @author Alfredo Gabriel
    * @since 11/06/2023
    */
    public void usuarioCadastrado(UsuarioModel usuario, String redirect);

    /**
    * metodo para salvar a mensagem de email.
    *
    * @param usuarioModel Dados do usuário
	* @return {@link MensagemModel} Dados após serem gravados no banco de dados.
    * @author Pedro Inácio
    * @since 16/06/2023
    */
    public MensagemModel save(MensagemModel mensagemModel);

    /**
    * metodo para atualizar a mensagem de email.
    *
    * @param mensagemModel Dados da mensagem.
	* @return {@link MensagemModel} Dados após serem atualizados no banco de dados.
    * @author Pedro Inácio
    * @since 16/06/2023
    */
    public MensagemModel update(MensagemModel mensagemModel);

    /**
    * metodo para buscar todas as mensagens de email.
    *
    * @param usuarioModel Dados do usuário
	* @return {@link List<MensagemModel>} Dados após serem gravados no banco de dados.
    * @author Camilo Santos
    * @since 16/06/2023
    */
    public List<MensagemModel> findAll();

    /**
    * metodo para buscar a mensagem de email pelo id.
    *
    * @param usuarioModel Dados do usuário
	* @return {@link MensagemModel} Dados após serem gravados no banco de dados.
    * @author Pedro Inácio
    * @since 17/06/2023
    */
    public MensagemModel findbyId(Integer id);

    /**
    * metodo para deletar a mensagem de email pelo id.
    *
    * @param idMensagem id da mensagem
	* @return {@link boolean} booleano após ser deletado do banco de dados.
    * @author Pedro Inácio
    * @since 16/06/2023
    */
    public boolean deleteById(Integer idMensagem);

    /**
    * metodo para buscar uma lista de mensagens e apresentar os status dela.
    *
	* @return {@link MensagemStatusDTO} Dados após serem gravados no banco de dados.
    * @author Pedro Inácio
    * @since 17/06/2023
    */
    public MensagemStatusDTO getMensagensStatus();

    /**
    * metodo para enviar a mensagem de email agendada pelo id.
    *
    * @author Pedro Inácio
    * @since 16/06/2023
    */
    public void scheduledSendEmail();

    /**
    * metodo para agendar a mensagem de email pelo id.
    *
    * @param tasklet instancia de classe {@link MailServiceIml} a rodar as tarefas agendadas.
    * @param dateTime data de envio da mensagem.
    * @param frequente booleano de frequencia de envio da mensagem de email.
    * @param anual booleano de anualidade, true para anual, false para semestral.
    * @param mensagemModel Dados da mensagem.
    * @author Pedro Inácio
    * @since 16/06/2023
    */
    public void setScheduleATask(Runnable tasklet, LocalDateTime dateTime, boolean frequente, boolean anual, MensagemModel mensagemModel);

    /**
    * metodo para remover a mensagem agendada de email pelo id.
    *
    * @param mensagemModel Dados da mensagem.
    * @author Pedro Inácio
    * @since 16/06/2023
    */
    public void removeScheduledTask(MensagemModel mensagemModel);

    /**
    * metodo para estabelecer a mensagem anual de email pelo id.
    *
    * @param tasklet instancia de classe {@link MailServiceIml} a rodar as tarefas agendadas.
    * @author Pedro Inácio
    * @since 16/06/2023
    */
    public void setEmailAnualCadastro(Runnable tasklet, MensagemModel mensagemModel);

    /**
    * metodo para buscar os agendamentos de mensagens de email pelo id.
    *
	* @return {@link Map<String, ScheduledFuture<?>>} Dados de status retornados.
    * @author Pedro Inácio
    * @since 16/06/2023
    */
    public Map<String, ScheduledFuture<?>> getTasks();

}
