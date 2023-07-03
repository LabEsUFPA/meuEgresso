package labes.facomp.ufpa.br.meuegresso.service.agendamento;

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
    * metodo para enviar a mensagem de email agendada.
    *
    * @author Pedro Inácio
    * @since 16/06/2023
    */
    public void scheduledSendEmail();

}
