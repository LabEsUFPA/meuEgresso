package labes.facomp.ufpa.br.meuegresso.controller.curso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationRequest;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationResponse;
import labes.facomp.ufpa.br.meuegresso.dto.curso.CursoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class CursoControllerTest {

	static final String NOME = "CursoTeste";
	final String USERNAME = "username_test";

	@Autowired
	MockMvc mockMvc;

	String token;

	UsuarioModel usuarioModel;

	CursoDTO cursoDTO;

	@Autowired
	UsuarioRepository usuarioRepository;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	ModelMapper modelMapper;

	ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

	@BeforeAll
	void setUp() throws Exception {

		usuarioModel = new UsuarioModel();
		usuarioModel.setUsername(USERNAME);
		usuarioModel.setNome("nome test");
		usuarioModel.setEmail("teste@gmail.com");
		usuarioModel.setGrupos(Set.of(Grupos.ADMIN));

		final String plainTextPassword = "teste123";
		final String encodedPassword = passwordEncoder.encode(plainTextPassword);

		usuarioModel.setPassword(encodedPassword);
		usuarioRepository.save(usuarioModel);

		AuthenticationRequest authenticationRequest = new AuthenticationRequest();
		authenticationRequest.setUsername(usuarioModel.getUsername());
		authenticationRequest.setPassword(plainTextPassword);

		String objectJson = objectMapper.writeValueAsString(authenticationRequest);

		MvcResult resultado = mockMvc.perform(MockMvcRequestBuilders.post("/auth/login")
				.contentType(MediaType.APPLICATION_JSON)
				.content(objectJson))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk())
				.andReturn();

		AuthenticationResponse authenticationResponse = objectMapper.readValue(
				resultado.getResponse().getContentAsString(), AuthenticationResponse.class);
		this.token = authenticationResponse.getToken();

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.get("/usuario")
						.contentType(MediaType.APPLICATION_JSON)
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk()).andReturn();

		UsuarioAuthDTO usuarioAuthDTO = objectMapper.readValue(resposta.getResponse().getContentAsString(),
				UsuarioAuthDTO.class);

		usuarioModel.setId(usuarioAuthDTO.getId());

	}

	@Test
	@Order(1)
	void testCadastrarCurso() throws Exception {

		cursoDTO = CursoDTO.builder()
				.nome(NOME)
				.build();

		MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.post("/curso")
				.contentType(MediaType.APPLICATION_JSON)
				.header("Authorization", "Bearer " + this.token)
				.content(objectMapper.writeValueAsString(cursoDTO)))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isCreated())
				.andReturn();

		String retornoString = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_SAVE.getMessage(), retornoString);
	}

	@Test
	@Order(2)
	void testFindById() throws Exception {

		MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/curso/" + 1)
				.contentType(MediaType.APPLICATION_JSON)
				.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk()).andReturn();

		cursoDTO = objectMapper.readValue(resposta.getResponse().getContentAsString(),
				CursoDTO.class);

		assertEquals(NOME, cursoDTO.getNome());

	}

	@Test
	@Order(3)
	void testConsultarCursos() throws Exception {

		MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/curso")
				.contentType(MediaType.APPLICATION_JSON)
				.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk()).andReturn();
		List<CursoDTO> cursosDTO = objectMapper.readValue(resposta.getResponse().getContentAsString(),
				new TypeReference<List<CursoDTO>>() {
				});

		assertNotNull(cursosDTO);
		assertEquals(1, cursosDTO.size());
        assertEquals(cursoDTO, cursosDTO.get(0));

	}

	@Test
	@Order(4)
	void testAtualizarCurso() throws Exception {

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.put("/curso")
						.contentType(MediaType.APPLICATION_JSON)
						.content(objectMapper.writeValueAsString(cursoDTO))
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isCreated())
				.andReturn();

		String retornoString = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_UPDATE.getMessage(), retornoString);
	}

	@Test
	@Order(5)
	void testDeleteById() throws Exception {

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.delete("/curso/" + cursoDTO.getId())
						.contentType(MediaType.APPLICATION_JSON)
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk())
				.andReturn();
		String resultado = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_DELETE.getMessage(), resultado);

	}
}
