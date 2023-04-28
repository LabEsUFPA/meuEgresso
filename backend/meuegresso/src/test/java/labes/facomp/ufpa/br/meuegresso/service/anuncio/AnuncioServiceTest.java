package labes.facomp.ufpa.br.meuegresso.service.anuncio;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.List;

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
import org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;

/**
 * Class que implementa testes para o AnuncioService.
 * 
 * @author
 * @since
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
public class AnuncioServiceTest {

    private static final Integer ID = 1;
    private static final String DESCRICAO = "Escola Pública";

    private static final Integer ID2 = 2;
    private static final String DESCRICAO2 = "Pardo";

    @Autowired
    private AnuncioService anuncioService;

    AnuncioModel testAnuncio;

    /**
     * Metodo para testar a criacao de um AnuncioModel com save.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(1)
    public void testSave() {

        BDDMockito.given(anuncioService.save(Mockito.any(AnuncioModel.class)))
                .willReturn(getMockAnuncio());

        AnuncioModel response = anuncioService.save(new AnuncioModel());

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(DESCRICAO, response.getDescricao());

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
        BDDMockito.given(anuncioService.findAll())
                .willReturn(getMockAnuncioLista());
        // .willReturn(List.of(getMockAnuncio()));

        List<AnuncioModel> response = anuncioService.findAll();
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
        BDDMockito.given(anuncioService.findById(Mockito.anyInt()))
                .willReturn(getMockAnuncio());

        AnuncioModel response = anuncioService.findById(ID);
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
        BDDMockito.given(anuncioService.update(Mockito.any(AnuncioModel.class)))
                .willReturn(getMockAnuncio());

        AnuncioModel response = anuncioService.update(getMockAnuncio());
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

        BDDMockito.given(anuncioService.deleteById(Mockito.anyInt()))
                .willReturn(true);

        Boolean response = anuncioService.deleteById(ID);
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

        BDDMockito.given(anuncioService.existsByIdAndCreatedById(Mockito.anyInt(), Mockito.anyInt()))
                .willReturn(true);

        Boolean response = anuncioService.existsByIdAndCreatedById(ID, ID);
        assertTrue(response);
    }

    /**
     * Metodo que preenche um mock de um AnuncioModel para retorno dos testes
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     * 
     * @return <code>anuncioTeste</code> object
     */
    private AnuncioModel getMockAnuncio() {
        AnuncioModel anuncioTest = AnuncioModel.builder()
                .id(ID)
                .descricao(DESCRICAO)
                .build();
        return anuncioTest;
    }

    private List<AnuncioModel> getMockAnuncioLista() {
        List<AnuncioModel> anuncioLista = new ArrayList<>();
        AnuncioModel anuncioTest = AnuncioModel.builder()
                .id(ID)
                .descricao(DESCRICAO)
                .build();

        AnuncioModel anuncioTest2 = AnuncioModel.builder()
                .id(ID2)
                .descricao(DESCRICAO2)
                .build();

        anuncioLista.add(anuncioTest);
        anuncioLista.add(anuncioTest2);

        return anuncioLista;
    }

    // @AfterAll
    // private void tearDown() {
    // //
    // }
}
