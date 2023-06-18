package labes.facomp.ufpa.br.meuegresso.repository.recuperacaosenha;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.RecuperacaoSenhaModel;

public interface RecuperacaoSenhaRepository extends CrudRepository<RecuperacaoSenhaModel, Integer> {

    Optional<RecuperacaoSenhaModel> findByToken(UUID token);

    Optional<RecuperacaoSenhaModel> findTopByUsuarioEmailAndPasswordChangeIsFalse(String email);

}
