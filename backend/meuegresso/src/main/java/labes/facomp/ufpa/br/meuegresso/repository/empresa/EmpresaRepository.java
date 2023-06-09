package labes.facomp.ufpa.br.meuegresso.repository.empresa;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.LocalPosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;

public interface EmpresaRepository extends CrudRepository<EmpresaModel, Integer> {

    List<EmpresaModel> findAll(Sort sort);

    boolean existsByIdAndCreatedById(Integer id, Integer createdBy);

    Optional<EmpresaModel> findByNome(String nome);

    List<EmpresaModel> findByNomeContainsIgnoreCaseOrderByNomeAsc(String nome);

    @Query(value = "select new labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.LocalPosGraficoDTO(e.nome instituicao, count(eg) quantidadeEgresso) from empresa e inner join egresso_titulacao et on et.empresa = e.id inner join egresso eg on eg.id = et.id.egressoId group by e.nome")
    List<LocalPosGraficoDTO> countEgressoByPos();
}
