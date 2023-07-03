package labes.facomp.ufpa.br.meuegresso.repository.contribuicao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;

public interface ContribuicaoRepository extends CrudRepository<ContribuicaoModel, Integer> {

    List<ContribuicaoModel> findAll();

    boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

    Optional<ContribuicaoModel> findByEgressoId(Integer idEgresso);

    Optional<ContribuicaoModel> findByEgressoUsuarioId(Integer idUsuario);

}
