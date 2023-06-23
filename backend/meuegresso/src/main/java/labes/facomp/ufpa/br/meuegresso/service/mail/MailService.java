package labes.facomp.ufpa.br.meuegresso.service.mail;

import java.util.List;

import labes.facomp.ufpa.br.meuegresso.model.MensagemModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos, Pedro Inácio
 * @since 11/06/2023
 * @version 1.0
 */
public interface MailService {

    /**
    * metodo para enviar o email.
    *
    * @param usuarioModel Dados do usuário
    * @author Alfredo Gabriel
    * @since 11/06/2023
    */
    public void sendEmail(String to, String subject, String text);
    
    /**
    * metodo para enviar o email para um usuario.
    *
    * @param usuarioModel Dados do usuário
    * @author Alfredo Gabriel
    * @since 11/06/2023
    */
    public void usuarioCadastrado(UsuarioModel usuario);

    /**
    * metodo para salvar a mensagem de email.
    *
    * @param usuarioModel Dados do usuário
	* @return {@link MensagemModel} Dados após serem gravados no banco de dados.
    * @author Pedro Inácio
    * @since 16/06/2023
    */
    public MensagemModel save(MensagemModel mensagemModel);

    /**
    * metodo para atualizar a mensagem de email.
    *
    * @param mensagemModel Dados da mensagem.
	* @return {@link MensagemModel} Dados após serem atualizados no banco de dados.
    * @author Pedro Inácio
    * @since 16/06/2023
    */
    public MensagemModel update(MensagemModel mensagemModel);

    /**
    * metodo para buscar todas as mensagens de email.
    *
    * @param usuarioModel Dados do usuário
	* @return {@link List<MensagemModel>} Dados após serem gravados no banco de dados.
    * @author Camilo Santos
    * @since 16/06/2023
    */
    public List<MensagemModel> findAll();

    /**
    * metodo para buscar a mensagem de email pelo id.
    *
    * @param usuarioModel Dados do usuário
	* @return {@link MensagemModel} Dados após serem gravados no banco de dados.
    * @author Pedro Inácio
    * @since 17/06/2023
    */
    public MensagemModel findbyId(Integer id);

    /**
    * metodo para deletar a mensagem de email pelo id.
    *
    * @param idMensagem id da mensagem
	* @return {@link boolean} booleano após ser deletado do banco de dados.
    * @author Pedro Inácio
    * @since 16/06/2023
    */
    public boolean deleteById(Integer idMensagem);

}
