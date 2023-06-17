package labes.facomp.ufpa.br.meuegresso.service.mail;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ScheduledFuture;

import labes.facomp.ufpa.br.meuegresso.model.MensagemModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;

public interface MailService {

    public void sendEmail(String to, String subject, String text);

    public void usuarioCadastrado(UsuarioModel usuario);

    public MensagemModel save(MensagemModel mensagemModel);

    public MensagemModel update(MensagemModel mensagemModel);

    public List<MensagemModel> findAll();

    public boolean deleteById(Integer idMensagem);

    public void scheduledSendEmail();

    public void setScheduleATask(Runnable tasklet, LocalDateTime dateTime);

    public void removeScheduledTask(Integer jobId);

    public void setEmailAnualCadastro(Runnable tasklet);

    public Map<Integer, ScheduledFuture<?>> getTasks();
}
