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

import labes.facomp.ufpa.br.meuegresso.dto.mensagem.MensagemStatusDTO;
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
    
    private Map<String, ScheduledFuture<?>> taskList = new HashMap<>();

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
    public MensagemModel findbyId(Integer id){
        return mensagemRepository.findById(id).orElseThrow();
    }

    @Override
    public boolean deleteById(Integer idMensagem) {
        if (mensagemRepository.existsById(idMensagem)) {
			mensagemRepository.deleteById(idMensagem);
			return true;
		}
		return false;
    }

    public Integer checkData(LocalDateTime dateTime, LocalDateTime nowDateTime){
        Integer year= dateTime.getYear() - nowDateTime.getYear();
        Integer month = dateTime.getMonth().getValue() - nowDateTime.getMonth().getValue();
        Integer day = dateTime.getDayOfMonth() - nowDateTime.getDayOfMonth();
        if(year == 0){
            if(month == 0){
                if(day == 0){
                    return 0;
                }
                else{
                    return 1;
                }
            }
            else{
                return 1;
            }
        }
        else{
            return 1;
        }
    }

    public Integer yearlyMessage(LocalDateTime dateTime, LocalDateTime nowDateTime){
        Integer month = dateTime.getMonth().getValue() - nowDateTime.getMonth().getValue();
        Integer day = dateTime.getDayOfMonth() - nowDateTime.getDayOfMonth();
        Integer hour = dateTime.getHour() - nowDateTime.getHour();
        if(month == 0){
            if(day == 0){
                if(hour == 0){
                    return 0;
                }
                else{
                    return 1;
                }
            }
            else{
                return 1;
            }
        }
        else{
            return 1;
        }
    }

    public Integer semesterMessage(LocalDateTime dateTime, LocalDateTime nowDateTime){
        if((dateTime.getMonth().getValue() - nowDateTime.getMonth().getValue()) % 6 == 0){
            return dateTime.getDayOfMonth() - nowDateTime.getDayOfMonth();
        }
        else{
            return 1;
        }
    }

    public Integer statusData(LocalDateTime dateTime, LocalDateTime nowDateTime){
        Integer year= dateTime.getYear() - nowDateTime.getYear();
        Integer month = dateTime.getMonth().getValue() - nowDateTime.getMonth().getValue();
        Integer day = dateTime.getDayOfMonth() - nowDateTime.getDayOfMonth();
        if(year < 0){
            return 0;
        }
        else if (year==0){
            if(month < 0){
                return 0;
            }
            else if(month == 0){
                if(day <= 0){
                    return 0;
                }
                else{
                    return 1;
                }
            }
            else{
                return 1;
            }
        }
        else{
            return 1;
        }
    }

    @Override
    public MensagemStatusDTO getMensagensStatus() {
        List<MensagemModel> lista= mensagemRepository.findAll();
        Map<String, Map<LocalDateTime, String>> mensagemStatus= new HashMap<>();
       
        for (MensagemModel email : lista){
            if(statusData(email.getData(), LocalDateTime.now()) == 0){
                final String status = "Enviado";
                Map<LocalDateTime, String> mensagemDataStatus = new HashMap<>();
                mensagemDataStatus.computeIfAbsent(email.getData(), k -> status);
                mensagemStatus.put(email.getEmail(), mensagemDataStatus);
            }
            else{
                final String status = "Pendente";
                Map<LocalDateTime, String> mensagemDataStatus = new HashMap<>();
                mensagemDataStatus.computeIfAbsent(email.getData(), k -> status);
                mensagemStatus.put(email.getEmail(), mensagemDataStatus);
            }
        }
        return MensagemStatusDTO.builder().mensagensStatus(mensagemStatus).build();
    }

    public void scheduledSendEmail() {
		Map<String, LocalDateTime> emailList = usuarioService.findByAtivo();
        List<MensagemModel> mensagemModel = mensagemRepository.findAll();
        for(int i=0; i<mensagemModel.size(); i++){
            if(mensagemModel.get(i).getEmail() != null && checkData(emailList.get(mensagemModel.get(i).getEmail()), LocalDateTime.now()) == 0){
                sendEmail(mensagemModel.get(i).getEmail(), mensagemModel.get(0).getEscopo(), mensagemModel.get(0).getCorpo());
            }
            else{
                if(Boolean.TRUE.equals(mensagemModel.get(i).getFrequente())){
                    if(Boolean.TRUE.equals(mensagemModel.get(i).getAnual())){
                        for (String email : emailList.keySet()) {
                            if(yearlyMessage(mensagemModel.get(i).getData(), LocalDateTime.now()) == 0){
                                sendEmail(email, mensagemModel.get(0).getEscopo(), mensagemModel.get(0).getCorpo());
                            }
                            if(yearlyMessage(emailList.get(email), LocalDateTime.now()) == 0){
                                sendEmail(email, mensagemModel.get(0).getEscopo(), mensagemModel.get(0).getCorpo());
                            }
                    }
                    }
                    else{
                        for (String email : emailList.keySet()) {
                            if(semesterMessage(mensagemModel.get(i).getData(), LocalDateTime.now()) == 0){
                                sendEmail(email, mensagemModel.get(0).getEscopo(), mensagemModel.get(0).getCorpo());
                            }
                    }
                    }
                }
                else if(checkData(mensagemModel.get(i).getData(),LocalDateTime.now()) == 0){
                    for (String email : emailList.keySet()) {
                        sendEmail(email, mensagemModel.get(i).getEscopo(), mensagemModel.get(i).getCorpo());
                    }
                }
            }
        }
    }
	

    @Override
    public void run() {
        scheduledSendEmail();
    }
    
    public static String toCron(final String mins, final String hrs, final String dayOfMonth, final String month, final String year) {
        return String.format("%s %s %s %s * %s", mins, hrs, dayOfMonth, month, year);
    }
    
    @Override
    public void setScheduleATask(Runnable tasklet, LocalDateTime dateTime, boolean frequente, boolean anual, MensagemModel mensagemModel) {
        String cronExpression = toCron(String.valueOf(dateTime.getMinute()), 
                                        String.valueOf(dateTime.getHour()),
                                        String.valueOf(dateTime.getDayOfMonth()),
                                        String.valueOf(dateTime.getMonth()).substring(0,4), 
                                        String.valueOf(dateTime.getYear()));
        if(frequente){
            if(anual){
                cronExpression = toCron(String.valueOf(dateTime.getMinute()), 
                                            String.valueOf(dateTime.getHour()),
                                            String.valueOf(dateTime.getDayOfMonth()),
                                            String.valueOf(dateTime.getMonth()).substring(0,4), 
                                            "*");
                ScheduledFuture<?> scheduledTask = taskScheduler.schedule(tasklet, new CronTrigger(cronExpression));
                String jobId = String.valueOf(mensagemModel.getId());
                taskList.put(jobId, scheduledTask);
            }
            else{
                cronExpression = toCron(String.valueOf(dateTime.getMinute()), 
                                            String.valueOf(dateTime.getHour()),
                                            String.valueOf(dateTime.getDayOfMonth()),
                                            "1/6",
                                            "*");
                ScheduledFuture<?> scheduledTask = taskScheduler.schedule(tasklet, new CronTrigger(cronExpression));
                String jobId = String.valueOf(mensagemModel.getId());
                taskList.put(jobId, scheduledTask);
            }
        }
        else{
            ScheduledFuture<?> scheduledTask = taskScheduler.schedule(tasklet, new CronTrigger(cronExpression));
            String jobId = String.valueOf(mensagemModel.getEmail());
            taskList.put(jobId, scheduledTask);
        }
    }

    @Override
    public void removeScheduledTask(MensagemModel mensagemModel) {
        if(mensagemModel.getEmail()!=null){
            String mensagemEmail = mensagemModel.getEmail();
            ScheduledFuture<?> scheduledTask = taskList.get(mensagemEmail);
            if(scheduledTask != null) {
                scheduledTask.cancel(true);
                taskList.remove(mensagemEmail, scheduledTask);
            }
        }
        else{
            String mensagemId = String.valueOf(mensagemModel.getId());
            ScheduledFuture<?> scheduledTask = taskList.get(mensagemId);
            if(scheduledTask != null) {
                scheduledTask.cancel(true);
                taskList.remove(mensagemId, scheduledTask);
            }
        }
    }

    @Override
    public void setEmailAnualCadastro(Runnable tasklet, MensagemModel mensagemModel) {
        if(taskList.size() == 0){
            ScheduledFuture<?> scheduledTask = taskScheduler.schedule(tasklet, new CronTrigger("0 9 * * * *"));
            taskList.put(String.valueOf(mensagemModel.getId()), scheduledTask);
        }
    }

    @Override
    public Map<String, ScheduledFuture<?>> getTasks(){
        return taskList;
    }
}
