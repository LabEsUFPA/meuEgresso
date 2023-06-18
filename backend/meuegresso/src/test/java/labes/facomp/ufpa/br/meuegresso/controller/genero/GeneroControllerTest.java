package labes.facomp.ufpa.br.meuegresso.controller.genero;

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
import labes.facomp.ufpa.br.meuegresso.dto.genero.GeneroDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class GeneroControllerTest {

	@Autowired
	MockMvc mockMvc;

	String token;

	@Autowired
	ModelMapper modelMapper;

	ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

	GeneroDTO genero;

	@BeforeAll
	void setUp() throws Exception {

		UsuarioModel usuarioModel = new UsuarioModel();
		usuarioModel.setUsername("username");
		usuarioModel.setNome("nome_test");
		usuarioModel.setEmail("teste@gmail.com");
		usuarioModel.setPassword("teste123");
		usuarioModel.setGrupos(Set.of(Grupos.ADMIN));
		mockMvc.perform(MockMvcRequestBuilders.post("/auth/register")
				.contentType(MediaType.APPLICATION_JSON)
				.content(objectMapper.writeValueAsString(usuarioModel)))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isCreated())
				.andReturn();

		AuthenticationRequest authenticationRequest = new AuthenticationRequest();
		authenticationRequest.setUsername(usuarioModel.getUsername());
		authenticationRequest.setPassword(usuarioModel.getPassword());
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

	}

	@Test
	@Order(1)
	void testCadastrarGenero() throws Exception {
		genero = new GeneroDTO(null, "AAAAAA");

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.post("/genero")
						.contentType(MediaType.APPLICATION_JSON)
						.content(objectMapper.writeValueAsString(genero))
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isCreated()).andReturn();

		String resp = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_SAVE.getMessage(), resp);
	}

	@Test
	@Order(2)
	void testBuscarGeneros() throws Exception {

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.get("/genero")
						.contentType(MediaType.APPLICATION_JSON)
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk()).andReturn();

		List<GeneroDTO> generos = objectMapper.readValue(resposta.getResponse().getContentAsString(),
				new TypeReference<List<GeneroDTO>>() {
				});
		genero = generos.get(0);
		assertNotNull(generos);
	}

	@Test
	@Order(3)
	void testAtualizarGenero() throws Exception {
		final String NOVO_NOME = "BBBBBBBBBBBBBBBBBB";
		genero.setNome(NOVO_NOME);

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.put("/genero")
						.contentType(MediaType.APPLICATION_JSON)
						.content(objectMapper.writeValueAsString(genero))
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isAccepted()).andReturn();

		String resp = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_UPDATE.getMessage(), resp);

	}

	@Test
	@Order(4)
	void testDeletarGenero() throws Exception {

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.delete("/genero")
						.contentType(MediaType.APPLICATION_JSON)
						.content(objectMapper.writeValueAsString(genero))
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk()).andReturn();

		String res = resposta.getResponse().getContentAsString();
		assertEquals(res, ResponseType.SUCCESS_DELETE.getMessage());

	}

}
