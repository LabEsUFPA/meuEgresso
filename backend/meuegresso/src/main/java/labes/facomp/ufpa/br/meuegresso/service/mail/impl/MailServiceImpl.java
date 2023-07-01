package labes.facomp.ufpa.br.meuegresso.service.mail.impl;

import java.net.URI;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponentsBuilder;

import labes.facomp.ufpa.br.meuegresso.model.MensagemModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.mensagem.MensagemRepository;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;
import labes.facomp.ufpa.br.meuegresso.service.mail.MailService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailServiceImpl implements MailService {

    private final JwtService jwtService;

    private final MailSender mailSender;

    private final MensagemRepository mensagemRepository;

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
        String token = jwtService.generateToken(
                Map.of("email", usuario.getEmail(), "nome", usuario.getNome(), "recoveryPass", true), 30,
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

    public void reenviarValidacaoEmail(UsuarioModel usuario, String redirect) {
        SimpleMailMessage mensagem = new SimpleMailMessage();
        String token = jwtService.generateToken(
                Map.of("email", usuario.getEmail(), "nome", usuario.getNome(), "recoveryPass", true), 30,
                ChronoUnit.MINUTES);
        URI location = UriComponentsBuilder.fromHttpUrl(redirect)
                .queryParam("tokenAuth", token).build().toUri();
        mensagem.setTo(usuario.getEmail());
        mensagem.setSubject("Link de validação do e-amail.");
        mensagem.setText(String.format(
                "Acesso o link a seguir para validar seu e-mail:%n%s",
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
}
