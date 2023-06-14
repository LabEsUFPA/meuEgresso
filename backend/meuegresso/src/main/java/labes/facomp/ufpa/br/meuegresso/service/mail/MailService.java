package labes.facomp.ufpa.br.meuegresso.service.mail;

import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;

public interface MailService {

    public void sendEmail(String to, String subject, String text);

    public void usuarioCadastrado(UsuarioModel usuario);
}
