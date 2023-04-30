package labes.facomp.ufpa.br.meuegresso.repository.bolsa;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.ArrayList;
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
import labes.facomp.ufpa.br.meuegresso.repository.tipobolsa.TipoBolsaRepository;

@AutoConfigureMockMvc
@ActiveProfiles("test")
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
public class TipoBolsaRepositoryTest {

    @Autowired
    TipoBolsaRepository TipoBolsaRepository;

    private final static Integer ID = 1;
    private final static String NOME = "PIBIC";

    private final static Integer ID2 = 2;
    private final static String NOME2 = "PROEX";

    private final static Double RENUMERACAO = 100.0;

    @Test
    @Order(1)
    public void testSave() {

        TipoBolsaModel response = TipoBolsaRepository.save(getMockTipoBolsaModel());
        assertNotNull(response);
        assertEquals(getMockTipoBolsaModel().getNome(), response.getNome());
    }

    @Test
    @Order(2)
    public void testFindAll() {

        TipoBolsaRepository.save(getMockTipoBolsaModel());
        TipoBolsaRepository.save(getMockTipoBolsaModel2());

        List<TipoBolsaModel> testBolsas = TipoBolsaRepository.findAll();

        assertNotNull(testBolsas);
        assertEquals(getMockTipoBolsaLista(), testBolsas);
    }

    private TipoBolsaModel getMockTipoBolsaModel() {

        TipoBolsaModel tipoBolsaModel = new TipoBolsaModel(ID, NOME, RENUMERACAO);
        return tipoBolsaModel;
    }

    private TipoBolsaModel getMockTipoBolsaModel2() {

        TipoBolsaModel tipoBolsaModel = new TipoBolsaModel(ID2, NOME2, RENUMERACAO);
        return tipoBolsaModel;
    }

    private List<TipoBolsaModel> getMockTipoBolsaLista() {
        List<TipoBolsaModel> tipoBolsaLista = new ArrayList<>();

        TipoBolsaModel bolsaTeste1 = new TipoBolsaModel(ID, NOME, RENUMERACAO);
        TipoBolsaModel bolsaTeste2 = new TipoBolsaModel(ID2, NOME2, RENUMERACAO);

        tipoBolsaLista.add(bolsaTeste1);
        tipoBolsaLista.add(bolsaTeste2);

        return tipoBolsaLista;
    }
}
