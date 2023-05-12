package labes.facomp.ufpa.br.meuegresso.service.tipobolsa;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.mockito.BDDMockito;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.TipoBolsaModel;
import labes.facomp.ufpa.br.meuegresso.repository.tipobolsa.TipoBolsaRepository;

/**
 * classe que implementa os testes da TipoBolsaService
 *
 * @author Pedro Inácio
 * @since 27/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
class TipoBolsaServiceTest {
    @Autowired
    private TipoBolsaService service;

    @MockBean
    private TipoBolsaRepository repository;

    private static final Integer ID = 1;
    private static final String NOME = "PIBIC";

    private static final Integer ID2 = 2;
    private static final String NOME2 = "PROEX";

    /**
     * metodo para criar um PesquisaCientifica para uso nos testes.
     *
     * @author Pedro Inácio
     * @since 27/04/2023
     */
    @Test
    @Order(1)
    void testSave() {

        BDDMockito.given(repository.save(Mockito.any(TipoBolsaModel.class)))
                .willReturn(getMockTipoBolsaModel());

        TipoBolsaModel response = service.save(new TipoBolsaModel());

        assertNotNull(response);
        assertEquals(NOME, response.getNome());
    }

    @Test
    @Order(2)
    void testFindAll() {
        BDDMockito.given(service.findAll())
                .willReturn(getMockTipoBolsaLista());

        List<TipoBolsaModel> response = service.findAll();
        assertNotNull(response);
    }

    @Test
    @Order(3)
    void testFindById() {
        BDDMockito.given(repository.findById(ID))
                .willReturn(Optional.of(getMockTipoBolsaModel()));

        TipoBolsaModel response = service.findById(ID);
        assertNotNull(response);
    }

    @Test
    @Order(4)
    void testUpdate() throws InvalidRequestException {
        BDDMockito.given(repository.save(Mockito.any(TipoBolsaModel.class)))
                .willReturn(getMockTipoBolsaModel());

        TipoBolsaModel tipoBolsaUpdated = service.update(getMockTipoBolsaModel());

        assertNotNull(tipoBolsaUpdated);
        assertEquals(getMockTipoBolsaModel(), tipoBolsaUpdated);
    }

    @Test
    @Order(5)
    void testDeleteById() {

        BDDMockito.given(service.deleteById(ID))
                .willReturn(true);

        Boolean response = service.deleteById(ID);
        assertTrue(response);
    }

    /**
     * metodo que preenche um mock de um tipobolsa para usar como return nos testes.
     *
     * @author Pedro Inácio
     * @since 27/04/2023
     *
     * @return <code>TipoBolsaModel</code> object
     */
    private TipoBolsaModel getMockTipoBolsaModel() {

        TipoBolsaModel tipoBolsaModel = new TipoBolsaModel(ID, NOME, null);
        return tipoBolsaModel;
    }

    private List<TipoBolsaModel> getMockTipoBolsaLista() {
        List<TipoBolsaModel> tipoBolsaLista = new ArrayList<>();

        TipoBolsaModel bolsaTeste1 = new TipoBolsaModel(ID, NOME, null);
        TipoBolsaModel bolsaTeste2 = new TipoBolsaModel(ID2, NOME2, null);

        tipoBolsaLista.add(bolsaTeste1);
        tipoBolsaLista.add(bolsaTeste2);

        return tipoBolsaLista;
    }

    /**
     * Metodo para remover todos os dados do teste de tipobolsa
     *
     * @author Pedro Inácio
     * @since 27/04/2023
     */
    @AfterAll
    public void tearDown() {
        repository.deleteAll();
    }

}
