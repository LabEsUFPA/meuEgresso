package labes.facomp.ufpa.br.meuegresso.service.agendamento;

import java.util.Map;
import java.util.concurrent.ScheduledFuture;

import labes.facomp.ufpa.br.meuegresso.dto.mensagem.MensagemStatusDTO;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos, Pedro Inácio
 * @since 11/06/2023
 * @version 1.0
 */
public interface AgendamentoService {

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
    public void setScheduleATask(Runnable tasklet);

    /**
    * metodo para remover a mensagem agendada de email pelo id.
    *
    * @param mensagemModel Dados da mensagem.
    * @author Pedro Inácio
    * @since 16/06/2023
    */
    public void removeScheduledTask();

    /**
    * metodo para buscar os agendamentos de mensagens de email pelo id.
    *
	* @return {@link Map<String, ScheduledFuture<?>>} Dados de status retornados.
    * @author Pedro Inácio
    * @since 16/06/2023
    */
    public Map<String, ScheduledFuture<?>> getTasks();

}
