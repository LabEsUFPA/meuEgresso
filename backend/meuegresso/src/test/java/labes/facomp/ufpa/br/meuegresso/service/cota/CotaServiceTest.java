package labes.facomp.ufpa.br.meuegresso.service.cota;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.CotaModel;
import labes.facomp.ufpa.br.meuegresso.repository.cota.CotaRepository;


/**
 * Class que implementa testes para o CotaService.
 * 
 * @author
 * @since
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
public class CotaServiceTest {

    private static final Integer ID = 1;
    private static final String NOME = "Escola Pública";

    private static final Integer ID2 = 2;
    private static final String NOME2 = "Pardo";

    @Autowired
    private CotaService cotaService;

    CotaModel testCota;

    @MockBean
    private CotaRepository repository;

    /**
     * Metodo para testar a criacao de um CotaModel com save.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(1)
    public void testSave() {

        BDDMockito.given(repository.save(Mockito.any(CotaModel.class)))
                .willReturn(getMockCota());

        CotaModel response = cotaService.save(new CotaModel());

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(NOME, response.getNome());

    }

    /**
     * Metodo para testar o metodo findAll.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(2)
    public void testFindAll() {
        BDDMockito.given(cotaService.findAll())
                .willReturn(getMockCotaLista());
        // .willReturn(List.of(getMockCota()));

        List<CotaModel> response = cotaService.findAll();
        assertNotNull(response);
    }

    /**
     * Metodo para testar o findById.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(3)
    public void testFindById() {
        BDDMockito.given(cotaService.findById(Mockito.anyInt()))
                .willReturn(getMockCota());

        CotaModel response = cotaService.findById(ID);
        assertNotNull(response);
    }

    /**
     * Metodo para testar o update.
     * 
     * @author Bruno Eiki
     * @throws InvalidRequestException
     * @since 27/04/2023
     */
    @Test
    @Order(4)
    public void testUpdate() throws InvalidRequestException {
        BDDMockito.given(cotaService.update(Mockito.any(CotaModel.class)))
                .willReturn(getMockCota());

        CotaModel response = cotaService.update(getMockCota());
        assertNotNull(response);
    }

    /**
     * Metodo para testar o deleteById.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(4)
    public void testDeleteById() {

        BDDMockito.given(cotaService.deleteById(Mockito.anyInt()))
                .willReturn(true);

        Boolean response = cotaService.deleteById(ID);
        assertTrue(response);
    }

    /**
     * Metodo para testar o existsByIdAndCreatedById.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(5)
    public void testExistsByIdAndCreatedById() {

        BDDMockito.given(cotaService.existsByIdAndCreatedById(Mockito.anyInt(), Mockito.anyInt()))
                .willReturn(true);

        Boolean response = cotaService.existsByIdAndCreatedById(ID, ID);
        assertTrue(response);
    }

    /**
     * Metodo que preenche um mock de um CotaModel para retorno dos testes
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     * 
     * @return <code>cotaTeste</code> object
     */
    private CotaModel getMockCota() {
        CotaModel cotaTest = CotaModel.builder()
                .id(ID)
                .nome(NOME)
                .build();
        return cotaTest;
    }

    private List<CotaModel> getMockCotaLista() {
        List<CotaModel> cotaLista = new ArrayList<>();
        CotaModel cotaTest = CotaModel.builder()
                .id(ID)
                .nome(NOME)
                .build();

        CotaModel cotaTest2 = CotaModel.builder()
                .id(ID2)
                .nome(NOME2)
                .build();

        cotaLista.add(cotaTest);
        cotaLista.add(cotaTest2);

        return cotaLista;
    }

    @AfterAll
    public void tearDown() {
        repository.deleteAll();
    }
}