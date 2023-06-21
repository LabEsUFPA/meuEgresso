package labes.facomp.ufpa.br.meuegresso.repository.mensagem;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
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

        @Query(value = """
                                           select * from mensagem m where m.frequente_mensagem = false
                        and (m.data_mensagem ::date = CURRENT_DATE
                        and (m.data_enviada_mensagem::date != CURRENT_DATE or m.data_enviada_mensagem::date is null)
                        or m.data_mensagem  < CURRENT_DATE and m.data_enviada_mensagem is null)
                                           """, nativeQuery = true)
        List<MensagemModel> findEmailsParaEnviar();

        @Query(value = """
                        SELECT * FROM mensagem m
                        WHERE m.frequente_mensagem = true
                          AND m.anual_mensagem = false
                          and current_date >= m.data_mensagem::::date
                          AND EXTRACT(MONTH FROM AGE(now(), m.data_mensagem)) % 12 = 0
                          AND (EXTRACT(MONTH FROM AGE(now(), m.data_enviada_mensagem)) >= 6 OR m.data_enviada_mensagem IS NULL)
                        """, nativeQuery = true)
        List<MensagemModel> findMensagemByDataAnual();

        @Query(value = """
                        SELECT * FROM mensagem m
                        WHERE m.frequente_mensagem = true
                          AND m.anual_mensagem = false
                          and current_date >= m.data_mensagem::::date
                          AND EXTRACT(MONTH FROM AGE(now(), m.data_mensagem)) % 6 = 0
                          AND (EXTRACT(MONTH FROM AGE(now(), m.data_enviada_mensagem)) >= 6 OR m.data_enviada_mensagem IS NULL)
                        """, nativeQuery = true)
        List<MensagemModel> findMensagemByDataSemestral();
}
