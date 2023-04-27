package labes.facomp.ufpa.br.meuegresso.service.faixasalarial;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

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
public class FaixaSalarialServiceTest {
    @Autowired
    private FaixaSalarialService service;

    @MockBean
    private FaixaSalarialRepository repository;
    
    /**
     * metodo para criar um faixasalarial para uso nos testes.
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     */
    @Test
    @Order(1)
    public void testSave() {

        BDDMockito.given(repository.save(Mockito.any(FaixaSalarialModel.class)))
                .willReturn(getMockFaixaSalarialModel());
        FaixaSalarialModel response = service.save(new FaixaSalarialModel());

        assertNotNull(response);
        assertEquals("15000-20000", response.getFaixa());
    }

    /**
     * metodo para atualizar um faixasalarial para uso no teste.
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     */
    /* 
    @Test
    @Order(2)
    public void testUpdate() {

        BDDMockito.given(repository.save(Mockito.any(FaixaSalarialModel.class)))
                .willReturn(getMockFaixaSalarialModel());
        FaixaSalarialModel response = service.save(new FaixaSalarialModel());
        response.setNome(null);
        repository.update();

        FaixaSalarialModel responseUpdate = new FaixaSalarialModel(1, "Homem trans");
        response = service.update(responseUpdate);

        assertNotNull(response);
        assertEquals("Homem Cis", response.getNome());
    }*/

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

        FaixaSalarialModel faixaSalarialModel = new FaixaSalarialModel(1, "15000-20000");
        return faixaSalarialModel;
    }

    /**
     * Metodo para remover todos os dados do teste de faixasalarial
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     */
    @AfterAll
    private void tearDown() {
        repository.deleteAll();
    }

}
