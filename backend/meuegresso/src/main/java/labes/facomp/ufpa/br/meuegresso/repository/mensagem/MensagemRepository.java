package labes.facomp.ufpa.br.meuegresso.repository.mensagem;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.MensagemModel;

public interface MensagemRepository extends CrudRepository<MensagemModel, Integer> {
    List<MensagemModel> findAll();

    Optional<MensagemModel> findByMensagemId(Integer id);
    
}
