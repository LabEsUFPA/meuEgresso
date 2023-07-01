package labes.facomp.ufpa.br.meuegresso.repository.cota;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import jakarta.persistence.Tuple;
import labes.facomp.ufpa.br.meuegresso.model.CotaModel;

/**
 * Interface utilizada para realizar a comunicação entre a aplicação é o banco
 * de dados.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
public interface CotaRepository extends CrudRepository<CotaModel, Integer> {
    public List<CotaModel> findAll();

    boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

    @Query(value = "SELECT c.nome, COUNT(ec) FROM cota c LEFT JOIN egresso_cota ec ON ec.id.cotaId = c.id GROUP BY c.nome")

    List<Tuple> countEgressoByCota();
}