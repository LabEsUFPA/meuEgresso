package labes.facomp.ufpa.br.meuegresso.service.recuperacaosenha;

import java.util.UUID;

import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.RecuperacaoSenhaModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel
 * @since 11/06/2023
 * @version 1.0
 */
public interface RecuperacaoSenhaService {

    /**
	 * Método responsável por cadastrar a solicitação de recuperação de senha.
	 *
	 * @param email
	 * @param redirect
	 * @return {@link boolean}
	 */
    public boolean cadastrarSolicitacaoRecuperacao(String email, String redirect);

    /**
	 * Método responsável por prover um tokenValido.
	 *
	 * @param token
     * @throws UnauthorizedRequestException
	 * @return {@link RecuperacaoSenhaModel}
	 */
    public RecuperacaoSenhaModel tokenValido(UUID token) throws UnauthorizedRequestException;

    /**
	 * Método responsável por salvar a RecuperacaoSenhaModel.
	 *
	 * @param recuperacaoSenha
	 * @return {@link RecuperacaoSenhaModel}
	 */
    public RecuperacaoSenhaModel save(RecuperacaoSenhaModel recuperacaoSenha);

	/**
	 * Método responsável por deletar todas as recuperações de senha pelo id do usuário.
	 *
	 * @param idUsuario
	 * @return {@link boolean}
	 */
    public boolean deleteByUsuarioId(Integer idUsuario);
}
