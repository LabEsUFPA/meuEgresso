package labes.facomp.ufpa.br.meuegresso.repository.empresa;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;

public interface EmpresaRepository extends CrudRepository<EmpresaModel, Integer> {

    List<EmpresaModel> findAll(Sort sort);

    boolean existsByIdAndCreatedById(Integer id, Integer createdBy);

    Optional<EmpresaModel> findByNome(String nome);

    List<EmpresaModel> findByNomeContainsIgnoreCaseOrderByNomeAsc(String nome);
}
