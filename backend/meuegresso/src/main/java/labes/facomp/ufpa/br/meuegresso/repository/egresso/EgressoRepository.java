package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;

public interface EgressoRepository extends CrudRepository<EgressoModel, Integer> {

    Optional<EgressoModel> findByUsuarioId(Integer idUsuario);
    
}
