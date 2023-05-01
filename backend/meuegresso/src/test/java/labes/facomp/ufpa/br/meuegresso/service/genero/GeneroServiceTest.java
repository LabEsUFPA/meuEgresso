package labes.facomp.ufpa.br.meuegresso.service.genero;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

import java.util.ArrayList;
import java.util.List;
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
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;

/**
 * Classe que implementa os testes da GeneroService
 * 
 * @author Pedro Inácio
 * @since 27/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
class GeneroServiceTest {

    private static final Integer ID = 1;
    private static final Integer ID2 = 2;
    
    private static final String NOME = "Masculino";
    private static final String NOME2 = "Feminino";


    @Autowired
    private GeneroService service;

    @MockBean
    private GeneroRepository generoRepository;
        
    /**
     * Método para criar um genero para uso nos testes.
     * 
     * @author Pedro Inácio
     * @since 27/04/2023     
    */    
    @Test    
    void testSave() {

        BDDMockito.given(service.save(Mockito.any(GeneroModel.class)))
                .willReturn(getMockGeneroModel());
        GeneroModel response = service.save(new GeneroModel());

        assertNotNull(response);
        assertEquals("Homem Cis", response.getNome());
    }

    /**
     * Teste da função deleteById() do atributo de "gênero", que deleta
     * um gênero cadastrado a partir de seu ID
     * 
     * @author Eude Monteiro
     * @since 29/04/2023     
    */ 
    @Test    
    void testDeleteById(){
        BDDMockito.given(service.deleteById(Mockito.anyInt()))
                .willReturn(true);

        Boolean response = service.deleteById(ID);
        assertTrue(response);        
    }

    /**
     * Teste da função findAll() do atributo de gênero, 
     * que encontra todos os gêneros cadastrados.
     * 
     * @author Eude Monteiro
     * @since 29/04/2023     
    */ 
    @Test
    void testFindAll(){
        
        List<GeneroModel> generoLista = new ArrayList<>();
        GeneroModel generoTest = GeneroModel.builder()
                .id(ID)
                .nome(NOME).build();                

        GeneroModel generoTest2 = GeneroModel.builder()
                .id(ID2)
                .nome(NOME2).build();  

        generoLista.add(generoTest);
        generoLista.add(generoTest2);

        given(generoRepository.findAll()).willReturn(generoLista);

        List<GeneroModel> response = service.findAll();

        assertEquals(2, response.size());
        assertEquals(generoTest, response.get(0));
        assertEquals(generoTest2, response.get(1));
    }
   
    /**
     * Teste da função findById() do atributo de "gênero", 
     * que encontra um gênero pelo seu ID
     * 
     * @author Eude Monteiro
     * @since 29/04/2023     
     */
    @Test
    void testFindById() {
        
        GeneroModel generoTest = GeneroModel.builder()
                .id(ID)
                .nome(NOME).build();

        given(generoRepository.findById(ID)).willReturn(Optional.of(generoTest));

        GeneroModel response = service.findById(ID);

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(NOME, response.getNome());
    }


    /**
     * Teste da função de update do atributo de "gênero",
     * que atualiza dados de um genero cadastrado.
     * 
     * @author Pedro Inácio, Eude Monteiro
     * @since 27/04/2023
     * @throws InvalidRequestException
     */
    @Test
    void testUpdate() throws InvalidRequestException {        
        GeneroModel generoTest = GeneroModel.builder()
            .id(ID)
            .nome(NOME).build();

        given(generoRepository.save(generoTest)).willReturn(generoTest);
        
        GeneroModel updatedGenero = service.update(generoTest);

        assertEquals(generoTest, updatedGenero);
        verify(generoRepository, times(1)).save(generoTest);
    }
    
    
    /**
     * Método que preenche um mock de um GeneroModel para retorno dos testes
     * 
     * @author Eude Monteiro
     * @since 29/04/2023
     * @return Um modelo de gênero 
     */
    private GeneroModel getMockGeneroModel() {

        GeneroModel generoModel = new GeneroModel(1, "Homem Cis");
        return generoModel;
    }
   
    /**
     * Método para remover todos os dados do teste de genero
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     */
    @AfterAll
    public void tearDown() {
        generoRepository.deleteAll();
    }
}