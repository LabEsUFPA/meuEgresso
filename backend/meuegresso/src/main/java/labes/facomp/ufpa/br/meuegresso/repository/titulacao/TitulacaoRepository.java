package labes.facomp.ufpa.br.meuegresso.repository.titulacao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;

/**
 * Interface utilizada para realizar a comunicação entre a aplicação é o banco
 * de dados.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
public interface TitulacaoRepository extends CrudRepository<TitulacaoModel, Integer> {
 
    List<TitulacaoModel> findAll();
}
