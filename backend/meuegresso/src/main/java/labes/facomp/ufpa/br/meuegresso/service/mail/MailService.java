package labes.facomp.ufpa.br.meuegresso.service.mail;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.model.MensagemModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;

public interface MailService {

    public void sendEmail(String to, String subject, String text);

    public void usuarioCadastrado(UsuarioModel usuario);

    public MensagemModel save(MensagemModel mensagemModel);

    public MensagemModel update(MensagemModel mensagemModel);

    public List<MensagemModel>  findAll();

    public boolean deleteById(Integer idMensagem);
}
