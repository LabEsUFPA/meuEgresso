package labes.facomp.ufpa.br.meuegresso.service.mail.impl;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ScheduledFuture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.model.MensagemModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.mensagem.MensagemRepository;
import labes.facomp.ufpa.br.meuegresso.service.mail.MailService;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailServiceImpl implements MailService, Runnable {

    private final MailSender mailSender;

    private final UsuarioService usuarioService;

    private final MensagemRepository mensagemRepository;
    
    private Map<Integer, ScheduledFuture<?>> taskList = new HashMap<>();

    @Autowired
    private TaskScheduler taskScheduler;

    @Override
    public void sendEmail(String to, String subject, String text) {
        SimpleMailMessage mensagem = new SimpleMailMessage();
        mensagem.setTo(to);
        mensagem.setSubject(subject);
        mensagem.setText(text);
        mailSender.send(mensagem);
    }

    public void usuarioCadastrado(UsuarioModel usuario) {
        SimpleMailMessage mensagem = new SimpleMailMessage();
        mensagem.setTo(usuario.getEmail());
        mensagem.setSubject("Cadastro no sistema de Egresso.");
        mensagem.setText("Seu cadastro no Sistema de Egresso foi realizado com sucesso.");
        mailSender.send(mensagem);
    }

    @Override
    public MensagemModel save(MensagemModel mensagemModel) {
        return mensagemRepository.save(mensagemModel);
    }

    @Override
    public MensagemModel update(MensagemModel mensagemModel) {
        if (mensagemModel.getId() != null) {
			return mensagemRepository.save(mensagemModel);
		} else {
			return null;
		}
    }

    @Override
    public List<MensagemModel> findAll() {
        return mensagemRepository.findAll();
    }

    @Override
    public boolean deleteById(Integer idMensagem) {
        if (mensagemRepository.existsById(idMensagem)) {
			mensagemRepository.deleteById(idMensagem);
			return true;
		}
		return false;
    }

    //TODO retirar cron e substituir por uma scheduled de acordo com a data de envio do email salva ao invés de checar a todo instante se já é pra mandar o email
    /*@Override
    @Async
    @Scheduled(cron = "0 * * * * *")
	public void scheduledSendEmail() {
		Map<String, LocalDateTime> emailList = usuarioService.findByAtivo();
        List<MensagemModel> mensagemModel = mensagemRepository.findAll();
        if(!(mensagemModel.isEmpty()) && (mensagemModel.get(0).getData().equals(LocalDateTime.now()))){
                for (String email : emailList.keySet()) {
                    sendEmail(email, mensagemModel.get(0).getEscopo(), mensagemModel.get(0).getCorpo());
                }
            
        }
	}*/

    public void scheduledSendEmail() {
		Map<String, LocalDateTime> emailList = usuarioService.findByAtivo();
        List<MensagemModel> mensagemModel = mensagemRepository.findAll();
        for(int i=0; i<mensagemModel.size(); i++){
            if(mensagemModel.get(i).getData().getDayOfMonth() == LocalDateTime.now().getDayOfMonth()){
                for (String email : emailList.keySet()) {
                    sendEmail(email, mensagemModel.get(0).getEscopo(), mensagemModel.get(0).getCorpo());
                }
            }
        }
    }
	

    @Override
    public void run() {
        scheduledSendEmail();
    }
    
    public static String toCron(final String mins, final String hrs, final String dayOfMonth, final String month, final String dayOfWeek, final String year) {
        return String.format("%s %s %s %s %s %s", mins, hrs, dayOfMonth, month, dayOfWeek, year);
    }
    
    @Override
    public void setScheduleATask(Runnable tasklet, LocalDateTime dateTime) {
        String cronExpression = toCron(String.valueOf(dateTime.getMinute()), 
                                        String.valueOf(dateTime.getHour()),
                                        String.valueOf(dateTime.getDayOfMonth()),
                                        String.valueOf(dateTime.getMonth()),
                                        String.valueOf(dateTime.getDayOfWeek()), 
                                        String.valueOf(dateTime.getYear()));
        ScheduledFuture<?> scheduledTask = taskScheduler.schedule(tasklet, new CronTrigger(cronExpression));
        Integer jobId = taskList.size();
        taskList.put(jobId, scheduledTask);
    }

    public void removeScheduledTask(Integer jobId) {
        ScheduledFuture<?> scheduledTask = taskList.get(jobId);
        if(scheduledTask != null) {
            scheduledTask.cancel(true);
            taskList.remove(jobId, scheduledTask);
        }
    }

    public Map<Integer, ScheduledFuture<?>> getTasks(){
        return taskList;
    }
}
