package labes.facomp.ufpa.br.meuegresso.repository.usuario;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;

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
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
class UsuarioRepositoryTest {

    @Mock
    private UsuarioRepository usuarioRepository;

    private UsuarioModel usuario = new UsuarioModel();

    private List<UsuarioModel> usuarios = new ArrayList<>();

    @BeforeEach
    void setUp() {

        usuario = UsuarioModel.builder().nome("John").username("john123").email("john@example.com")
                .password("password123")
                .grupos(Set.of(Grupos.ADMIN))
                .build();
        usuarioRepository.save(usuario);

        UsuarioModel usuario2 = new UsuarioModel();
        usuario2.setNome("Jocke");
        usuario2.setUsername("jocke123");
        usuario2.setEmail("jocke@example.com");
        usuario2.setPassword("password124");
        usuario2.setGrupos(Set.of(Grupos.ADMIN));
        usuario2.setCreatedBy(usuario);
        usuarioRepository.save(usuario2);

        usuarios.add(usuario);
        usuarios.add(usuario2);
    }

    @Test
    void test_Given_Usuario_Login_Should_Return_Correspondent_User_Ignoring_Case() {
        Mockito.when(usuarioRepository.findByUsernameIgnoreCase(anyString())).thenReturn(Optional.of(usuario));
        UsuarioModel user = usuarioRepository.findByUsernameIgnoreCase("JOHN123").get();
        assertNotNull(user);
        assertEquals(usuario, user);
    }

    @Test
    void test_Given_Usuario_Login_Should_Return_Correspondent_Null() {
        Mockito.when(usuarioRepository.findByUsernameIgnoreCase(anyString())).thenReturn(Optional.empty());
        assertTrue(usuarioRepository.findByUsernameIgnoreCase("JOHN123").isEmpty());
    }

    @Test
    void test_Should_Return_All_Userdata() {
        Mockito.when(usuarioRepository.findAll()).thenReturn(usuarios);

        List<UsuarioModel> users = usuarioRepository.findAll();

        assertNotNull(users);
        assertEquals(usuarios.size(), users.size());
        assertEquals(usuarios, users);
    }

    @Test
    void test_Given_Id_And_IdFromTheOneThatCreatedTheId_Return_True_If_Right() {
        Mockito.when(usuarioRepository.existsByIdAndCreatedById(anyInt(), anyInt())).thenReturn(true);

        assertTrue(usuarioRepository.existsByIdAndCreatedById(2, 1));

    }

    @Test
    void test_Given_Id_And_IdFromTheOneThatCreatedTheId_Return_False_If_Wrong() {
        Mockito.when(usuarioRepository.existsByIdAndCreatedById(anyInt(), anyInt())).thenReturn(false);

        assertFalse(usuarioRepository.existsByIdAndCreatedById(1, 2));
    }

    @Test
    void test_Given_Correct_Username_Should_Return_True() {
        Mockito.when(usuarioRepository.existsByUsernameIgnoreCase(anyString())).thenReturn(true);

        assertTrue(usuarioRepository.existsByUsernameIgnoreCase("john123"));
    }

    @Test
    void test_Given_Incorrect_Username_Should_Return_False() {
        Mockito.when(usuarioRepository.existsByUsernameIgnoreCase(anyString())).thenReturn(false);

        assertFalse(usuarioRepository.existsByUsernameIgnoreCase("carla123"));
    }

    @AfterEach
    void tearDown() {
        usuarioRepository.deleteAll();
        usuario = null;
    }
}
