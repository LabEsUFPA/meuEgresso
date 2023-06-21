package labes.facomp.ufpa.br.meuegresso.service.agendamento.impl;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ScheduledFuture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.dto.mensagem.MensagemStatusDTO;
import labes.facomp.ufpa.br.meuegresso.model.MensagemModel;
import labes.facomp.ufpa.br.meuegresso.repository.mensagem.MensagemRepository;
import labes.facomp.ufpa.br.meuegresso.service.agendamento.AgendamentoService;
import labes.facomp.ufpa.br.meuegresso.service.mail.MailService;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AgendamentoServiceImpl implements AgendamentoService, Runnable {

    private final UsuarioService usuarioService;

    private final MailService mailService;

    private final MensagemRepository mensagemRepository;

    private Map<String, ScheduledFuture<?>> taskList = new HashMap<>();

    @Autowired
    private TaskScheduler taskScheduler;

    public Integer checkData(LocalDateTime dateTime, LocalDateTime nowDateTime) {
        Integer year = dateTime.getYear() - nowDateTime.getYear();
        Integer month = dateTime.getMonth().getValue() - nowDateTime.getMonth().getValue();
        Integer day = dateTime.getDayOfMonth() - nowDateTime.getDayOfMonth();
        Integer hour = dateTime.getDayOfMonth() - nowDateTime.getDayOfMonth();
        Integer minute = dateTime.getMinute() - nowDateTime.getMinute();
        if (year == 0 && month == 0 && day == 0 && hour == 0 && minute == 0) {
            return 0;
        } else {
            return 1;
        }
    }

    public Integer yearlyMessage(LocalDateTime dateTime, LocalDateTime nowDateTime) {
        Integer month = dateTime.getMonth().getValue() - nowDateTime.getMonth().getValue();
        Integer day = dateTime.getDayOfMonth() - nowDateTime.getDayOfMonth();
        Integer hour = dateTime.getHour() - nowDateTime.getHour();
        Integer minute = dateTime.getMinute() - nowDateTime.getMinute();
        if (month == 0 && day == 0 && hour == 0 && minute == 0) {
            return 0;
        } else {
            return 1;
        }
    }

    public Integer semesterMessage(LocalDateTime dateTime, LocalDateTime nowDateTime) {
        if ((dateTime.getMonth().getValue() - nowDateTime.getMonth().getValue()) % 6 == 0) {
            return dateTime.getDayOfMonth() - nowDateTime.getDayOfMonth();
        } else {
            return 1;
        }
    }

    public Integer statusData(LocalDateTime dateTime, LocalDateTime nowDateTime) {
        Integer year = dateTime.getYear() - nowDateTime.getYear();
        Integer month = dateTime.getMonth().getValue() - nowDateTime.getMonth().getValue();
        Integer day = dateTime.getDayOfMonth() - nowDateTime.getDayOfMonth();
        Integer minute = dateTime.getMinute() - nowDateTime.getMinute();
        if (year < 0) {
            return 0;
        } 
        else if (year == 0) {
            if (month < 0) {
                return 0;
            } 
            else if (month == 0) {
                if (day < 0) {
                    return 0;
                } 
                else if(minute <= 0){
                    return 0;
                }
                else {
                    return 1;
                }
            } else {
                return 1;
            }
        } else {
            return 1;
        }
    }

    @Override
    public MensagemStatusDTO getMensagensStatus() {
        List<MensagemModel> lista = mensagemRepository.findAll();
        Map<String, Map<LocalDateTime, String>> mensagemStatus = new HashMap<>();

        for (MensagemModel mensagem : lista) {
            if (statusData(mensagem.getDataEnvio(), LocalDateTime.now()) == 0) {
                final String status = "Enviado";
                Map<LocalDateTime, String> mensagemDataStatus = new HashMap<>();
                mensagemDataStatus.computeIfAbsent(mensagem.getDataEnvio(), k -> status);
                mensagemStatus.put(mensagem.getEscopo(), mensagemDataStatus);
            } else {
                final String status = "Pendente";
                Map<LocalDateTime, String> mensagemDataStatus = new HashMap<>();
                mensagemDataStatus.computeIfAbsent(mensagem.getDataEnvio(), k -> status);
                mensagemStatus.put(mensagem.getEscopo(), mensagemDataStatus);
            }
        }
        return MensagemStatusDTO.builder().mensagensStatus(mensagemStatus).build();
    }

    @Override
    public void scheduledSendEmail() {
        Map<String, LocalDateTime> emailList = usuarioService.findByAtivo();
        List<MensagemModel> mensagemEnvioUmaVez = mensagemRepository.findMensagemByData();
        List<MensagemModel> mensagemAnual = mensagemRepository.findMensagemByDataAnual();
        List<MensagemModel> mensagemSemestral = mensagemRepository.findMensagemByDataSemestral();
        Integer size = mensagemEnvioUmaVez.size();
        Integer sizesAnual = mensagemAnual.size();
        Integer sizeSemestral = mensagemSemestral.size();

        for (int i = 0; i < size; i++) {
            if (mensagemEnvioUmaVez.get(i).getEmail() != null) {
                mailService.sendEmail(mensagemEnvioUmaVez.get(i).getEmail(), mensagemEnvioUmaVez.get(i).getEscopo(),mensagemEnvioUmaVez.get(i).getCorpo());
                mensagemEnvioUmaVez.get(i).setDataEnviada(LocalDateTime.now());
            } 
            else {
                for (String email : emailList.keySet()) {
                    mailService.sendEmail(email, mensagemEnvioUmaVez.get(i).getEscopo(), mensagemEnvioUmaVez.get(i).getCorpo());
                }
                mensagemEnvioUmaVez.get(i).setDataEnviada(LocalDateTime.now());
            }
        }
        for (int i = 0; i < sizesAnual; i++) {
            for (String email : emailList.keySet()) {
                mailService.sendEmail(email, mensagemAnual.get(i).getEscopo(), mensagemAnual.get(i).getCorpo());
            }
            mensagemEnvioUmaVez.get(i).setDataEnviada(LocalDateTime.now());
        }
        for (int i = 0; i < sizeSemestral; i++) {
            for (String email : emailList.keySet()) {
                mailService.sendEmail(email, mensagemSemestral.get(i).getEscopo(), mensagemSemestral.get(i).getCorpo());
            }
            mensagemEnvioUmaVez.get(i).setDataEnviada(LocalDateTime.now());
        }
    }

    @Override
    public void run() {
        scheduledSendEmail();
    }

    public static String toCron(final String seg, final String mins, final String hrs, final String dayOfMonth,
            final String month) {
        return String.format("%s %s %s %s %s *", seg, mins, hrs, dayOfMonth, month);
    }

    @Override
    public void setScheduleATask(Runnable tasklet) {
        ScheduledFuture<?> scheduledTask = taskScheduler.schedule(tasklet, new CronTrigger("0 */5 * * * *"));
        String jobId = String.valueOf(1);
        taskList.put(jobId, scheduledTask);
        /*String cronExpression = toCron(String.valueOf(0),
                String.valueOf(dateTime.getMinute()),
                String.valueOf(dateTime.getHour()),
                String.valueOf(dateTime.getDayOfMonth()),
                String.valueOf(dateTime.getMonth().getValue()));
        if (frequente) {
            cronExpression = toCron(String.valueOf(0),
                    String.valueOf(dateTime.getMinute()),
                    String.valueOf(dateTime.getHour()),
                    String.valueOf(dateTime.getDayOfMonth()),
                    String.valueOf(dateTime.getMonth().getValue()));
            ScheduledFuture<?> scheduledTask = taskScheduler.schedule(tasklet, new CronTrigger(cronExpression));
            String jobId = String.valueOf(mensagemModel.getId());
            taskList.put(jobId, scheduledTask);
        } else {
            ScheduledFuture<?> scheduledTask = taskScheduler.schedule(tasklet, new CronTrigger(cronExpression));
            String jobId = String.valueOf(mensagemModel.getEscopo());
            taskList.put(jobId, scheduledTask);
        }*/
    }

    @Override
    public void removeScheduledTask() {
        String mensagemId = String.valueOf(1);
        ScheduledFuture<?> scheduledTask = taskList.get(mensagemId);
        if (scheduledTask != null) {
            scheduledTask.cancel(true);
            taskList.remove(mensagemId, scheduledTask);
        }
        /*if (mensagemModel.getEmail() != null) {
            String mensagemEmail = mensagemModel.getEscopo();
            ScheduledFuture<?> scheduledTask = taskList.get(mensagemEmail);
            if (scheduledTask != null) {
                scheduledTask.cancel(true);
                taskList.remove(mensagemEmail, scheduledTask);
            }
        } else {
            String mensagemId = String.valueOf(mensagemModel.getId());
            ScheduledFuture<?> scheduledTask = taskList.get(mensagemId);
            if (scheduledTask != null) {
                scheduledTask.cancel(true);
                taskList.remove(mensagemId, scheduledTask);
            }
        }*/
    }

    @Override
    public Map<String, ScheduledFuture<?>> getTasks() {
        return taskList;
    }
}
