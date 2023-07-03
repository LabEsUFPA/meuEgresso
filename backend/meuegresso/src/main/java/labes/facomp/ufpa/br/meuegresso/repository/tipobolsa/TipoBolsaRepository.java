package labes.facomp.ufpa.br.meuegresso.repository.tipobolsa;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import jakarta.persistence.Tuple;
import labes.facomp.ufpa.br.meuegresso.model.TipoBolsaModel;

/**
 * Interface utilizada para realizar a comunicação entre a aplicação é o banco
 * de dados.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
public interface TipoBolsaRepository extends CrudRepository<TipoBolsaModel, Integer> {

    List<TipoBolsaModel> findAll();

    boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

    @Query(value = """
                SELECT tb.nome, COUNT(e) AS total_egressos
                    FROM tipo_bolsa tb
                    LEFT JOIN egresso e ON e.bolsa.id = tb.id
                    GROUP BY tb.nome
            """)
    List<Tuple> countEgressoForBolsa();
}