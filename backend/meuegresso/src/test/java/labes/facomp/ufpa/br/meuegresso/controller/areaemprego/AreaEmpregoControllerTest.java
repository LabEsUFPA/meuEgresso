package labes.facomp.ufpa.br.meuegresso.controller.areaemprego;

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

import labes.facomp.ufpa.br.meuegresso.dto.areaemprego.AreaEmpregoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationRequest;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationResponse;
import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class AreaEmpregoControllerTest {

	@Autowired
	MockMvc mockMvc;

	String token;

	@Autowired
	ModelMapper modelMapper;

	ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

	AreaEmpregoDTO areaEmprego;

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
	void testCadastrarAreaEmprego() throws Exception {
		areaEmprego = new AreaEmpregoDTO(null, "AAAAAA");

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.post("/areaemprego")
						.contentType(MediaType.APPLICATION_JSON)
						.content(objectMapper.writeValueAsString(areaEmprego))
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isCreated()).andReturn();

		String resp = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_SAVE.getMessage(), resp);
	}

	@Test
	@Order(2)
	void testBuscarAreaEmpregos() throws Exception {

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.get("/areaemprego")
						.contentType(MediaType.APPLICATION_JSON)
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk()).andReturn();

		List<AreaEmpregoDTO> areaempregos = objectMapper.readValue(resposta.getResponse().getContentAsString(),
				new TypeReference<List<AreaEmpregoDTO>>() {
				});
		areaEmprego = areaempregos.get(0);
		assertNotNull(areaempregos);
	}

	@Test
	@Order(3)
	void testAtualizarAreaEmprego() throws Exception {
		final String NOVO_NOME = "BBBBBBBBBBBBBBBBBB";
		areaEmprego.setNome(NOVO_NOME);

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.put("/areaemprego")
						.contentType(MediaType.APPLICATION_JSON)
						.content(objectMapper.writeValueAsString(areaEmprego))
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isAccepted()).andReturn();

		String resp = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_UPDATE.getMessage(), resp);

	}

	@Test
	@Order(4)
	void testDeletarAreaEmprego() throws Exception {

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.delete("/areaemprego")
						.contentType(MediaType.APPLICATION_JSON)
						.content(objectMapper.writeValueAsString(areaEmprego))
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk()).andReturn();

		String res = resposta.getResponse().getContentAsString();
		assertEquals(res, ResponseType.SUCCESS_DELETE.getMessage());

	}

}