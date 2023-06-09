package labes.facomp.ufpa.br.meuegresso.repository.empresa;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.LocalPosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;

public interface EmpresaRepository extends CrudRepository<EmpresaModel, Integer> {

    Page<EmpresaModel> findAll(Pageable page);

    boolean existsByIdAndCreatedById(Integer id, Integer createdBy);

    Optional<EmpresaModel> findByNome(String nome);

    Page<EmpresaModel> findByNomeContainsIgnoreCaseOrderByNomeAsc(Pageable page, String nome);

    @Query(value = "select new labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.LocalPosGraficoDTO(e.nome instituicao, count(eg) quantidadeEgresso) from empresa e inner join egresso_titulacao et on et.empresa = e.id inner join egresso eg on eg.id = et.id.egressoId group by e.nome")
    List<LocalPosGraficoDTO> countEgressoByPos();
}
