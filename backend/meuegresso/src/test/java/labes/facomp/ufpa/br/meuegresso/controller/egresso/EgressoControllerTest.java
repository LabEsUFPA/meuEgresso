package labes.facomp.ufpa.br.meuegresso.controller.egresso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDate;
import java.util.Set;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.util.ResourceUtils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import labes.facomp.ufpa.br.meuegresso.config.Configuracao;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationRequest;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationResponse;
import labes.facomp.ufpa.br.meuegresso.dto.contribuicao.ContribuicaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoCadastroDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.titulacao.TitulacaoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class EgressoControllerTest extends Configuracao {

        @Autowired
        private TitulacaoRepository titulacaoRepository;

        @Autowired
        private GeneroRepository generoRepository;

        @Autowired
        MockMvc mockMvc;        

        
        EgressoDTO egressoDTO;

        String token;

        UsuarioModel usuarioModel;

        GeneroModel genero;

        @Autowired
        PasswordEncoder encoder;

        @Autowired
        UsuarioRepository usuarioRepository;

        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        EgressoCadastroDTO egressoCadastro = new EgressoCadastroDTO();

        static final Integer EGRESSO_ID = 1;
        static final String EGRESSO_EMAIL = "teste@gmail.com";

        @BeforeAll
        void setUp() throws Exception {

                titulacaoRepository.save(TitulacaoModel.builder().nome("abc").build());
                titulacaoRepository.save(TitulacaoModel.builder().nome("123").build());
                final String plainPass = "teste123";
                final String USERNAME = "username_test";

                genero = new GeneroModel(43, "genero X");
                genero = generoRepository.save(genero);

                /* Usuario */
                usuarioModel = new UsuarioModel();
                usuarioModel.setUsername(USERNAME);
                usuarioModel.setNome("nome_test asdsad");
                usuarioModel.setEmail("teste@gmail.com");
                usuarioModel.setPassword(encoder.encode(plainPass));
                usuarioModel.setGrupos(Set.of(Grupos.ADMIN));
                usuarioModel.setEmailVerificado(true);
                usuarioModel.setAtivo(true);

                usuarioModel = usuarioRepository.save(usuarioModel);

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

                egressoCadastro.setNascimento(LocalDate.now());
                egressoCadastro.setGeneroId(EGRESSO_ID);
                egressoCadastro.setMatricula("123432312345");
                egressoCadastro.setNome("teste nome");
                egressoCadastro.setContribuicao(ContribuicaoDTO.builder().descricao("ljhfdakljdljdhs").build());
                egressoCadastro.setDepoimento(DepoimentoDTO.builder().descricao("sffsfsffd").build());

        }

        @Test
        @Order(1)
        void testCadastrarEgressoPrimeiroCadastro() throws Exception {

                MvcResult resposta = mockMvc.perform(
                                MockMvcRequestBuilders.post("/egresso")
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .content(objectMapper.writeValueAsString(egressoCadastro))
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isCreated()).andReturn();

                String resp = resposta.getResponse().getContentAsString();
                assertEquals(ResponseType.SUCCESS_SAVE.getMessage(), resp);
        }

        @Test
        @Order(2)
        void testGetEgresso() throws Exception {

                MvcResult resposta = mockMvc.perform(
                                MockMvcRequestBuilders.get("/egresso")
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                String resp = resposta.getResponse().getContentAsString();
                egressoDTO = objectMapper.readValue(resp, EgressoDTO.class);
                assertNotNull(egressoDTO);
        }

        @Test
        @Order(2)
        void testSaveFotoEgresso() throws IOException, Exception {

                Path path = ResourceUtils.getFile("classpath:image/imagem.jpeg").toPath();

                MockMultipartFile file = new MockMultipartFile("arquivo", "imagem.jpeg", "image/jpeg",
                                Files.readAllBytes(path));

                MvcResult resposta = mockMvc.perform(
                                MockMvcRequestBuilders.multipart("/egresso/foto")
                                                .file(file)
                                                .contentType(MediaType.MULTIPART_FORM_DATA_VALUE)
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isCreated()).andReturn();

                String resultado = resposta.getResponse().getContentAsString();

                assertEquals(resultado, ResponseType.SUCCESS_IMAGE_SAVE.getMessage());

        }

        @Test
        @Order(3)
        void testGetFotoEgresso() throws Exception {

                MvcResult resposta = mockMvc
                                .perform(MockMvcRequestBuilders.get("/publico/egresso/foto/" + egressoDTO.getId())
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                String resultado = resposta.getResponse().getContentAsString();
                assertNotNull(resultado);
        }

        @Test
        @Order(4)
        void testDeleteFotoEgresso() throws Exception {
                MvcResult resposta = mockMvc.perform(
                                MockMvcRequestBuilders.delete("/egresso/foto")
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                String resultado = resposta.getResponse().getContentAsString();

                assertEquals(resultado, ResponseType.SUCCESS_IMAGE_DELETE.getMessage());
        }
}
