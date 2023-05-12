package labes.facomp.ufpa.br.meuegresso.service.egresso;

import static org.junit.jupiter.api.Assertions.assertNotNull;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.model.EgressoValidoModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoValidoRepository;

/**
 * Classe que implementa testes para o EgressoValidoService.
 *
 * @author Pedro Inácio
 * @since 30/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
class EgressoValidoServiceTest {

    private static final Integer ID = 1;
    private static final String NOME = "Pedrao";
    private static final String MATRICULA = "202003940666";
    private static final String EMAIL = "help@gmail.com";

    @Autowired
    private EgressoValidoService egressoValidoService;

    @MockBean
    private EgressoValidoRepository repository;

    /**
     * Metodo para testar o metodo findAll.
     *
     * @author Pedro Inácio
     * @since 30/04/2023
     */
    @Test
    void testFindAll() {
        BDDMockito.given(repository.findAll())
                .willReturn(getMockEgressoLista());

        List<EgressoValidoModel> response = egressoValidoService.findAll();
        assertNotNull(response);
    }

    /**
     * Metodo para testar o findByEmailIgnoreCase.
     *
     * @author Pedro Inácio
     * @since 30/04/2023
     */
    @Test
    void testFindByEmailIgnoreCase() {
        BDDMockito.given(repository.findByEmailIgnoreCase(EMAIL))
                .willReturn(Optional.ofNullable(getMockEgresso()));

        Optional<EgressoValidoModel> response = egressoValidoService.findByEmail(EMAIL);
        assertNotNull(response);
    }

    /**
     * Metodo para testar o findByMatricula.
     *
     * @author Pedro Inácio
     * @since 30/04/2023
     */
    @Test
    void testfindByMatricula() {
        try {
            BDDMockito.given(repository.findByMatricula(MATRICULA))
                    .willReturn(Optional.ofNullable(getMockEgresso()));

            Optional<EgressoValidoModel> response = egressoValidoService.findByMatricula(MATRICULA);
            assertNotNull(response);
        } catch (Exception e) {
            e.getMessage();
        }
    }

    /**
     * Metodo para testar o findByNomeIgnoreCase.
     *
     * @author Pedro Inácio
     * @since 30/04/2023
     */
    @Test
    void testfindByNomeIgnoreCase() {

        BDDMockito.given(egressoValidoService.findByNomeIgnoreCase(NOME))
                .willReturn(getMockEgressoLista());

        List<EgressoValidoModel> response = egressoValidoService.findByNomeIgnoreCase(NOME);
        assertNotNull(response);
    }

    /**
     * Metodo que preenche um mock de um EgressoValidoModel para retorno dos testes
     *
     * @author Pedro Inácio
     * @since 30/04/2023
     *
     * @return <code>egressoTest</code> object
     */
    private EgressoValidoModel getMockEgresso() {
        EgressoValidoModel egressoTest = new EgressoValidoModel();
        egressoTest.setId(ID);
        egressoTest.setNome(NOME);
        egressoTest.setMatricula(MATRICULA);
        egressoTest.setEmail(EMAIL);

        return egressoTest;
    }

    private List<EgressoValidoModel> getMockEgressoLista() {
        List<EgressoValidoModel> egressoLista = new ArrayList<>();
        EgressoValidoModel egressoTest = new EgressoValidoModel();
        egressoTest.setId(ID);
        egressoTest.setNome(NOME);
        egressoTest.setMatricula(MATRICULA);
        egressoTest.setEmail(EMAIL);

        EgressoValidoModel egressoTest2 = new EgressoValidoModel();
        egressoTest2.setId(ID);
        egressoTest2.setNome(NOME);
        egressoTest2.setMatricula(MATRICULA);
        egressoTest2.setEmail(EMAIL);

        egressoLista.add(egressoTest);
        egressoLista.add(egressoTest2);

        return egressoLista;
    }

    @AfterAll
    public void tearDown() {
        repository.deleteAll();
    }
}
