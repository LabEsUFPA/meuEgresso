package labes.facomp.ufpa.br.meuegresso.repository.depoimento;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;

public interface DepoimentoRepository extends CrudRepository<DepoimentoModel, Integer> {
    
    List<DepoimentoModel> findAll();

}
