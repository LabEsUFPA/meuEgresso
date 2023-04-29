package labes.facomp.ufpa.br.meuegresso.service.genero;

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

import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;

/**
 * classe que implementa os testes da GeneroService
 * 
 * @author Pedro Inácio
 * @since 27/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
public class GeneroServiceTest {
    @Autowired
    private GeneroService service;

    @MockBean
    private GeneroRepository repository;
    
    /**
     * metodo para criar um genero para uso nos testes.
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     */
    @Test
    @Order(1)
    public void testSave() {

        BDDMockito.given(repository.save(Mockito.any(GeneroModel.class)))
                .willReturn(getMockGeneroModel());
        GeneroModel response = service.save(new GeneroModel());

        assertNotNull(response);
        assertEquals("Homem Cis", response.getNome());
    }

    /**
     * metodo para atualizar um genero para uso no teste.
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     */
    /* 
    @Test
    @Order(2)
    public void testUpdate() {

        BDDMockito.given(repository.save(Mockito.any(GeneroModel.class)))
                .willReturn(getMockGeneroModel());
        GeneroModel response = service.save(new GeneroModel());
        response.setNome(null);
        repository.update();

        GeneroModel responseUpdate = new GeneroModel(1, "Homem trans");
        response = service.update(responseUpdate);

        assertNotNull(response);
        assertEquals("Homem Cis", response.getNome());
    }*/

    /**
     * metodo que preenche um mock de um genero para usar como return nos testes.
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     * 
     * @return <code>GeneroModel</code> object
     */
    private GeneroModel getMockGeneroModel() {

        GeneroModel generoModel = new GeneroModel(1, "Homem Cis");
        return generoModel;
    }

    /**
     * Metodo para remover todos os dados do teste de genero
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     */
    @AfterAll
    public void tearDown() {
        repository.deleteAll();
    }

}