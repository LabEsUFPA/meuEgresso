package labes.facomp.ufpa.br.meuegresso.repository.mensagem;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.MensagemModel;

/**
 * Interface utilizada para realizar a comunicação entre a aplicação é o banco
 * de dados.
 * Nota: O Spring Boot irá cuidar da implementação da mesma.
 *
 * @author Camilo Santos
 * @since 15/06/2023
 * @version 1.0
 */
public interface MensagemRepository extends CrudRepository<MensagemModel, Integer> {
    List<MensagemModel> findAll();

    Optional<MensagemModel> findById(Integer id);

    void deleteById(Integer id);
}
