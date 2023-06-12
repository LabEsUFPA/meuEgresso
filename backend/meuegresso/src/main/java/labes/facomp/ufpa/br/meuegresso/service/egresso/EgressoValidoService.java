package labes.facomp.ufpa.br.meuegresso.service.egresso;

import java.util.List;
import java.util.Optional;

import labes.facomp.ufpa.br.meuegresso.model.EgressoValidoModel;

public interface EgressoValidoService {

    List<EgressoValidoModel> findAll();

    List<EgressoValidoModel> findByNomeIgnoreCase(String nome);

    Optional<EgressoValidoModel> findByMatricula(String matricula);

    Optional<EgressoValidoModel> findByEmail(String email);

}
