package labes.facomp.ufpa.br.meuegresso.service.endereco;

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

import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;
import labes.facomp.ufpa.br.meuegresso.repository.endereco.EnderecoRepository;

/**
 * classe que implementa os testes da EnderecoService
 * 
 * @author Pedro Inácio
 * @since 27/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
public class EnderecoServiceTest {
    @Autowired
    private EnderecoService service;

    @MockBean
    private EnderecoRepository repository;
    
    /**
     * metodo para criar um endereco para uso nos testes.
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     */
    @Test
    @Order(1)
    public void testSave() {

        BDDMockito.given(repository.save(Mockito.any(EnderecoModel.class)))
                .willReturn(getMockEnderecoModel());
        EnderecoModel response = service.save(new EnderecoModel());

        assertNotNull(response);
        assertEquals("Ananindeua", response.getCidade());
    }

    /**
     * metodo para atualizar uma endereco para uso no teste.
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     */
    /* 
    @Test
    @Order(2)
    public void testUpdate() {

        BDDMockito.given(repository.save(Mockito.any(EnderecoModel.class)))
                .willReturn(getMockEnderecoModel());
        EnderecoModel response = service.save(new EnderecoModel());
        response.setNome(null);
        repository.update();

        EnderecoModel responseUpdate = new EnderecoModel(1, "Homem trans");
        response = service.update(responseUpdate);

        assertNotNull(response);
        assertEquals("Homem Cis", response.getNome());
    }*/

    /**
     * metodo que preenche um mock de uma endereco para usar como return nos testes.
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     * 
     * @return <code>EnderecoModel</code> object
     */
    private EnderecoModel getMockEnderecoModel() {

        EnderecoModel enderecoModel = new EnderecoModel(1, "Ananindeua", null, null, null);
        return enderecoModel;
    }

    /**
     * Metodo para remover todos os dados do teste de endereco
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     */
    @AfterAll
    private void tearDown() {
        repository.deleteAll();
    }

}
