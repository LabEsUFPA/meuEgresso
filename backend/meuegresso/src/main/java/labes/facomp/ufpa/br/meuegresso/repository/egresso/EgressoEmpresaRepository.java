package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;

public interface EgressoEmpresaRepository extends CrudRepository<EgressoEmpresaModel, EgressoEmpresaModelId> {

    List<EgressoEmpresaModel> findAll();
    
}
