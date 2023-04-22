package labes.facomp.ufpa.br.meuegresso.repository.pesquisacientifica;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.PesquisaCientificaModel;

public interface PesquisaCientificaRepository extends CrudRepository<PesquisaCientificaModel, Integer>{
 
    List<PesquisaCientificaModel> findAll();
    
}
