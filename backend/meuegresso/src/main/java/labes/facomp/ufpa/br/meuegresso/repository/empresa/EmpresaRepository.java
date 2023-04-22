package labes.facomp.ufpa.br.meuegresso.repository.empresa;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;

public interface EmpresaRepository extends CrudRepository<EmpresaModel, Integer> {
    
    List<EmpresaModel> findAll();
}
