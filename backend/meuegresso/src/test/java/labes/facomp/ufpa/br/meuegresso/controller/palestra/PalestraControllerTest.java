package labes.facomp.ufpa.br.meuegresso.controller.palestra;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.time.LocalDate;
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
import labes.facomp.ufpa.br.meuegresso.dto.palestra.PalestraDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import labes.facomp.ufpa.br.meuegresso.service.genero.GeneroService;

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class PalestraControllerTest {

	static final String DESCRICAO = "palestraTeste";
	final String USERNAME = "username_test";

	@Autowired
	private EgressoService egressoService;

	@Autowired
	private GeneroService generoService;

	@Autowired
	MockMvc mockMvc;

	String token;

	UsuarioModel usuarioModel;

	@Autowired
	UsuarioRepository usuarioRepository;

	@Autowired
	PasswordEncoder passwordEncoder;

	EgressoModel egressoModel;

	PalestraDTO palestraDTO;

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

		GeneroModel genero = GeneroModel.builder()
				.nome("GeneroTeste")
				.build();

		genero = generoService.save(genero);

		egressoModel = EgressoModel.builder()
				.nascimento(LocalDate.parse("2000-05-05"))
				.genero(genero)
				.matricula("202004940020")
				.usuario(usuarioModel)
				.build();

		egressoModel = egressoService.adicionarEgresso(egressoModel);
	}

	@Test
	@Order(1)
	void testCadastrarPalestra() throws Exception {

		palestraDTO = PalestraDTO.builder()
				.descricao(DESCRICAO)
				.egressoId(egressoModel.getId())
				.build();

		MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.post("/palestra")
				.contentType(MediaType.APPLICATION_JSON)
				.content(objectMapper.writeValueAsString(palestraDTO))
				.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isCreated())
				.andReturn();

		String retornoString = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_SAVE.getMessage(), retornoString);
	}

	@Test
	@Order(2)
	void testFindById() throws Exception {

		MvcResult resposta = mockMvc
				.perform(MockMvcRequestBuilders.get("/palestra/" + 1)
						.contentType(MediaType.APPLICATION_JSON)
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk()).andReturn();

		palestraDTO = objectMapper.readValue(resposta.getResponse().getContentAsString(),
				PalestraDTO.class);
		assertEquals(DESCRICAO, palestraDTO.getDescricao());
	}

	@Test
	@Order(3)
	void testConsultarpalestras() throws Exception {

		MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/palestra")
				.contentType(MediaType.APPLICATION_JSON)
				.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk()).andReturn();

		List<PalestraDTO> palestrasDTO = objectMapper.readValue(resposta.getResponse().getContentAsString(),
				new TypeReference<List<PalestraDTO>>() {
				});

		assertNotNull(palestrasDTO);

	}

	@Test
	@Order(4)
	void testAtualizarpalestra() throws Exception {

		MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.put("/palestra")
						.contentType(MediaType.APPLICATION_JSON)
						.content(objectMapper.writeValueAsString(palestraDTO))
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
				MockMvcRequestBuilders.delete("/palestra/" + palestraDTO.getId())
						.contentType(MediaType.APPLICATION_JSON)
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk())
				.andReturn();
		String resultado = resposta.getResponse().getContentAsString();
		assertEquals(ResponseType.SUCCESS_DELETE.getMessage(), resultado);

	}
}
