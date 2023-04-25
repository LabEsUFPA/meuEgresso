package labes.facomp.ufpa.br.meuegresso.repository.genero;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

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

    boolean existsByIdAndCreatedById(Integer id, Integer createdBy);
}