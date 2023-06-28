package labes.facomp.ufpa.br.meuegresso.controller.faixasalarial;

import static org.junit.jupiter.api.Assertions.assertEquals;
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
import labes.facomp.ufpa.br.meuegresso.dto.faixasalarial.FaixaSalarialDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;
import labes.facomp.ufpa.br.meuegresso.service.faixasalarial.FaixaSalarialService;

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class FaixaSalarialControllerTest {

	static final String FAIXA = "2000-3000";
	final String USERNAME = "username_test";

	@Autowired
	private FaixaSalarialService faixaSalarialService;

	@Autowired
	MockMvc mockMvc;

	String token;

	UsuarioModel usuarioModel;

	@Autowired
	UsuarioRepository usuarioRepository;

	@Autowired
	PasswordEncoder passwordEncoder;

	FaixaSalarialModel faixaSalarialModel;

	FaixaSalarialModel faixaSalarialModel2;

	FaixaSalarialDTO faixaSalarialDTO;

	@Autowired
	ModelMapper modelMapper;

	ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

	@BeforeAll
	void setUp() throws Exception {

		faixaSalarialModel = FaixaSalarialModel.builder()
				.faixa(FAIXA)
				.build();

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
		faixaSalarialModel.setCreatedBy(usuarioModel.getId());
		faixaSalarialModel = faixaSalarialService.save(faixaSalarialModel);
	}

	@Test
	@Order(1)
	void testCadastrarFaixaSalarial() throws Exception {

		MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.post("/faixaSalarial")
				.contentType(MediaType.APPLICATION_JSON)
				.header("Authorization", "Bearer " + this.token)
				.content(objectMapper.writeValueAsString(faixaSalarialModel)))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isCreated())
				.andReturn();

		String retornoString = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_SAVE.getMessage(), retornoString);
	}

	@Test
	@Order(2)
	void testConsultarFaixaSalarials() throws Exception {

		MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/faixaSalarial")
				.contentType(MediaType.APPLICATION_JSON)
				.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk()).andReturn();
		List<FaixaSalarialDTO> faixaSalarialsDTO = objectMapper.readValue(
				resposta.getResponse().getContentAsString(),
				new TypeReference<List<FaixaSalarialDTO>>() {
				});

		List<FaixaSalarialDTO> faixaSalarialsDTO2 = modelMapper.map(faixaSalarialService.findAll(),
				new TypeReference<List<FaixaSalarialDTO>>() {
				}.getType());
		assertEquals(faixaSalarialsDTO2, faixaSalarialsDTO);

	}

	@Test
	@Order(3)
	void testAtualizarFaixaSalarial() throws Exception {
		//TODO: consertar teste
		FaixaSalarialDTO faixaSalarialDTO = modelMapper.map(faixaSalarialModel, FaixaSalarialDTO.class);

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.put("/faixaSalarial")
						.contentType(MediaType.APPLICATION_JSON)
						.content(objectMapper.writeValueAsString(faixaSalarialDTO))
						.header("Authorization", "Bearer " + this.token))
						.andDo(MockMvcResultHandlers.print())
						.andExpect(status().isCreated())
						.andReturn();
		String retornoString = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_UPDATE.getMessage(), retornoString);
	}

	@Test
	@Order(4)
	void testDeleteById() throws Exception {
		FaixaSalarialDTO faixaSalarialDTO = modelMapper.map(faixaSalarialModel, FaixaSalarialDTO.class);

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.delete("/faixaSalarial")
						.contentType(MediaType.APPLICATION_JSON)
						.content(objectMapper.writeValueAsString(faixaSalarialDTO))
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk())
				.andReturn();
		String resultado = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_DELETE.getMessage(), resultado);

	}
}
