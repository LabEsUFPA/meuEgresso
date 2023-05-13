package labes.facomp.ufpa.br.meuegresso.repository.cota;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

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

    boolean existsByIdAndCreatedById(Integer id, Integer createdBy);
}