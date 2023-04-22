package labes.facomp.ufpa.br.meuegresso.repository.trabalhopublicacao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.TrabalhoPublicadoModel;

public interface TrabalhoPublicadoRepository extends CrudRepository<TrabalhoPublicadoModel, Integer> {

    List<TrabalhoPublicadoModel> findAll();

}
