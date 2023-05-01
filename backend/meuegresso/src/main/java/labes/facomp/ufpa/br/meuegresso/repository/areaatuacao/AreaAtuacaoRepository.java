package labes.facomp.ufpa.br.meuegresso.repository.areaatuacao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.AreaAtuacaoModel;

public interface AreaAtuacaoRepository extends CrudRepository<AreaAtuacaoModel, Integer> {

    List<AreaAtuacaoModel> findAll();

    Optional<AreaAtuacaoModel> findByNomeIgnoreCase(String nome);

}
