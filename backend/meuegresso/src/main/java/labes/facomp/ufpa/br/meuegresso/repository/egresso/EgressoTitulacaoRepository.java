package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;

public interface EgressoTitulacaoRepository extends CrudRepository<EgressoTitulacaoModel, EgressoTitulacaoModelId> {

    List<EgressoTitulacaoModel> findAll();

    boolean existsByIdAndCreatedById(EgressoTitulacaoModelId id, Integer createdBy);

}
