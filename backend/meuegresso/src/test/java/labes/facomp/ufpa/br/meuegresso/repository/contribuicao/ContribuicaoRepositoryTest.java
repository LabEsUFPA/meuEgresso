package labes.facomp.ufpa.br.meuegresso.repository.contribuicao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;

/**
 * Classe que testa as features do ContribuicaoRepository
 * 
 * @author Bruno Eiki
 * @since 29/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
public class ContribuicaoRepositoryTest {

    @Autowired
    ContribuicaoRepository contribuicaoRepository;

    private final static Integer ID = 1;
    private final static String DESCRICAO = "DescricaoTeste";

    ContribuicaoModel contribuicaoModel;

    /**
     * Método que testa o repositório que salva Contribuicao
     * 
     * @author Bruno Eiki
     * @since 29/04/2023
     */
    @Test
    public void testSave() {

        ContribuicaoModel response = contribuicaoRepository.save(getMockContribuicao());

        assertNotNull(response);
        assertEquals(response.getDescricao(), response.getDescricao());
    }

    /**
     * Método que testa o repositório que retorna todos os Contribuicaos
     * 
     * @author Bruno Eiki
     * @since 29/04/2023
     */
    @Test
    public void testFindAll() {

        contribuicaoRepository.save(getMockContribuicao());
        List<ContribuicaoModel> response = contribuicaoRepository.findAll();

        assertNotNull(response);
        assertEquals(response, List.of(getMockContribuicao()));
    }

    private ContribuicaoModel getMockContribuicao() {
        ContribuicaoModel contribuicaoTest = ContribuicaoModel.builder()
                .id(ID)
                .descricao(DESCRICAO)
                .build();
        return contribuicaoTest;
    }

    /**
     * Metodo para remover todos os dados do repository.
     * 
     * @author Bruno Eiki
     * @since 29/04/2023
     */
    @AfterAll
    void tearDown() {
        contribuicaoRepository.deleteAll();
    }
}
