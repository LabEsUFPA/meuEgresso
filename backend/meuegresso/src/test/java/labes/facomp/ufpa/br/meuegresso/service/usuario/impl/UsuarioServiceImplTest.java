package labes.facomp.ufpa.br.meuegresso.service.usuario.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
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
@ActiveProfiles("test")
public class UsuarioServiceImplTest {

	@InjectMocks
	private UsuarioServiceImpl usuarioService;

	@Mock
	private UsuarioRepository repository;

	private UsuarioModel usuario = new UsuarioModel();

	private List<UsuarioModel> usuarios = new ArrayList<>();

	@BeforeEach
	public void setUp() {
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
		assertEquals(usuario, usuarioService.findById(1));
	}

	@Test
	public void test_Given_Invalid_Id_Should_Not_Return_Userdata() {
		Mockito.when(repository.findById(10)).thenReturn(Optional.of(usuario));
		assertThrows(NoSuchElementException.class, () -> usuarioService.findById(1));
	}

	@Test
	public void test_Should_Return_All_Userdata() {
		List<UsuarioModel> users = new ArrayList<>();
		Mockito.when(repository.findAll()).thenReturn(usuarios);
		users = usuarioService.findAll();
		assertEquals(usuarios, users);
	}

	@Test
	public void test_Save_Should_Save_On_Repository() {
		Mockito.when(repository.save(usuario)).thenReturn(usuario);
		UsuarioModel usuariotest = usuarioService.save(usuario);
		assertEquals(usuario, usuariotest);
	}

	@Test
	public void test_Given_New_Credentials_Return_Updated_User() throws InvalidRequestException {
		LocalDateTime time = LocalDateTime.of(2023, 01, 01, 00, 00, 00);
		usuario.setNome("Michael");
		usuario.setEmail("michel@hotmail.com");
		usuario.setUsername("michel123");
		usuario.setLastModifiedDate(time);
		usuario.setLastModifiedBy(usuario);

		Mockito.when(repository.save(usuario)).thenReturn(usuario);

		UsuarioModel usuario2 = new UsuarioModel();
		usuario2.setId(1);
		usuario2.setNome("John");
		usuario2.setUsername("john123");
		usuario2.setEmail("john@example.com");
		usuario2.setPassword("password123");
		usuario2.setCreatedBy(usuario2);

		usuario2.setNome("Michael");
		usuario2.setEmail("michel@hotmail.com");
		usuario2.setUsername("michel123");
		usuario2.setLastModifiedDate(time);
		usuario2.setLastModifiedBy(usuario2);

		assertEquals(usuario, usuarioService.update(usuario2));
	}

	@Test
	public void test_Given_Correct_Id_Should_Delete_User_Data() {
		Mockito.when(repository.findById(1)).thenReturn(Optional.of(usuario));
		usuarioService.deleteById(1);
		Mockito.verify(repository).deleteById(1);
	}

	@Test
	public void test_Given_Incorrect_Id_Should_Not_Delete_User_Data() {
		Mockito.when(repository.findById(10)).thenReturn(Optional.of(usuario));
		usuarioService.deleteById(10);
		Mockito.verify(repository).deleteById(10);
	}

	@Test
	public void test_Given_Id_And_IdFromTheOneThatCreatedTheId_Return_True_If_Right() {
		Boolean right = true;
		Mockito.when(repository.existsByIdAndCreatedById(2, 1)).thenReturn(right);
		assertEquals(right, usuarioService.existsByIdAndCreatedById(2, 1));
	}

	@Test
	public void test_Given_Id_And_IdFromTheOneThatCreatedTheId_Return_False_If_Wrong() {
		Boolean right = false;
		Mockito.when(repository.existsByIdAndCreatedById(1, 2)).thenReturn(right);
		assertEquals(right, usuarioService.existsByIdAndCreatedById(1, 2));
	}

	@AfterEach
	public void tearDown() {
		usuario = null;
	}
}
