package labes.facomp.ufpa.br.meuegresso.service.depoimento;

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
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;

/**
 * Class que implementa testes para o DepoimentoService.
 * 
 * @author
 * @since
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
public class DepoimentoServiceTest {

    private static final Integer ID = 1;
    private static final String DESCRICAO = "Foi bom";

    private static final Integer ID2 = 2;
    private static final String DESCRICAO2 = "Me formei";

    @Autowired
    private DepoimentoService depoimentoService;

    DepoimentoModel testDepoimento;

    /**
     * Metodo para testar a criacao de um DepoimentoModel com save.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(1)
    public void testSave() {

        BDDMockito.given(depoimentoService.save(Mockito.any(DepoimentoModel.class)))
                .willReturn(getMockDepoimento());

        DepoimentoModel response = depoimentoService.save(new DepoimentoModel());

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
        BDDMockito.given(depoimentoService.findAll())
                .willReturn(getMockDepoimentoLista());
        // .willReturn(List.of(getMockDepoimento()));

        List<DepoimentoModel> response = depoimentoService.findAll();
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
        BDDMockito.given(depoimentoService.findById(Mockito.anyInt()))
                .willReturn(getMockDepoimento());

        DepoimentoModel response = depoimentoService.findById(ID);
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
        BDDMockito.given(depoimentoService.update(Mockito.any(DepoimentoModel.class)))
                .willReturn(getMockDepoimento());

        DepoimentoModel response = depoimentoService.update(getMockDepoimento());
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

        BDDMockito.given(depoimentoService.deleteById(Mockito.anyInt()))
                .willReturn(true);

        Boolean response = depoimentoService.deleteById(ID);
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

        BDDMockito.given(depoimentoService.existsByIdAndCreatedById(Mockito.anyInt(), Mockito.anyInt()))
                .willReturn(true);

        Boolean response = depoimentoService.existsByIdAndCreatedById(ID, ID);
        assertTrue(response);
    }

    /**
     * Metodo que preenche um mock de um DepoimentoModel para retorno dos testes
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     * 
     * @return <code>depoimentoTeste</code> object
     */
    private DepoimentoModel getMockDepoimento() {
        DepoimentoModel depoimentoTest = DepoimentoModel.builder()
                .id(ID)
                .descricao(DESCRICAO)
                .build();
        return depoimentoTest;
    }

    private List<DepoimentoModel> getMockDepoimentoLista() {
        List<DepoimentoModel> depoimentoLista = new ArrayList<>();
        DepoimentoModel depoimentoTest = DepoimentoModel.builder()
                .id(ID)
                .descricao(DESCRICAO)
                .build();

        DepoimentoModel depoimentoTest2 = DepoimentoModel.builder()
                .id(ID2)
                .descricao(DESCRICAO2)
                .build();

        depoimentoLista.add(depoimentoTest);
        depoimentoLista.add(depoimentoTest2);

        return depoimentoLista;
    }

}
