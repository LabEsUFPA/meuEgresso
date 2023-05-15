package labes.facomp.ufpa.br.meuegresso.service.faixasalarial;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Optional;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
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
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;
import labes.facomp.ufpa.br.meuegresso.repository.faixasalarial.FaixaSalarialRepository;

/**
 * classe que implementa os testes da FaixaSalarialService
 * 
 * @author Pedro Inácio
 * @since 27/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
class FaixaSalarialServiceTest {

    private static final Integer ID = 1;
    private static final String FAIXA = "15000-20000";

    @Autowired
    private FaixaSalarialService faixaSalarialService;

    @MockBean
    private FaixaSalarialRepository repository;

    /**
     * metodo para criar um faixasalarial para uso nos testes.
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     */
    @Test
    void testSave() {

        BDDMockito.given(repository.save(Mockito.any(FaixaSalarialModel.class)))
                .willReturn(getMockFaixaSalarialModel());
        FaixaSalarialModel response = faixaSalarialService.save(new FaixaSalarialModel());

        assertNotNull(response);
        assertEquals("15000-20000", response.getFaixa());
    }

    /**
     * Metodo para testar o findById.
     * 
     * @author Lucas Cantao
     * @since 29/04/2023
     */
    @Test
    void testFindById() {

        BDDMockito.given(repository.findById(ID)).willReturn(Optional.of(getMockFaixaSalarialModel()));

        FaixaSalarialModel response = faixaSalarialService.findById(ID);
        assertEquals(getMockFaixaSalarialModel(), response);
    }

    /**
     * metodo para atualizar um faixasalarial para uso no teste.
     * 
     * @author Lucas Cantao
     * @since 29/04/2023
     */

    @Test
    void testUpdate() throws InvalidRequestException {

        FaixaSalarialModel testeFaixaSalariaL = getMockFaixaSalarialModel();
        String FAIXA_ATUALIZADO = "R$100 - R$378,01";

        BDDMockito.given(repository.save(Mockito.any(FaixaSalarialModel.class)))
                .willReturn(testeFaixaSalariaL);

        testeFaixaSalariaL.setFaixa(FAIXA_ATUALIZADO);

        FaixaSalarialModel response = faixaSalarialService.update(testeFaixaSalariaL);

        assertNotNull(response);
        assertEquals(FAIXA_ATUALIZADO, response.getFaixa());
    }

    /**
     * Metodo para testar o deleteById.
     * 
     * @author Lucas Cantao
     * @since 29/04/2023
     */
    @Test
    void testDeleteById() {

        Mockito.when(repository.findById(Mockito.anyInt()))
                .thenReturn(Optional.of(getMockFaixaSalarialModel()));
        Mockito.when(repository.existsById(Mockito.anyInt()))
                .thenReturn(true);

        Boolean response = faixaSalarialService.deleteById(ID);
        assertTrue(response);
    }

    /**
     * Metodo para testar o existsByIdAndCreatedById.
     * 
     * @author Lucas Cantao
     * @since 29/04/2023
     */

    // @Test
    // void testExistsByIdAndCreatedById() {

    // BDDMockito.given(faixaSalarialService.existsByIdAndCreatedById(Mockito.anyInt(),
    // Mockito.anyInt()))
    // .willReturn(true);

    // Boolean response = faixaSalarialService.existsByIdAndCreatedById(ID, ID);
    // assertTrue(response);
    // }

    /**
     * metodo que preenche um mock de um faixasalarial para usar como return nos
     * testes.
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     * 
     * @return <code>FaixaSalarialModel</code> object
     */
    private FaixaSalarialModel getMockFaixaSalarialModel() {

        FaixaSalarialModel faixaSalarialModel = new FaixaSalarialModel(ID, FAIXA);
        return faixaSalarialModel;
    }

    /**
     * Metodo para remover todos os dados do teste de faixasalarial
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     */
    @AfterAll
    public void tearDown() {
        repository.deleteAll();
    }

}
