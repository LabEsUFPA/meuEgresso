package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.dto.grafico.LocalPosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;

public interface EgressoTitulacaoRepository extends CrudRepository<EgressoTitulacaoModel, EgressoTitulacaoModelId> {

    List<EgressoTitulacaoModel> findAll();

    boolean existsByIdAndCreatedById(EgressoTitulacaoModelId id, Integer createdBy);

    // TODO concertar essa query
    @Query(value = "select labes.facomp.ufpa.br.meuegresso.dto.grafico.LocalPosGraficoDTO(e.nome instituicao, count(eg) quantidadeEgresso) from empresa e inner join egresso_titulacao et on et.empresa_id = e.id inner join egresso eg on eg.id = et.egresso_id_egresso group by e.nome")
    List<LocalPosGraficoDTO>countEgressoByPos();
}
