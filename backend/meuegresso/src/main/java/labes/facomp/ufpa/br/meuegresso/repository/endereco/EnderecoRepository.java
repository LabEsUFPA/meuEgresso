package labes.facomp.ufpa.br.meuegresso.repository.endereco;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;

public interface EnderecoRepository extends CrudRepository<EnderecoModel, Integer> {

    List<EnderecoModel> findAll();

    boolean existsByIdAndCreatedBy(Integer id, Integer createdBy);

    Optional<EnderecoModel> findByCidadeIgnoreCaseAndEstadoIgnoreCaseAndPaisIgnoreCase(String cidade, String estado,
            String pais);
}
