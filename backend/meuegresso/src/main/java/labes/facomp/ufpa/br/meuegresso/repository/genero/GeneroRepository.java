package labes.facomp.ufpa.br.meuegresso.repository.genero;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import jakarta.persistence.Tuple;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;

/**
 * Interface utilizada para realizar a comunicação entre a aplicação é o banco
 * de dados.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
public interface GeneroRepository extends CrudRepository<GeneroModel, Integer> {

    List<GeneroModel> findAll();

    boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

    @Query(value = "SELECT g.nome, COUNT(e.id) FROM genero g LEFT JOIN egresso e ON e.genero.id = g.id GROUP BY g.nome")

    List<Tuple> countEgressoByGenero();
}