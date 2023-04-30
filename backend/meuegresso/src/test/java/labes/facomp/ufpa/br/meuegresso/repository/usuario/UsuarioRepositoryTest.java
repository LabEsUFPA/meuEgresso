package labes.facomp.ufpa.br.meuegresso.repository.usuario;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.grupo.GrupoRepository;

/**
 * Responsável por realizar os testes unitários referentes ao
 * UsuárioServiceImpl.
 *
 * @author Marcus Maciel
 * @since 27/04/2023
 * @version 1.0.1
 */
@SpringBootTest
@DirtiesContext
@ActiveProfiles("test")
// @AutoConfigureMockMvc
// @TestInstance(Lifecycle.PER_CLASS)
// @TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({DependencyInjectionTestExecutionListener.class,MockitoTestExecutionListener.class })
class UsuarioRepositoryTest {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private GrupoRepository grupoRepository;


    UsuarioModel usuario = new UsuarioModel();

    @BeforeEach
    void setUp() {
        GrupoModel grupoModel = GrupoModel.builder().nomeGrupo("ADMINNN").build();
        grupoModel = grupoRepository.save(grupoModel);

        Set<GrupoModel> grupos = new HashSet<>();
        grupos.add(grupoModel);

        UsuarioModel usuarioModel = UsuarioModel.builder().nome("John").username("john123").email("john@example.com")
                .password("password123")
                .grupos(grupos)
                .build();
        usuario = usuarioRepository.save(usuarioModel);

        UsuarioModel usuario2 = new UsuarioModel();
        usuario2.setNome("Jocke");
        usuario2.setUsername("jocke123");
        usuario2.setEmail("jocke@example.com");
        usuario2.setPassword("password124");
        usuario2.setGrupos(grupos);
        usuarioRepository.save(usuario2);
    }

    @Test
    void test_Given_Usuario_Login_Should_Correspondent_User_Ignoring_Case() {
        UsuarioModel user = usuarioRepository.findByUsernameIgnoreCase("JOHN123").get();
        assertEquals(usuario, user);
    }

    @Test
    void test_Should_Return_All_Userdata() {
        List<UsuarioModel> users = usuarioRepository.findAll();
        assertEquals(2, users.size());
    }

    @Test
    void test_Given_Correct_Username_Should_Return_True() {
        assertTrue(usuarioRepository.existsByUsername("john123"));
    }

    @Test
    void test_Given_Incorrect_Username_Should_Return_False() {
        assertFalse(usuarioRepository.existsByUsername("Carla"));
    }

    @Test
    void test_Given_Id_And_IdFromTheOneThatCreatedTheId_Return_False_If_Wrong() {
        assertFalse(usuarioRepository.existsByIdAndCreatedById(1, 2));
    }

    @AfterEach
    void tearDown() {
        usuarioRepository.deleteAll();
        grupoRepository.deleteAll();
        usuario = null;
    }
}
