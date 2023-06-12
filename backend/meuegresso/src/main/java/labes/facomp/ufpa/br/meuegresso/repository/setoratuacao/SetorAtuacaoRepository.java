package labes.facomp.ufpa.br.meuegresso.repository.setoratuacao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;

public interface SetorAtuacaoRepository extends CrudRepository<SetorAtuacaoModel, Integer> {

    List<SetorAtuacaoModel> findAll();

    Optional<SetorAtuacaoModel> findByNomeIgnoreCase(String nome);

    boolean existsByNomeIgnoreCase(String nome);
}
