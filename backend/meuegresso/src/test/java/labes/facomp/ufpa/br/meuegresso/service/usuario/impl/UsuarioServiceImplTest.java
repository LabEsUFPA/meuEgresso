package labes.facomp.ufpa.br.meuegresso.service.usuario.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.hamcrest.MatcherAssert;
import org.hamcrest.Matchers;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

/**
 * Responsável por realizar os testes unitários referentes ao
 * UsuárioServiceImpl.
 *
 * @author Marcus Maciel
 * @since 26/04/2023
 * @version 1.0.1
 */

@SpringBootTest
@DirtiesContext
@ActiveProfiles("test")
class UsuarioServiceImplTest {

	@Mock
	private PasswordEncoder passwordEncoder;

	@Mock
	private UsuarioRepository usuarioRepository;

	@InjectMocks
	private UsuarioServiceImpl usuarioService;

	private UsuarioModel usuario = new UsuarioModel();

	private List<UsuarioModel> usuarios = new ArrayList<>();

	@BeforeEach
	void setUp() {
		usuario.setId(1);
		usuario.setNome("John");
		usuario.setUsername("john123");
		usuario.setEmail("john@example.com");
		usuario.setPassword("password123");
		usuario.setCreatedBy(usuario);

		usuarioRepository.save(usuario);

		UsuarioModel usuario2 = new UsuarioModel();
		usuario2.setId(2);
		usuario2.setNome("Jocke");
		usuario2.setUsername("jocke123");
		usuario2.setEmail("jocke@example.com");
		usuario2.setPassword("password124");
		usuario2.setCreatedBy(usuario);
		usuarioRepository.save(usuario2);

		usuarios.add(usuario);
		usuarios.add(usuario2);
	}

	@Test
	void test_Given_Valid_Username_Should_Return_Userdata() {
		Mockito.when(usuarioRepository.findByUsernameIgnoreCase(anyString())).thenReturn(Optional.of(usuario));

		UsuarioModel user = usuarioService.loadUserByUsername("john123");

		assertNotNull(user);
		assertEquals(usuario, user);
		Mockito.verify(usuarioRepository).findByUsernameIgnoreCase(anyString());
	}

	@Test
	void test_Given_Invalid_Username_Should_Not_Return_Userdata() {
		Mockito.when(usuarioRepository.findByUsernameIgnoreCase(anyString())).thenReturn(Optional.empty());

		assertThrows(UsernameNotFoundException.class, () -> usuarioService.loadUserByUsername("carla123"));
		Mockito.verify(usuarioRepository).findByUsernameIgnoreCase(anyString());
	}

	@Test
	void test_Given_Valid_Username_Should_Return_True() {
		Mockito.when(usuarioRepository.existsByUsernameIgnoreCase(anyString())).thenReturn(true);

		boolean userindb = usuarioService.existsByUsername("john123");

		assertTrue(userindb);
		Mockito.verify(usuarioRepository).existsByUsernameIgnoreCase(anyString());

	}

	@Test
	void test_Given_Invalid_Username_Should_False() {
		Mockito.when(usuarioRepository.existsByUsernameIgnoreCase(anyString())).thenReturn(false);

		boolean userindb = usuarioService.existsByUsername("carla123");

		assertFalse(userindb);
		Mockito.verify(usuarioRepository).existsByUsernameIgnoreCase(anyString());
	}

	@Test
	void test_Given_Valid_Id_Should_Return_Userdata() {
		Mockito.when(usuarioRepository.findById(anyInt())).thenReturn(Optional.of(usuario));

		UsuarioModel user = usuarioService.findById(1);

		// Idealmente deveria ser algo como anyInt, mas anyInt retorna 0. E ID > 0
		MatcherAssert.assertThat(user.getId(), Matchers.greaterThan(0));
		assertNotNull(user);
		assertEquals(usuario, user);
		Mockito.verify(usuarioRepository).findById(anyInt());
	}

	@Test
	void test_Given_Invalid_Id_Should_Not_Return_Userdata() {
		Mockito.when(usuarioRepository.findById(anyInt())).thenReturn(Optional.empty());

		assertThrows(NoSuchElementException.class, () -> usuarioService.findById(1));
		Mockito.verify(usuarioRepository).findById(anyInt());
	}

	@Test
	void test_Should_Return_All_Userdata() {
		Mockito.when(usuarioRepository.findAll()).thenReturn(usuarios);

		List<UsuarioModel> users = usuarioService.findAll();

		assertNotNull(users);
		assertEquals(usuarios.size(), users.size());
		assertEquals(usuarios, users);
		Mockito.verify(usuarioRepository).findAll();
	}

	@Test
	void test_Save_Should_Save_On_Repository() {
		Mockito.when(usuarioRepository.save(new UsuarioModel())).thenReturn(usuario);
		UsuarioModel user = usuarioService.save(new UsuarioModel());
		assertNotNull(user);
		assertEquals(usuario, user);
		Mockito.verify(usuarioRepository).save(new UsuarioModel());

	}

	@Test
	void test_Given_New_Credentials_Return_Updated_User() throws InvalidRequestException {
		// something like clone, but already in db
		UsuarioModel user = new UsuarioModel();
		user.setId(1);
		user.setNome("John");
		user.setUsername("john123");
		user.setEmail("john@example.com");
		user.setPassword("password123");
		user.setCreatedBy(usuario);
		// updating
		user.setNome("Michael");
		user.setEmail("michel@hotmail.com");
		user.setUsername("michel123");
		user.setPassword("newpassword");
		user.setLastModifiedBy(user);

		UsuarioModel mockUser = new UsuarioModel();
		mockUser.setId(10);

		Mockito.when(usuarioRepository.save(new UsuarioModel(10, null, null, null, null, null, null, true, true)))
				.thenReturn(user);
		UsuarioModel usertest = usuarioService.update(mockUser);

		MatcherAssert.assertThat(usertest.getId(), Matchers.greaterThan(0));
		assertNotNull(usertest);
		assertEquals(user, usertest);
		Mockito.verify(usuarioRepository).save(new UsuarioModel(10, null, null, null, null, null, null, true, true));
	}

	@Test
	void test_Given_New_Credentials_Do_Not_Return_Updated_For_Wrong_User() throws InvalidRequestException {
		// something like clone, but already in db
		UsuarioModel user = new UsuarioModel();
		user.setId(10);
		user.setNome("John");
		user.setUsername("john123");
		user.setEmail("john@example.com");
		user.setPassword("password123");
		user.setCreatedBy(usuario);
		// updating
		user.setNome("Michael");
		user.setEmail("michel@hotmail.com");
		user.setUsername("michel123");
		user.setPassword("newpassword");
		user.setLastModifiedBy(user);

		UsuarioModel mockUser = new UsuarioModel();

		assertThrows(InvalidRequestException.class, () -> usuarioService.update(mockUser));
	}

	@Test
	void test_Given_Correct_Id_Should_Delete_User_Data() {
		Mockito.when(usuarioRepository.findById(anyInt())).thenReturn(Optional.of(usuario));
		Mockito.when(usuarioRepository.existsById(1)).thenReturn(true);

		UsuarioModel user = usuarioService.findById(1);

		assertTrue(usuarioService.deleteById(user.getId()));
		Mockito.verify(usuarioRepository).deleteById(user.getId());
	}

	@Test
	void test_Given_Incorrect_Id_Should_Not_Delete_User_Data() {
		Mockito.when(usuarioRepository.findById(anyInt())).thenReturn(Optional.of(usuario));
		Mockito.when(usuarioRepository.existsById(1)).thenReturn(false);

		UsuarioModel user = usuarioService.findById(1);

		assertFalse(usuarioService.deleteById(user.getId()));
		Mockito.verify(usuarioRepository, Mockito.times(0)).deleteById(user.getId());
	}

	@Test
	void test_Given_Id_And_IdFromTheOneThatCreatedTheId_Return_True_If_Right() {
		Mockito.when(usuarioRepository.existsByIdAndCreatedById(anyInt(), anyInt())).thenReturn(true);
		assertTrue(usuarioService.existsByIdAndCreatedById(1, 2));
		Mockito.verify(usuarioRepository).existsByIdAndCreatedById(anyInt(), anyInt());
	}

	@Test
	void test_Given_Id_And_IdFromTheOneThatCreatedTheId_Return_False_If_Wrong() {
		Mockito.when(usuarioRepository.existsByIdAndCreatedById(anyInt(), anyInt())).thenReturn(false);
		assertFalse(usuarioService.existsByIdAndCreatedById(5, 5));
		Mockito.verify(usuarioRepository).existsByIdAndCreatedById(anyInt(), anyInt());
	}

	@AfterEach
	void tearDown() {
		usuario = null;
		usuarios = null;
	}
}