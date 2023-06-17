package labes.facomp.ufpa.br.meuegresso.service.recuperacao_senha;

import java.util.UUID;

import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;
import labes.facomp.ufpa.br.meuegresso.model.RecuperacaoSenhaModel;

public interface RecuperacaoSenhaService {

    public boolean cadastrarSolicitacaoRecuperacao(String email, String redirect);

    public RecuperacaoSenhaModel tokenValido(UUID token) throws UnauthorizedRequestException;

    public RecuperacaoSenhaModel save(RecuperacaoSenhaModel recuperacaoSenha);
}
