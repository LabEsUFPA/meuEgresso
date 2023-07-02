package labes.facomp.ufpa.br.meuegresso.repository.palestra;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.PalestraModel;

public interface PalestraRepository extends CrudRepository<PalestraModel, Integer> {

    List<PalestraModel> findAll();

    boolean existsByIdAndCreatedBy(Integer id, Integer usuarioId);

    Optional<PalestraModel> findByEgressoId(Integer idEgresso);

    Optional<PalestraModel> findByEgressoUsuarioId(Integer idUsuario);
}
