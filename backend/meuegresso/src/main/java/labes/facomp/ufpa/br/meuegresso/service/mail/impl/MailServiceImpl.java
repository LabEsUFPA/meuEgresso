package labes.facomp.ufpa.br.meuegresso.service.mail.impl;

import  java.util.List;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.model.MensagemModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.mensagem.MensagemRepository;
import labes.facomp.ufpa.br.meuegresso.service.mail.MailService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailServiceImpl implements MailService {

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

}
