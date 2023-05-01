package labes.facomp.ufpa.br.meuegresso.repository.cota;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.model.CotaModel;

/**
 * Class that implements tests of the UserAccountRepository functionalities
 *
 * @author Mariana Azevedo
 * @since 06/12/2020
 */
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
class CotaRepositoryTest {

    @Autowired
    CotaRepository cotaRepository;

    CotaModel testCota;

    private final static Integer ID = 1;
    private final static String NOME = "RENDA";

    private final static Integer ID2 = 2;
    private final static String NOME2 = "ESCOLA PUBLICA";

    @Test
    @Order(1)
    void testSave() {

        CotaModel response = cotaRepository.save(getMockCota());
        assertNotNull(response);
        assertEquals(response.getNome(), response.getNome());
    }

    @Test
    @Order(2)
    void testFindAll() {

        cotaRepository.save(getMockCota());
        cotaRepository.save(getMockCota2());

        List<CotaModel> listaCota = cotaRepository.findAll();

        assertNotNull(listaCota);
        assertEquals(getMockCota().getNome(), listaCota.get(0).getNome());
        assertEquals(getMockCota2().getNome(), listaCota.get(1).getNome());
    }

    private CotaModel getMockCota() {

        CotaModel cotaTest = new CotaModel(ID, NOME, null);
        return cotaTest;
    }

    private CotaModel getMockCota2() {

        CotaModel cotaTest2 = new CotaModel(ID2, NOME2, null);
        return cotaTest2;
    }
}
