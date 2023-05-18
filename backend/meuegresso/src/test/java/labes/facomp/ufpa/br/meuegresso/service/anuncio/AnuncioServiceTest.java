package labes.facomp.ufpa.br.meuegresso.service.anuncio;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
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
import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;
import labes.facomp.ufpa.br.meuegresso.repository.anuncio.AnuncioRepository;

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
class AnuncioServiceTest {

    private static final Integer ID = 1;
    private static final String DESCRICAO = "Vagas de Emprego";

    private static final Integer ID2 = 2;
    private static final String DESCRICAO2 = "Vagas para Pós-Graduacao";

    @Autowired
    private AnuncioService anuncioService;

    AnuncioModel testAnuncio;

    @MockBean
    private AnuncioRepository anuncioRepository;

    @BeforeAll
    void setUp() {
        BDDMockito.given(anuncioRepository.save(Mockito.any(AnuncioModel.class)))
                .willReturn(getMockAnuncio());

        BDDMockito.given(anuncioRepository.findById(Mockito.anyInt()))
                .willReturn(Optional.of(getMockAnuncio()));

    }

    /**
     * Metodo para testar a criacao de um AnuncioModel com save.
     *
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(1)
    void testSave() {

        BDDMockito.given(anuncioRepository.save(Mockito.any(AnuncioModel.class)))
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
    void testFindAll() {
        BDDMockito.given(anuncioRepository.findAll())
                .willReturn(getMockAnuncioLista());

        List<AnuncioModel> response = anuncioService.findAll();

        assertNotNull(response);
        assertEquals(2, response.size());
        assertEquals(DESCRICAO, response.get(0).getDescricao());
        assertEquals(DESCRICAO2, response.get(1).getDescricao());

    }

    /**
     * Metodo para testar o findById.
     *
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(3)
    void testFindById() {

        AnuncioModel response = anuncioService.findById(ID);
        assertEquals(ID, response.getId());
        assertEquals(DESCRICAO, response.getDescricao());
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
    void testUpdate() throws InvalidRequestException {

        var anuncioUpdate = getMockAnuncio();
        anuncioUpdate.setDescricao("Teste");

        BDDMockito.given(anuncioRepository.save(Mockito.any(AnuncioModel.class)))
                .willReturn(anuncioUpdate);

        AnuncioModel response = anuncioService.update(anuncioUpdate);
        assertEquals(ID, response.getId());
        assertEquals("Teste", response.getDescricao());
    }

    /**
     * Metodo para testar o deleteById.
     *
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(5)
    void testDeleteById() {

        Mockito.when(anuncioRepository.findById(Mockito.anyInt()))
                .thenReturn(Optional.of(getMockAnuncio()));
        Mockito.when(anuncioRepository.existsById(Mockito.anyInt()))
                .thenReturn(true);
        Boolean response = anuncioService.deleteById(ID);

        Mockito.verify(anuncioRepository).deleteById(ID);
        assertTrue(response);
    }

    /**
     * Metodo para testar o existsByIdAndCreatedById.
     *
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(6)
    void testExistsByIdAndCreatedById() {

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

    @AfterAll
    void tearDown() {
        anuncioRepository.deleteAll();
    }
}
