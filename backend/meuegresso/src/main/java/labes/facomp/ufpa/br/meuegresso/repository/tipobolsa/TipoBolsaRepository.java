package labes.facomp.ufpa.br.meuegresso.repository.tipobolsa;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

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
    
    boolean existsByIdAndCreatedById(Integer id, Integer createdBy);
}