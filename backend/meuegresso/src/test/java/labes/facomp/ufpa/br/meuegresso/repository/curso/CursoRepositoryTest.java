package labes.facomp.ufpa.br.meuegresso.repository.curso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.model.CursoModel;

/**
 * Classe que testa as features do CursoRepository
 * 
 * @author Bruno Eiki
 * @since 29/04/2023
 */
@DirtiesContext
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
class CursoRepositoryTest {

    @Autowired
    CursoRepository cursoRepository;

    private final static Integer ID = 1;
    private final static String NOME = "NomeTeste";

    CursoModel cursoModel;

    /**
     * Método que testa o repositório que salva Curso
     * 
     * @author Bruno Eiki
     * @since 29/04/2023
     */
    @Test
    void testSave() {

        CursoModel response = cursoRepository.save(getMockCurso());

        assertNotNull(response);
        assertEquals(NOME, response.getNome());
    }

    /**
     * Método que testa o repositório que retorna todos os Cursos
     * 
     * @author Bruno Eiki
     * @since 29/04/2023
     */
    @Test
    void testFindAll() {

        cursoRepository.save(getMockCurso());
        List<CursoModel> response = cursoRepository.findAll();

        assertNotNull(response);
        assertEquals(List.of(getMockCurso()),response);
    }

    private CursoModel getMockCurso() {
        CursoModel cursoTest = CursoModel.builder()
                .id(ID)
                .nome(NOME)
                .build();
        return cursoTest;
    }

    /**
     * Metodo para remover todos os dados do repository.
     * 
     * @author Bruno Eiki
     * @since 29/04/2023
     */
    @AfterAll
    public void tearDown() {
        cursoRepository.deleteAll();
    }
}
