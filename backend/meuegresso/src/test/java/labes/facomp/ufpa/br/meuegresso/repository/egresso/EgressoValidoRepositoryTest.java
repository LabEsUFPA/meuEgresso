package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.model.EgressoValidoModel;

@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_CLASS)
@RunWith(SpringRunner.class)
@DataJpaTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
class EgressoValidoRepositoryTest {
    @Autowired
    private EgressoValidoRepository egressoValidoRepository;

    private EgressoValidoModel egressoValidoModel = new EgressoValidoModel();

    @BeforeEach
    void setUp() {
        egressoValidoModel.setNome("John");
        egressoValidoModel.setMatricula("202003940011");
        egressoValidoModel.setEmail("john@example.com");

        egressoValidoModel = egressoValidoRepository.save(egressoValidoModel);
    }

    @Test
    void testFindAll() {
        List<EgressoValidoModel> response = egressoValidoRepository.findAll();

        assertNotNull(response);
        assertEquals(List.of(egressoValidoModel), response);
    }

    @Test
    void testFindByEmailIgnoreCase() {
        Optional<EgressoValidoModel> response = egressoValidoRepository.findByEmailIgnoreCase(egressoValidoModel.getEmail());

        assertNotNull(response);
        assertEquals(egressoValidoModel, response.get());
    }

    @Test
    void testFindByMatricula() {
        Optional<EgressoValidoModel> response = egressoValidoRepository.findByMatricula(egressoValidoModel.getMatricula());

        assertNotNull(response);
        assertEquals(egressoValidoModel, response.get());
    }

    @Test
    void testFindByNomeIgnoreCase() {
        List<EgressoValidoModel> response = egressoValidoRepository.findByNomeIgnoreCase(egressoValidoModel.getNome());

        assertNotNull(response);
        assertEquals(List.of(egressoValidoModel), response);
    }

    @AfterAll
    void tearDown() {
        egressoValidoRepository.deleteAll();
    }
}
