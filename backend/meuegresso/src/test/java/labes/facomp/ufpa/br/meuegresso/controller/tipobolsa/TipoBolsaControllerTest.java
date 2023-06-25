package labes.facomp.ufpa.br.meuegresso.controller.tipobolsa;

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

import labes.facomp.ufpa.br.meuegresso.dto.administradores.tipobolsa.TipoBolsaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationRequest;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationResponse;
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

class TipoBolsaControllerTest {

	final String USERNAME = "username_test";

	UsuarioModel usuarioModel;

	@Autowired
	UsuarioRepository usuarioRepository;

	@Autowired
	PasswordEncoder passwordEncoder;

	TipoBolsaDTO tipoBolsaDTO;

	String token;

	@Autowired
	MockMvc mockMvc;

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

	}

	@Test
	@Order(1)
	void testCadastrarTipoBolsa() throws Exception {

		tipoBolsaDTO = new TipoBolsaDTO();
		tipoBolsaDTO.setNome("PIBIC");
		tipoBolsaDTO.setId(1);

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.post("/tipoBolsa")
						.contentType(MediaType.APPLICATION_JSON)
						.content(objectMapper.writeValueAsString(tipoBolsaDTO))
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isCreated()).andReturn();
		String retornoString = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_SAVE.getMessage(), retornoString);
	}

	@Test
	@Order(2)
	void testBuscarTipoBolsa() throws Exception {

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.get("/tipoBolsa")
						.contentType(MediaType.APPLICATION_JSON)
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk()).andReturn();

		List<TipoBolsaDTO> bolsas = objectMapper.readValue(resposta.getResponse().getContentAsString(),
				new TypeReference<List<TipoBolsaDTO>>() {
				});

		assertNotNull(tipoBolsaDTO);
		assertEquals(1, bolsas.size());
		assertEquals(tipoBolsaDTO.getId(), bolsas.get(0).getId());
	}

	@Test
	@Order(3)
	void testAtualizarTipoBolsa() throws Exception {

		final String NOVO_NOME = "PROEX";
		tipoBolsaDTO.setNome(NOVO_NOME);

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.put("/tipoBolsa")
						.contentType(MediaType.APPLICATION_JSON)
						.content(objectMapper.writeValueAsString(tipoBolsaDTO))
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isAccepted()).andReturn();

		String resp = resposta.getResponse().getContentAsString();
		assertEquals(resp, ResponseType.SUCCESS_UPDATE.getMessage());

	}

	@Test
	@Order(4)
	void testDeleteById() throws Exception {

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.delete("/tipoBolsa/" + tipoBolsaDTO.getId())
						.contentType(MediaType.APPLICATION_JSON)
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk())
				.andReturn();

		String resp = resposta.getResponse().getContentAsString();
		assertEquals(resp, ResponseType.SUCCESS_DELETE.getMessage());
	}
}
