package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;

public interface EgressoRepository extends CrudRepository<EgressoModel, Integer> {

    List<EgressoModel> findAll();

    Optional<EgressoModel> findByUsuarioId(Integer idUsuario);
    
}
