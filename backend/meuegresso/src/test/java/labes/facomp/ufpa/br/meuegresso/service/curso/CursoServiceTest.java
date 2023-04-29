package labes.facomp.ufpa.br.meuegresso.service.curso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.AfterAll;
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
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.curso.CursoRepository;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;

/**
 * Class que implementa testes para o CursoService.
 * 
 * @author
 * @since
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
public class CursoServiceTest {

    private static final Integer ID = 1;
    private static final String NOME = "Ciência da Computação";

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
    @Order(1)
    public void testSave() {

        BDDMockito.given(cursoRepository.save(Mockito.any(CursoModel.class)))
                .willReturn(getMockCurso());

        CursoModel response = cursoService.save(new CursoModel());

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(NOME, response.getNome());
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
        BDDMockito.given(cursoService.findAll())
                .willReturn(List.of(getMockCurso()));

        List<CursoModel> response = cursoService.findAll();
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
        BDDMockito.given(cursoRepository.findById(ID))
                .willReturn(Optional.of(getMockCurso()));

        CursoModel response = cursoService.findById(ID);
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
        BDDMockito.given(cursoRepository.save(Mockito.any(CursoModel.class)))
                .willReturn(getMockCurso());

        CursoModel cursoUpdated = cursoService.update(getMockCurso());

        assertNotNull(cursoUpdated);
        assertEquals(cursoUpdated, getMockCurso());
    }

    /**
     * Metodo para testar o deleteById.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(5)
    public void testDeleteById() {

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
    @Order(6)
    public void testExistsByIdAndCreatedById() {

        BDDMockito.given(cursoRepository.existsByIdAndCreatedById(ID, ID))
                .willReturn(true);

        UsuarioModel usuario = new UsuarioModel(1, "username", "password", "email@gmail.com", "nome", null, null);
        CursoModel curso = getMockCurso();
        curso.setCreatedBy(usuario);

        usuarioService.save(usuario);
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

    @AfterAll
    public void tearDown() {
        usuarioService.deleteById(ID);
        cursoService.deleteById(ID);
        cursoRepository.deleteAll();
    }
}