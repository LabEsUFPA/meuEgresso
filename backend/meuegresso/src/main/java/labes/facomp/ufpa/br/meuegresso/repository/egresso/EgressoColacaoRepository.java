package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModelId;

public interface EgressoColacaoRepository extends CrudRepository<EgressoColacaoModel, EgressoColacaoModelId>{
    
    List<EgressoColacaoModel> findAll();

}
