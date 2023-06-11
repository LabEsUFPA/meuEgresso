package labes.facomp.ufpa.br.meuegresso.repository.tipobolsa;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.model.TipoBolsaModel;

@AutoConfigureMockMvc
@ActiveProfiles("test")
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
class TipoBolsaRepositoryTest {

    @Autowired
    TipoBolsaRepository tipoBolsaRepository;

    private final static String NOME = "PIBIC";
    // private final static String NOME2 = "PIBIX";

    @Test
    @Order(1)
    void testSave() {

        TipoBolsaModel response = tipoBolsaRepository.save(getMockTipoBolsaModel());
        assertNotNull(response);
    }

    @Test
    @Order(2)
    void testFindAll() {

        List<TipoBolsaModel> testBolsas = tipoBolsaRepository.findAll();

        assertNotNull(testBolsas);
    }

    private TipoBolsaModel getMockTipoBolsaModel() {

        TipoBolsaModel tipoBolsaModel = TipoBolsaModel.builder().nome(NOME).build();
        return tipoBolsaModel;
    }

}