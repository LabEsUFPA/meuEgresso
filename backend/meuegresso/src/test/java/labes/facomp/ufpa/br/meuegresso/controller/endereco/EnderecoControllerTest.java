package labes.facomp.ufpa.br.meuegresso.controller.endereco;

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
import labes.facomp.ufpa.br.meuegresso.dto.endereco.EnderecoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

// TODO ARRUMAR

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class EnderecoControllerTest {

        static final String CIDADE = "CidadeTeste";
        static final String ESTADO = "EstadoTeste";
        static final String PAIS = "PaisTeste";
        final String USERNAME = "username_test";

        @Autowired
        MockMvc mockMvc;

        String token;

        UsuarioModel usuarioModel;

        @Autowired
        UsuarioRepository usuarioRepository;

        @Autowired
        PasswordEncoder passwordEncoder;

        EnderecoDTO enderecoDTO;

        @Autowired
        ModelMapper modelMapper;

        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        @BeforeAll
        void setUp() throws Exception {

                usuarioModel = new UsuarioModel();
		usuarioModel.setUsername(USERNAME);
		usuarioModel.setNome("nome_test");
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
        void testCadastrarEndereco() throws Exception {

                enderecoDTO = EnderecoDTO.builder()
                                .cidade(CIDADE)
                                .estado(ESTADO)
                                .pais(PAIS)
                                .build();

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.post("/endereco")
                                .contentType(MediaType.APPLICATION_JSON)
                                .header("Authorization", "Bearer " + this.token)
                                .content(objectMapper.writeValueAsString(enderecoDTO)))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isCreated())
                                .andReturn();

                String retornoString = resposta.getResponse().getContentAsString();
                assertEquals(ResponseType.SUCCESS_SAVE.getMessage(), retornoString);
        }

        @Test
        @Order(2)
        void testFindById() throws Exception {

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/endereco/" + 1)
                                .contentType(MediaType.APPLICATION_JSON)
                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                enderecoDTO = objectMapper.readValue(resposta.getResponse().getContentAsString(),
                                EnderecoDTO.class);

                assertEquals(CIDADE, enderecoDTO.getCidade());
                assertEquals(ESTADO, enderecoDTO.getEstado());
                assertEquals(PAIS, enderecoDTO.getPais());
        }

        @Test
        @Order(3)
        void testConsultarEnderecos() throws Exception {

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/endereco")
                                .contentType(MediaType.APPLICATION_JSON)
                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();
                List<EnderecoDTO> enderecosDTO = objectMapper.readValue(resposta.getResponse().getContentAsString(),
                                new TypeReference<List<EnderecoDTO>>() {
                                });

                assertNotNull(enderecosDTO);

        }

        @Test
        @Order(4)
        void testAtualizarEndereco() throws Exception {

                MvcResult resposta = mockMvc.perform(
                                MockMvcRequestBuilders.put("/endereco")
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .content(objectMapper.writeValueAsString(enderecoDTO))
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
                                MockMvcRequestBuilders.delete("/endereco/" + enderecoDTO.getId())
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk())
                                .andReturn();
                String resultado = resposta.getResponse().getContentAsString();
                assertEquals(ResponseType.SUCCESS_DELETE.getMessage(), resultado);

        }
}
