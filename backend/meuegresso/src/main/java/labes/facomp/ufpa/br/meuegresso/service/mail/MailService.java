package labes.facomp.ufpa.br.meuegresso.service.mail;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ScheduledFuture;

import labes.facomp.ufpa.br.meuegresso.dto.mensagem.MensagemStatusDTO;
import labes.facomp.ufpa.br.meuegresso.model.MensagemModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;

public interface MailService {

    public void sendEmail(String to, String subject, String text);

    public void usuarioCadastrado(UsuarioModel usuario);

    public MensagemModel save(MensagemModel mensagemModel);

    public MensagemModel update(MensagemModel mensagemModel);

    public List<MensagemModel> findAll();

    public MensagemModel findbyId(Integer id);

    public boolean deleteById(Integer idMensagem);

    public MensagemStatusDTO getMensagensStatus();
    
    public void scheduledSendEmail();

    public void setScheduleATask(Runnable tasklet, LocalDateTime dateTime, boolean frequente, boolean anual, MensagemModel mensagemModel);

    public void removeScheduledTask(MensagemModel mensagemModel);

    public void setEmailAnualCadastro(Runnable tasklet);

    public Map<String, ScheduledFuture<?>> getTasks();

}
