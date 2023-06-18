package labes.facomp.ufpa.br.meuegresso.service.curso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
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
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.curso.CursoRepository;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;

/**
 * Class que implementa testes para o CursoService.
 * 
 * @author Bruno Eiki
 * @since 27/04/2023
 */
@DirtiesContext
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
class CursoServiceTest {

    private static final Integer ID = 1;
    private static final String NOME = "Ciência da Computação";

    private static final Integer ID2 = 2;
    private static final String NOME2 = "Sistema da Informação";

    @Autowired
    private CursoService cursoService;

    @Autowired
    private UsuarioService usuarioService;

    @MockBean
    private CursoRepository cursoRepository;

    /**
     * Metodo para testar a criacao de um CursoModel com save.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testSave() {

        BDDMockito.given(cursoRepository.save(Mockito.any(CursoModel.class)))
                .willReturn(getMockCurso());

        CursoModel response = cursoService.save(new CursoModel());

        assertNotNull(response);
        assertEquals(getMockCurso(), response);
    }

    /**
     * Metodo para testar o metodo findAll.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testFindAll() {
        BDDMockito.given(cursoRepository.findAll())
                .willReturn(getMockCursoLista());

        List<CursoModel> response = cursoService.findAll();
        assertEquals(getMockCursoLista(), response);
    }

    /**
     * Metodo para testar o findById.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testFindById() {
        BDDMockito.given(cursoRepository.findById(ID))
                .willReturn(Optional.of(getMockCurso()));

        CursoModel response = cursoService.findById(ID);
        assertEquals(getMockCurso(), response);
    }

    /**
     * Metodo para testar o update.
     * 
     * @author Bruno Eiki
     * @throws InvalidRequestException
     * @since 27/04/2023
     */
    @Test
    void testUpdate() throws InvalidRequestException {

        var cursoUpdate = getMockCurso();
        cursoUpdate.setNome("Teste");

        BDDMockito.given(cursoRepository.save(Mockito.any(CursoModel.class)))
                .willReturn(cursoUpdate);

        CursoModel response = cursoService.update(getMockCurso());

        assertNotNull(response);
        assertEquals(cursoUpdate, response);
    }

    /**
     * Metodo para testar o deleteById.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testDeleteById() {

        BDDMockito.given(cursoService.deleteById(ID))
                .willReturn(true);

        Boolean response = cursoService.deleteById(ID);
        assertTrue(response);
    }

    /**
     * Metodo para testar o existsByIdAndCreatedById.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testExistsByIdAndCreatedById() {

        BDDMockito.given(cursoRepository.existsByIdAndCreatedById(ID, ID))
                .willReturn(true);

        UsuarioModel usuarioModel = new UsuarioModel();
                usuarioModel.setUsername("username");
                usuarioModel.setNome("nome_test");
                usuarioModel.setEmail("teste@gmail.com");
                usuarioModel.setPassword("teste123");
                usuarioModel.setGrupos(Set.of(Grupos.ADMIN));
        CursoModel curso = getMockCurso();
        curso.setCreatedBy(usuarioModel);

        usuarioService.save(usuarioModel);
        cursoService.save(curso);

        Boolean response = cursoService.existsByIdAndCreatedById(
                curso.getId(),
                curso.getCreatedBy().getId());
        assertTrue(response);
    }

    /**
     * Metodo que preenche um mock de um CursoModel para retorno dos testes
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     * 
     * @return <code>cursoTeste</code> object
     */
    private CursoModel getMockCurso() {
        CursoModel cursoTest = CursoModel.builder()
                .id(ID)
                .nome(NOME)
                .build();
        return cursoTest;
    }

    private List<CursoModel> getMockCursoLista() {

        List<CursoModel> cursoLista = new ArrayList<>();

        CursoModel cursoTest = CursoModel.builder()
                .id(ID)
                .nome(NOME)
                .build();

        CursoModel cursoTest2 = CursoModel.builder()
                .id(ID2)
                .nome(NOME2)
                .build();

        cursoLista.add(cursoTest);
        cursoLista.add(cursoTest2);

        return cursoLista;
    }

    @AfterAll
    public void tearDown() {
        usuarioService.deleteById(ID);
        cursoService.deleteById(ID);
        cursoRepository.deleteAll();
    }
}