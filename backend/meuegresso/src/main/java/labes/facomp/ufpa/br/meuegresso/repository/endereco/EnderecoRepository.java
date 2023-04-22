package labes.facomp.ufpa.br.meuegresso.repository.endereco;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;

public interface EnderecoRepository extends CrudRepository<EnderecoModel, Integer> {

    List<EnderecoModel> findAll();

    boolean existsByIdAndCreatedById(Integer id, Integer createdBy);
}
