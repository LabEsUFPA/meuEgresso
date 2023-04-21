package labes.facomp.ufpa.br.meuegresso.repository.etnia;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.EtniaModel;

/**
 * Interface utilizada para realizar a comunicação entre a aplicação é o banco
 * de dados.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
public interface EtniaRepository extends CrudRepository<EtniaModel, Integer> {
    
}