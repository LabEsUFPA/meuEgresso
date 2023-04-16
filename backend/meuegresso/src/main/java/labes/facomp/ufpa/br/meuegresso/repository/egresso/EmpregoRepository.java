package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;

public interface EmpregoRepository extends CrudRepository<EgressoEmpresaModel, EgressoEmpresaModelId>{
    
}
