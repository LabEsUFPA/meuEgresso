package labes.facomp.ufpa.br.meuegresso.repository.genero;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;

/**
 * Classe que testa as features do generoRepository
 *
 * @author Pedro Inácio
 * @since 10/06/2023
 */
@DirtiesContext
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
class GeneroRepositoryTest {

    @Autowired
    private GeneroRepository generoRepository;

    private GeneroModel generoModel;

    private final static Integer ID = 1;
    private final static String GENERO = "GeneroTeste";

    @BeforeEach
    void setUp() {

        generoModel = GeneroModel.builder()
                .id(ID)
                .nome(GENERO)
                .build();

        generoModel = generoRepository.save(generoModel);
    }

    /**
     * Método que testa o repositório que salva genero
     *
     * @author Pedro Inácio
     * @since 10/06/2023
     */
    @Test
    void testSave() {

        GeneroModel response = generoRepository.save(generoModel);

        assertNotNull(response);
        assertEquals(GENERO, response.getNome());
    }

    /**
     * Método que testa o repositório que retorna todos os generos
     *
     * @author Pedro Inácio
     * @since 10/06/2023
     */
    @Test
    void testFindAll() {

        List<GeneroModel> response = generoRepository.findAll();

        assertNotNull(response);
        assertEquals(List.of(generoModel), response);
    }

    @Test
    void testExistsByIdAndCreatedById() {
        Boolean response = generoRepository.existsById(generoModel.getId());

        assertNotNull(response);
        assertTrue(response);
    }

}
