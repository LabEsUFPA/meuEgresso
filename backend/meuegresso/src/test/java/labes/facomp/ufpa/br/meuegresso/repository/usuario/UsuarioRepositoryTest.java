package labes.facomp.ufpa.br.meuegresso.repository.usuario;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

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
@ActiveProfiles("test")
public class UsuarioRepositoryTest {

    @Autowired
    private UsuarioRepository repository;

    private UsuarioModel usuario;

    @BeforeEach
    public void setUp() {
        usuario = new UsuarioModel();
        usuario.setId(1);
        usuario.setNome("John");
        usuario.setUsername("john123");
        usuario.setEmail("john@example.com");
        usuario.setPassword("password123");
        usuario.setCreatedBy(usuario);

        repository.save(usuario);

        UsuarioModel usuario2 = new UsuarioModel();
        usuario2.setId(2);
        usuario2.setNome("Jocke");
        usuario2.setUsername("jocke123");
        usuario2.setEmail("jocke@example.com");
        usuario2.setPassword("password124");
        usuario2.setCreatedBy(usuario);
        repository.save(usuario2);
    }

    @Test
    public void test_Given_Usuario_Login_Should_Correspondent_User_Ignoring_Case() {
        UsuarioModel user = repository.findByUsernameIgnoreCase("JOHN123").get();
        assertEquals(usuario, user);
    }

    @Test
    public void test_Should_Return_All_Userdata() {
        List<UsuarioModel> users = repository.findAll();
        assertEquals(2, users.size());
    }

    @Test
    public void test_Given_Correct_Username_Should_Return_True() {
        assertTrue(repository.existsByUsername("john123"));
    }

    @Test
    public void test_Given_Incorrect_Username_Should_Return_False() {
        assertFalse(repository.existsByUsername("Carla"));
    }

    @Test
    public void test_Given_Id_And_IdFromTheOneThatCreatedTheId_Return_True_If_Right() {
        assertTrue(repository.existsByIdAndCreatedById(2, 1));
    }

    @Test
    public void test_Given_Id_And_IdFromTheOneThatCreatedTheId_Return_False_If_Wrong() {
        assertFalse(repository.existsByIdAndCreatedById(1, 2));
    }

    @AfterEach
    public void tearDown() {
        usuario = null;
    }
}
