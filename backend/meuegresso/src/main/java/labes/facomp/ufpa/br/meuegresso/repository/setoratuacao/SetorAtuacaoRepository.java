package labes.facomp.ufpa.br.meuegresso.repository.setoratuacao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import jakarta.persistence.Tuple;
import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;

public interface SetorAtuacaoRepository extends CrudRepository<SetorAtuacaoModel, Integer> {

    List<SetorAtuacaoModel> findAll();

    Optional<SetorAtuacaoModel> findByNomeIgnoreCase(String nome);

    boolean existsByNomeIgnoreCase(String nome);

    @Query(value = "SELECT aa.nome, COUNT(ee.setorAtuacao) FROM setor_atuacao aa LEFT JOIN egresso_empresa ee ON ee.setorAtuacao.id  = aa.id  GROUP BY aa.nome ")
    List<Tuple> countEgressoBySetorAtuacao();
}
