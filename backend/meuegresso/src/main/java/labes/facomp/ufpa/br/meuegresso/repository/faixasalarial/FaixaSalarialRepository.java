package labes.facomp.ufpa.br.meuegresso.repository.faixasalarial;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import jakarta.persistence.Tuple;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;

/**
 * Interface utilizada para realizar a comunicação entre a aplicação é o banco
 * de dados.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
public interface FaixaSalarialRepository extends CrudRepository<FaixaSalarialModel, Integer> {

    List<FaixaSalarialModel> findAll();

    boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

    @Query(value = """
            SELECT fs.faixa, COUNT(ee.faixaSalarial.id ) AS total_egressos
            FROM faixa_salarial
            fs LEFT
            JOIN egresso_empresa
            ee ON ee.faixaSalarial.id = fs.id GROUP BY fs.faixa
            """)
    List<Tuple> countEgressoInFaixa();
}