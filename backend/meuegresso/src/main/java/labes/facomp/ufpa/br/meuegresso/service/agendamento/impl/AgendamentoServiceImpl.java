package labes.facomp.ufpa.br.meuegresso.service.agendamento.impl;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
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
public class AgendamentoServiceImpl implements AgendamentoService {

    private final UsuarioService usuarioService;

    private final MailService mailService;

    private final MensagemRepository mensagemRepository;

    @Override
    public MensagemStatusDTO getMensagensStatus() {
        List<MensagemModel> lista = mensagemRepository.findAll();
        Map<String, Map<LocalDateTime, String>> mensagemStatus = new HashMap<>();

        for (MensagemModel mensagem : lista) {
            if (mensagem.getDataEnviada() == null) {
                final String status = "Não Enviado";
                Map<LocalDateTime, String> mensagemDataStatus = new HashMap<>();
                mensagemDataStatus.computeIfAbsent(mensagem.getDataEnvio(), k -> status);
                mensagemStatus.put(mensagem.getEscopo(), mensagemDataStatus);
            }
            else if(mensagem.getDataEnviada() != null && Boolean.FALSE.equals(mensagem.getFrequente())){
                final String status = "Enviado";
                Map<LocalDateTime, String> mensagemDataStatus = new HashMap<>();
                mensagemDataStatus.computeIfAbsent(mensagem.getDataEnvio(), k -> status);
                mensagemStatus.put(mensagem.getEscopo(), mensagemDataStatus);
            }
            else {
                final String status = "Pendente";
                Map<LocalDateTime, String> mensagemDataStatus = new HashMap<>();
                mensagemDataStatus.computeIfAbsent(mensagem.getDataEnvio(), k -> status);
                mensagemStatus.put(mensagem.getEscopo(), mensagemDataStatus);
            }
        }
        return MensagemStatusDTO.builder().mensagensStatus(mensagemStatus).build();
    }

    // Expessão do crontab
    // Sec | Min | Hora | Dia | Mês | Dia da Semana
    // 0 0 9 ? * 2#2 -> At 09:00:00am, on the 2nd Monday of the month, every month
    // 0 0 12 ? * MON-FRI -> Every Weekday at noon
    // 0 0 8 5 * ? -> At 08:00:00am, on the 5th day, every month
    // 0 0 8 5W * ? -> Every month on the nearest Weekday to the 5th of the month,
    // at At 08:00:00am

    @Async
    @Scheduled(cron = "0 */5 * * * *")
    @Override
    public void scheduledSendEmail() {
        Map<String, LocalDateTime> emailList = usuarioService.findByAtivo();
        List<MensagemModel> mensagemEnvioUmaVez = mensagemRepository.findEmailsParaEnviar();
        List<MensagemModel> mensagemAnual = mensagemRepository.findMensagemByDataAnual();
        List<MensagemModel> mensagemSemestral = mensagemRepository.findMensagemByDataSemestral();
        Integer size = mensagemEnvioUmaVez.size();
        Integer sizesAnual = mensagemAnual.size();
        Integer sizeSemestral = mensagemSemestral.size();

        for (int i = 0; i < size; i++) {
            mailService.sendEmail(mensagemEnvioUmaVez.get(i).getEmail(), mensagemEnvioUmaVez.get(i).getEscopo(),
                    mensagemEnvioUmaVez.get(i).getCorpo());
            mensagemEnvioUmaVez.get(i).setDataEnviada(LocalDateTime.now());
            mailService.update(mensagemEnvioUmaVez.get(i));
        }
        for (int i = 0; i < sizesAnual; i++) {
            for (String email : emailList.keySet()) {
                mailService.sendEmail(email, mensagemAnual.get(i).getEscopo(), mensagemAnual.get(i).getCorpo());
            }
            mensagemAnual.get(i).setDataEnviada(LocalDateTime.now());
            mailService.update(mensagemAnual.get(i));
        }
        for (int i = 0; i < sizeSemestral; i++) {
            for (String email : emailList.keySet()) {
                mailService.sendEmail(email, mensagemSemestral.get(i).getEscopo(), mensagemSemestral.get(i).getCorpo());
            }
            mensagemSemestral.get(i).setDataEnviada(LocalDateTime.now());
            mailService.update(mensagemSemestral.get(i));
        }
    }
}
