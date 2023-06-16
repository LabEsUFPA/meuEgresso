package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.EmpresaGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;

public interface EgressoEmpresaRepository extends CrudRepository<EgressoEmpresaModel, EgressoEmpresaModelId> {

    List<EgressoEmpresaModel> findAll();

    boolean existsByIdAndCreatedById(EgressoEmpresaModelId id, Integer createdBy);

    @Query(value = "select new labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.EmpresaGraficoDTO(e.nome empresa, count(eg) quantidadeEgresso) from empresa e inner join egresso_empresa ee on e.id = ee.empresa inner join egresso eg on eg.id = ee.id.egressoId group by e.nome")
    List<EmpresaGraficoDTO> countEgressoByEmpresas();
}
