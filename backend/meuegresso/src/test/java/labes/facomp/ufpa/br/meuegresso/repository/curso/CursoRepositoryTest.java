package labes.facomp.ufpa.br.meuegresso.repository.curso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.AfterAll;
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

import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

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
    private CursoRepository cursoRepository;

    private final static Integer ID = 1;
    private final static String NOME = "NomeTeste";

    private CursoModel cursoModel;

    @Autowired
    private EgressoRepository egressoRepository;

    @Autowired
    private GeneroRepository generoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    private EgressoModel egressoModel;
    
    private GeneroModel generoModel;

    private UsuarioModel usuarioModel;

    @BeforeEach
    void setUp() {
        generoModel = new GeneroModel();
        generoModel.setId(1);
        generoModel.setNome("Masculino");
        generoModel = generoRepository.save(generoModel);

        usuarioModel = UsuarioModel.builder()
                .id(1)
                .nome("John")
                .username("john123")
                .email("john@example.com")
                .password("password123")
                .build();
        usuarioModel.setGrupos(Set.of(Grupos.ADMIN));
        usuarioModel = usuarioRepository.save(usuarioModel);

        egressoModel = EgressoModel.builder()
                .id(1)
                .nascimento(LocalDate.parse("1999-10-20"))
                .genero(generoModel)
                .matricula("202003940011")
                .interesseEmPos(true)
                .lattes("null")
                .linkedin("null")
                .usuario(usuarioModel)
                .build();
        egressoModel.setCreatedBy(usuarioModel);

        egressoModel = egressoRepository.save(egressoModel);

        cursoModel = CursoModel.builder()
            .id(ID)
            .nome(NOME)
            .build();

        cursoModel.setCreatedBy(usuarioModel);

        cursoModel = cursoRepository.save(cursoModel);
    }

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
     * Método que testa o repositório que salva Curso
     * 
     * @author Pedro Inácio
     * @since 24/06/2023
     */
    @Test
    void testExistsByIdAndCreatedById() {

        Boolean response = cursoRepository.existsByIdAndCreatedById(cursoModel.getId(), usuarioModel.getId());

        assertNotNull(response);
        assertTrue(response);
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
