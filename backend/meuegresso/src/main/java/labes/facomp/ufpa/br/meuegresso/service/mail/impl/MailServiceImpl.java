package labes.facomp.ufpa.br.meuegresso.service.mail.impl;

import java.net.URI;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
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
import org.springframework.web.util.UriComponentsBuilder;

import labes.facomp.ufpa.br.meuegresso.dto.mensagem.MensagemStatusDTO;
import labes.facomp.ufpa.br.meuegresso.model.MensagemModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.mensagem.MensagemRepository;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.mail.MailService;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailServiceImpl implements MailService, Runnable {

    private final JwtService jwtService;

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

    public void usuarioCadastrado(UsuarioModel usuario, String redirect) {
        SimpleMailMessage mensagem = new SimpleMailMessage();
        String token = jwtService.generateToken(Map.of("email", usuario.getEmail(), "nome", usuario.getNome()), 30,
                ChronoUnit.MINUTES);
        URI location = UriComponentsBuilder.fromHttpUrl(redirect)
                .queryParam("tokenAuth", token).build().toUri();
        mensagem.setTo(usuario.getEmail());
        mensagem.setSubject("Cadastro no sistema de Egresso.");
        mensagem.setText(String.format(
                "Seu cadastro no Sistema de Egresso foi realizado com sucesso.%nAcesso o link a seguir para validar seu e-mail:%n%s",
                location.toString()));
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
    public MensagemModel findbyId(Integer id) {
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
        } else if (year == 0) {
            if (month < 0) {
                return 0;
            } else if (month == 0) {
                if (day < 0) {
                    return 0;
                } else if (minute <= 0) {
                    return 0;
                } else {
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
        List<MensagemModel> mensagemModel = mensagemRepository.findAll();
        LocalDateTime dataAtual = LocalDateTime.now();
        Integer sizes = mensagemModel.size();
        for (int i = 0; i < sizes; i++) {
            if (mensagemModel.get(i).getEmail() != null
                    && checkData(mensagemModel.get(i).getDataEnvio(), dataAtual) == 0) {
                sendEmail(mensagemModel.get(i).getEmail(), mensagemModel.get(i).getEscopo(),
                        mensagemModel.get(i).getCorpo());
                removeScheduledTask(mensagemModel.get(i));
                deleteById(mensagemModel.get(i).getId());
            } else {
                if (Boolean.TRUE.equals(mensagemModel.get(i).getFrequente())) {
                    if (Boolean.TRUE.equals(mensagemModel.get(i).getAnual())) {
                        for (String email : emailList.keySet()) {
                            if (yearlyMessage(mensagemModel.get(i).getDataEnvio(), dataAtual) == 0) {
                                sendEmail(email, mensagemModel.get(i).getEscopo(), mensagemModel.get(i).getCorpo());
                            }
                            if (yearlyMessage(emailList.get(email), dataAtual) == 0
                                    && mensagemModel.get(i).getId() == 1) {
                                sendEmail(email, mensagemModel.get(i).getEscopo(), mensagemModel.get(i).getCorpo());
                            }
                        }
                    } else {
                        for (String email : emailList.keySet()) {
                            if (semesterMessage(mensagemModel.get(i).getDataEnvio(), dataAtual) == 0) {
                                sendEmail(email, mensagemModel.get(i).getEscopo(), mensagemModel.get(i).getCorpo());
                            }
                        }
                    }
                } else if (checkData(mensagemModel.get(i).getDataEnvio(), dataAtual) == 0) {
                    for (String email : emailList.keySet()) {
                        sendEmail(email, mensagemModel.get(i).getEscopo(), mensagemModel.get(i).getCorpo());
                    }
                    removeScheduledTask(mensagemModel.get(i));
                    deleteById(mensagemModel.get(i).getId());
                }
            }
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
    public void setScheduleATask(Runnable tasklet, LocalDateTime dateTime, boolean frequente, boolean anual,
            MensagemModel mensagemModel) {
        String cronExpression = toCron(String.valueOf(0),
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
        }
    }

    @Override
    public void removeScheduledTask(MensagemModel mensagemModel) {
        if (mensagemModel.getEmail() != null) {
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
        }
    }

    @Override
    public void setEmailAnualCadastro(Runnable tasklet, MensagemModel mensagemModel) {
        if (taskList.size() == 0) {
            ScheduledFuture<?> scheduledTask = taskScheduler.schedule(tasklet, new CronTrigger("0 0 9 * * *"));
            taskList.put(String.valueOf(mensagemModel.getId()), scheduledTask);
        }
    }

    @Override
    public Map<String, ScheduledFuture<?>> getTasks() {
        return taskList;
    }
}
