package labes.facomp.ufpa.br.meuegresso.repository.depoimento;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.mockito.BDDMockito;
import org.mockito.Mockito;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;

/**
 * Classe que testa as features do DepoimentoRepository
 *
 * @author Bruno Eiki
 * @since 24/03/2023
 */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
class DepoimentoRepositoryTest {

    @MockBean
    DepoimentoRepository depoimentoRepository;

    private final static Integer ID = 1;
    private final static String DESCRICAO = "DescricaoTeste";

    DepoimentoModel depoimentoModel;

    /**
     * Método que testa o repositório que salva Depoimento
     *
     * @author Bruno Eiki
     * @since 29/04/2023
     */
    @Test
    void testSave() {
        BDDMockito.given(depoimentoRepository.save(Mockito.any(DepoimentoModel.class)))
                .willReturn(getMockDepoimento());

        DepoimentoModel response = depoimentoRepository.save(getMockDepoimento());

        assertNotNull(response);
        assertEquals(DESCRICAO, response.getDescricao());
    }

    /**
     * Método que testa o repositório que retorna todos os Depoimentos
     *
     * @author Bruno Eiki
     * @since 29/04/2023
     */
    @Test
    void testFindAll() {

        BDDMockito.given(depoimentoRepository.findAll())
                .willReturn(List.of(getMockDepoimento()));

        List<DepoimentoModel> response = depoimentoRepository.findAll();

        assertNotNull(response);
        assertEquals(response, List.of(getMockDepoimento()));
    }

    private DepoimentoModel getMockDepoimento() {
        DepoimentoModel depoimentoTest = DepoimentoModel.builder()
                .id(ID)
                .descricao(DESCRICAO)
                .build();
        return depoimentoTest;
    }

    /**
     * Metodo para remover todos os dados do repository.
     *
     * @author Bruno Eiki
     * @since 29/04/2023
     */
    @AfterAll
    public void tearDown() {
        depoimentoRepository.deleteAll();
    }
}
