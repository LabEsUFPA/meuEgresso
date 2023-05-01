package labes.facomp.ufpa.br.meuegresso.repository.palestra;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.PalestraModel;

public interface PalestraRepository extends CrudRepository<PalestraModel, Integer> {

    List<PalestraModel> findAll();

    boolean existsByIdAndEgressoId(Integer id, Integer egressoId);
}
