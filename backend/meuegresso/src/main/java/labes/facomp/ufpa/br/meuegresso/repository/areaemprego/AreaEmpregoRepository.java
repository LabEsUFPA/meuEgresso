package labes.facomp.ufpa.br.meuegresso.repository.areaemprego;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.AreaEmpregoModel;

public interface AreaEmpregoRepository extends CrudRepository<AreaEmpregoModel, Integer> {

    List<AreaEmpregoModel> findAll();

    Optional<AreaEmpregoModel> findByNomeIgnoreCase(String nome);

    boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

}
