package labes.facomp.ufpa.br.meuegresso.service.egresso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
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
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;

/**
 * Classe que implementa testes para o EgressoService.
 *
 * @author Pedro Inácio
 * @since 28/04/2023
 */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
class EgressoServiceTest {

    private static final Integer ID = 1;
    private static final LocalDate NASCIMENTO = LocalDate.parse("1997-05-05");
    private static final Boolean INTERESSEEMPOS = true;
    private static final String LATTES = "https://lattes.cnpq.br/";
    private static final String LINKEDIN = "https://linkedin.com/";
    private static final String MATRICULA = "12345678";

    @Autowired
    private EgressoService egressoService;

    @MockBean
    private EgressoRepository egressoRepository;

    /**
     * Metodo para testar a criacao de um EgressoModel com adicionar Egresso.
     *
     * @author Bruno Eiki, Pedro Inácio
     * @since 27/04/2023
     */

    @BeforeAll
    void setUp() {
        BDDMockito.given(egressoRepository.save(Mockito.any(EgressoModel.class)))
                .willReturn(getMockEgresso());

        BDDMockito.given(egressoRepository.findAll())
                .willReturn(getMockEgressoLista());

        BDDMockito.given(egressoRepository.findByUsuarioId(Mockito.anyInt()))
                .willReturn(Optional.ofNullable(getMockEgresso()));

        BDDMockito.given(egressoRepository.existsByIdAndCreatedById(Mockito.anyInt(), Mockito.anyInt()))
                .willReturn(true);

        BDDMockito.given(egressoService.deleteById(Mockito.anyInt()))
                .willReturn(true);


    }

    @Test
    @Order(1)
    void testAdicionarEgresso() {

        EgressoModel response = egressoService.save(new EgressoModel());

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(NASCIMENTO, response.getNascimento());
        assertEquals(INTERESSEEMPOS, response.getInteresseEmPos());
        assertEquals(LATTES, response.getLattes());
        assertEquals(LINKEDIN, response.getLinkedin());
    }

    /**
     * Metodo para testar o metodo findAll.
     *
     * @author Bruno Eiki, Pedro Inácio
     * @since 27/04/2023
     */
    @Test
    @Order(2)
    void testFindAll() {

        List<EgressoModel> response = egressoService.findAll();
        assertNotNull(response);
    }

    /**
     * Metodo para testar o findById.
     *
     * @author Bruno Eiki, Pedro Inácio
     * @since 27/04/2023
     */
    @Test
    @Order(3)
    void testFindByUsuarioId() {

        EgressoModel response = egressoService.findByUsuarioId(ID);
        assertNotNull(response);
    }

    /**
     * Metodo para testar o update.
     *
     * @author Bruno Eiki, Pedro Inácio
     * @since 27/04/2023
     */
    @Test
    @Order(4)
    void testUpdateEgresso() {
        EgressoModel response = egressoService.update(getMockEgresso());
        assertNotNull(response);
    }

    /**
     * Metodo para testar o existsByIdAndCreatedById.
     *
     * @author Bruno Eiki, Pedro Inácio
     * @since 27/04/2023
     */
    @Test
    @Order(5)
    void testExistsByIdAndCreatedById() {
        Boolean response = egressoService.existsByIdAndCreatedById(ID, ID);
        assertTrue(response);
    }

    /**
     * Metodo para testar o deleteById.
     *
     * @author Bruno Eiki, Pedro Inácio
     * @since 27/04/2023
     */
    @Test
    @Order(6)
    void testDeletarEgresso() {

        Boolean response = egressoService.deleteById(ID);
        assertTrue(response);
    }

    /**
     * Metodo que preenche um mock de um EgressoModel para retorno dos testes
     *
     * @author Bruno Eiki, Pedro Inácio
     * @since 27/04/2023
     *
     * @return <code>egressoTeste</code> object
     */
    private EgressoModel getMockEgresso() {
        EgressoModel egressoTest = EgressoModel.builder()
                .id(ID)
                .matricula(MATRICULA)
                .nascimento(NASCIMENTO)
                .interesseEmPos(INTERESSEEMPOS)
                .lattes(LATTES)
                .linkedin(LINKEDIN)
                .build();
        return egressoTest;
    }

    private List<EgressoModel> getMockEgressoLista() {
        List<EgressoModel> egressoLista = new ArrayList<>();
        EgressoModel egressoTest = EgressoModel.builder()
                .id(ID)
                .matricula(MATRICULA)
                .nascimento(NASCIMENTO)
                .interesseEmPos(INTERESSEEMPOS)
                .lattes(LATTES)
                .linkedin(LINKEDIN)
                .build();

        EgressoModel egressoTest2 = EgressoModel.builder()
                .id(ID)
                .matricula(MATRICULA)
                .nascimento(NASCIMENTO)
                .interesseEmPos(INTERESSEEMPOS)
                .lattes(LATTES)
                .linkedin(LINKEDIN)
                .build();

        egressoLista.add(egressoTest);
        egressoLista.add(egressoTest2);

        return egressoLista;
    }

    @AfterAll
    void tearDown() {
        egressoRepository.deleteAll();
    }
}
