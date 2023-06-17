package labes.facomp.ufpa.br.meuegresso.repository.areaatuacao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import jakarta.persistence.Tuple;
import labes.facomp.ufpa.br.meuegresso.model.AreaAtuacaoModel;

public interface AreaAtuacaoRepository extends CrudRepository<AreaAtuacaoModel, Integer> {

    List<AreaAtuacaoModel> findAll();

    Optional<AreaAtuacaoModel> findByNomeIgnoreCase(String nome);

    @Query(value = "SELECT aa.nome, COUNT(ee.areaAtuacao) FROM area_atuacao aa LEFT JOIN egresso_empresa ee ON ee.areaAtuacao.id  = aa.id  GROUP BY aa.nome ")
    List<Tuple> countEgressoByAreaAtuacao();

}
