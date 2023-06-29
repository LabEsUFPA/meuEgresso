package labes.facomp.ufpa.br.meuegresso.service.egresso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Optional;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.exceptions.NotValidEgressoException;
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

    @Autowired
    private EgressoValidoRepository egressoValidoRepository;

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

    @Test
    void testeValidarEgresso() throws NotValidEgressoException {
        EgressoValidoModel egressoValidoModel = getMockEgresso();

        egressoValidoRepository.save(egressoValidoModel);

        Optional<String> optionalMatricula = Optional.of(egressoValidoModel.getMatricula());
        Optional<String> optionalNome = Optional.of(egressoValidoModel.getNome());
        Optional<String> optionalEmail = Optional.of(egressoValidoModel.getEmail());

        EgressoValidoModel response = egressoValidoService.validarEgresso(optionalMatricula, optionalNome, optionalEmail);

        assertNotNull(response);
        assertEquals(egressoValidoModel, response);
    }

    @AfterAll
    public void tearDown() {
        egressoValidoRepository.deleteAll();
    }
}
