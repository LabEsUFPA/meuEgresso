package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.EgressoValidoModel;

public interface EgressoValidoRepository extends CrudRepository<EgressoValidoModel, Integer> {

    List<EgressoValidoModel> findAll();

    List<EgressoValidoModel> findByNomeIgnoreCase(String nome);

    Optional<EgressoValidoModel> findByMatricula(String matricula);

    Optional<EgressoValidoModel> findByEmailIgnoreCase(String email);
}
