package labes.facomp.ufpa.br.meuegresso.repository.curso;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.CursosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;

public interface CursoRepository extends CrudRepository<CursoModel, Integer> {

    List<CursoModel> findAll();

    boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

    Optional<CursoModel> findByNomeIgnoreCase(String nome);

    @Query(value = "select new labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.CursosGraficoDTO(c.nome curso, count(et) quantidade) from curso c inner join egresso_titulacao et on et.curso = c.id group by c.nome")
    List<CursosGraficoDTO> countEgressoByCurso();
}
