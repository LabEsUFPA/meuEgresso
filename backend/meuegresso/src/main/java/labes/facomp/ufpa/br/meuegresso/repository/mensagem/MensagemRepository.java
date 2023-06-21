package labes.facomp.ufpa.br.meuegresso.repository.mensagem;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

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

    @Query(value = """
            SELECT *
            FROM mensagem m
            WHERE m.frequente_mensagem = false 
                AND YEAR(data_mensagem) = YEAR(NOW())
                AND MONTH(data_mensagem) = MONTH(NOW())
                AND DAY(data_mensagem) = DAY(NOW())
                AND HOUR(data_mensagem) = HOUR(NOW())
                AND TIMESTAMPDIFF(MINUTE, data_mensagem, NOW()) < 5
            """)
    List<MensagemModel> findMensagemByData();

    @Query(value = """
            SELECT *
            FROM mensagem m
            WHERE m.email_mensagem is null
                AND m.data_enviada_mensagem is not null
                AND m.anual_mensagem = true
                AND MONTH(data_mensagem) = MONTH(NOW())
                AND DAY(data_mensagem) = DAY(NOW())
                AND HOUR(data_mensagem) = HOUR(NOW())
                AND TIMESTAMPDIFF(MINUTE, data_mensagem, NOW()) < 5
            """)
    List<MensagemModel> findMensagemByDataAnual();

    @Query(value = """
            SELECT *
            FROM mensagem m
            WHERE m.email_mensagem is null
                AND m.data_enviada_mensagem is not null
                AND m.frequente_mensagem = true
                AND m.anual_mensagem = false
                AND TIMESTAMPDIFF(MONTH, data_mensagem, NOW()) % 6 = 0
                AND DAY(data_mensagem) = DAY(NOW())
                AND HOUR(data_mensagem) = HOUR(NOW())
                AND TIMESTAMPDIFF(MINUTE, data_mensagem, NOW()) < 5
            """)
    List<MensagemModel> findMensagemByDataSemestral();
}
