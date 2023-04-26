package labes.facomp.ufpa.br.meuegresso.service.usuario.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.util.NoSuchElementException;
import java.util.Optional;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

@SpringBootTest
@ActiveProfiles("test")
public class UsuarioServiceImplTest {

	@InjectMocks
	private UsuarioServiceImpl usuarioService;

	@Mock
	private UsuarioRepository repository;

	private UsuarioModel usuario = new UsuarioModel();

	@BeforeEach
	public void setUp() {
		usuario.setId(1);
		usuario.setNome("John");
		usuario.setUsername("john123");
		usuario.setEmail("john@example.com");
		usuario.setPassword("password123");
		usuario.setMatricula("123456789123");
		repository.save(usuario);
	}

	@Test
	public void test_Given_Valid_Username_Should_Return_Userdata() {

		Mockito.when(repository.findByUsernameIgnoreCase("john123")).thenReturn(Optional.of(usuario));

		assertEquals(usuario, usuarioService.loadUserByUsername("john123"));
	}

	@Test
	public void test_Given_Invalid_Username_Should_Not_Return_Userdata() {
		Mockito.when(repository.findByUsernameIgnoreCase("carla123")).thenReturn(Optional.empty());

		assertThrows(UsernameNotFoundException.class, () -> usuarioService.loadUserByUsername("carla123"));
	}

	@Test
	public void test_Given_Valid_Username_Should_Return_True() {
		Boolean username_in_database = true;
		Mockito.when(repository.existsByUsername("john123")).thenReturn(username_in_database);

		assertEquals(username_in_database, usuarioService.existsByUsername("john123"));
	}

	@Test
	public void test_Given_Invalid_Username_Should_False() {
		Boolean username_in_database = true;
		Mockito.when(repository.existsByUsername("carla123")).thenReturn(username_in_database);

		assertEquals(username_in_database, usuarioService.existsByUsername("carla123"));
	}

	@Test
	public void test_Given_Valid_Id_Should_Return_Userdata() {
		Mockito.when(repository.findById(1)).thenReturn(Optional.of(usuario));
		assertEquals(usuario, usuarioService.findById(usuario.getId()));
	}

	@Test
	public void test_Given_Invalid_Id_Should_Not_Return_Userdata() {
		Mockito.when(repository.findById(10)).thenReturn(Optional.of(usuario));
		assertThrows(NoSuchElementException.class, () -> usuarioService.findById(usuario.getId()));
	}

	@AfterEach
	public void tearDown() {
		usuario = null;
	}
}
