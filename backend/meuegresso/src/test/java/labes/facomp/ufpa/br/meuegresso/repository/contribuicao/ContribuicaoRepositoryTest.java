package labes.facomp.ufpa.br.meuegresso.repository.contribuicao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.mockito.BDDMockito;
import org.mockito.Mockito;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;

/**
 * Classe que testa as features do ContribuicaoRepository
 *
 * @author Bruno Eiki
 * @since 29/04/2023
 */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
public class ContribuicaoRepositoryTest {

    @MockBean
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
    @Order(1)
    public void testSave() {
        BDDMockito.given(contribuicaoRepository.save(Mockito.any(ContribuicaoModel.class)))
                .willReturn(getMockContribuicao());

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
    @Order(2)
    public void testFindAll() {

        BDDMockito.given(contribuicaoRepository.findAll())
                .willReturn(List.of(getMockContribuicao()));
        List<ContribuicaoModel> response = contribuicaoRepository.findAll();

        assertNotNull(response);
        assertEquals(response, List.of(getMockContribuicao()));
    }

    private ContribuicaoModel getMockContribuicao() {
        ContribuicaoModel contribuicaoTest = ContribuicaoModel.builder()
                .id(ID)
                .egresso(EgressoModel.builder().id(ID).build())
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
