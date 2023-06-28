package labes.facomp.ufpa.br.meuegresso.controller.titulacao;

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
import labes.facomp.ufpa.br.meuegresso.dto.titulacao.TitulacaoDTO;
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
class TitulacaoControllerTest {

	@Autowired
	MockMvc mockMvc;

	@Autowired
	UsuarioRepository usuarioRepository;

	String token;

	UsuarioModel usuarioModel;

	TitulacaoDTO titulacaoDTO;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	ModelMapper modelMapper;

	ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

	@BeforeAll
	void setUp() throws Exception {

		final String plainPass = "teste123";

		usuarioModel = new UsuarioModel();
		usuarioModel.setUsername("username");
		usuarioModel.setNome("nome test");
		usuarioModel.setEmail("teste@gmail.com");
		usuarioModel.setPassword(passwordEncoder.encode(plainPass));
		usuarioModel.setEmailVerificado(true);
		usuarioModel.setGrupos(Set.of(Grupos.ADMIN));
		usuarioModel.setAtivo(true);

		usuarioRepository.save(usuarioModel);

		AuthenticationRequest authenticationRequest = new AuthenticationRequest();
		authenticationRequest.setUsername(usuarioModel.getUsername());
		authenticationRequest.setPassword(plainPass);

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
	void testCadastrarTitulacao() throws Exception {

		titulacaoDTO = TitulacaoDTO.builder()
				.id(1)
				.nome("titulacaoteste")
				.build();

		MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.post("/titulacao")
				.contentType(MediaType.APPLICATION_JSON)
				.header("Authorization", "Bearer " + this.token)
				.content(objectMapper.writeValueAsString(titulacaoDTO)))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isCreated())
				.andReturn();

		String retornoString = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_SAVE.getMessage(), retornoString);
	}

	@Test
	@Order(2)
	void testBuscarTitulacaos() throws Exception {

		MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/titulacao")
				.contentType(MediaType.APPLICATION_JSON)
				.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk()).andReturn();
		List<TitulacaoDTO> titulacaosDTO = objectMapper.readValue(resposta.getResponse().getContentAsString(),
				new TypeReference<List<TitulacaoDTO>>() {
				});

		assertNotNull(titulacaosDTO);
		assertEquals(1, titulacaosDTO.size());
		assertEquals(titulacaoDTO.getId(), titulacaosDTO.get(0).getId());
	}

	@Test
	@Order(3)
	void testAtualizarTitulacao() throws Exception {

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.put("/titulacao")
						.contentType(MediaType.APPLICATION_JSON)
						.content(objectMapper.writeValueAsString(titulacaoDTO))
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isCreated())
				.andReturn();
		String retornoString = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_UPDATE.getMessage(), retornoString);
	}

	@Test
	@Order(4)
	void testdeletarTitulacao() throws Exception {

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.delete("/titulacao/" + titulacaoDTO.getId())
						.contentType(MediaType.APPLICATION_JSON)
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk())
				.andReturn();
		String resultado = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_DELETE.getMessage(), resultado);

	}
}
