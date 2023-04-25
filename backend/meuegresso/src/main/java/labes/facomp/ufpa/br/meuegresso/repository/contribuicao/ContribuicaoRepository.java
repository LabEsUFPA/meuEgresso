package labes.facomp.ufpa.br.meuegresso.repository.contribuicao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;

public interface ContribuicaoRepository extends CrudRepository<ContribuicaoModel, Integer> {

    List<ContribuicaoModel> findAll();

    boolean existsByIdAndCreatedById(Integer id, Integer createdBy);

}
