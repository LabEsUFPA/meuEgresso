package labes.facomp.ufpa.br.meuegresso.controller.anuncio;

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

import labes.facomp.ufpa.br.meuegresso.config.Configuracao;
import labes.facomp.ufpa.br.meuegresso.dto.anuncio.AnuncioDTO;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationRequest;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationResponse;
import labes.facomp.ufpa.br.meuegresso.dto.page.PageDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;
import labes.facomp.ufpa.br.meuegresso.model.AreaEmpregoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.areaemprego.AreaEmpregoRepository;

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class AnuncioControllerTest extends Configuracao {

        final String USERNAME = "username_test";

        final String ANUNCIO_TITULO = "Vagas pra burros";
        final String ANUNCIO_SAL = "3000.00";
        final LocalDate ANUNCIO_EXPIRACAO = LocalDate.parse("2050-12-12");
        final String ANUNCIO_DESC = "descrição test";
        final String ANUNCIO_LINK = "http://test.com/test";

        final Integer AREA_EMPREGO_ID = 1;
        final String AREA_EMPREGO_NOME = "Engenharia de Software";

        @Autowired
        private AreaEmpregoRepository areaEmpregoRepository;

        @Autowired
        MockMvc mockMvc;

        String token;

        UsuarioModel usuarioModel;

        @Autowired
        ModelMapper modelMapper;

        AnuncioModel anuncioModel;
        AnuncioModel anuncioModel2;

        AreaEmpregoModel areaEmprego;

        @BeforeAll
        void setUp() throws Exception {

                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

                /* Usuario */
                usuarioModel = new UsuarioModel();
                usuarioModel.setUsername(USERNAME);
                usuarioModel.setNome("nome_test asdsad");
                usuarioModel.setEmail("teste@gmail.com");
                usuarioModel.setPassword("teste123");
                usuarioModel.setGrupos(Set.of(Grupos.ADMIN));
                mockMvc.perform(MockMvcRequestBuilders.post("/auth/register")
                                .contentType(MediaType.APPLICATION_JSON)
                                .header("Host", "localhost:15000")
                                .content(objectMapper.writeValueAsString(usuarioModel)))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isCreated())
                                .andReturn();

                /* Area Emprego */
                areaEmprego = new AreaEmpregoModel();
                areaEmprego.setId(AREA_EMPREGO_ID);
                areaEmprego.setNome(AREA_EMPREGO_NOME);
                areaEmpregoRepository.save(areaEmprego);

                /* Anuncio 1 */
                anuncioModel = new AnuncioModel();
                anuncioModel.setId(1);
                anuncioModel.setTitulo(ANUNCIO_TITULO);
                anuncioModel.setAreaEmprego(areaEmprego);
                anuncioModel.setDataExpiracao(ANUNCIO_EXPIRACAO);
                anuncioModel.setSalario(ANUNCIO_SAL);
                anuncioModel.setDescricao(ANUNCIO_DESC);
                anuncioModel.setLink(ANUNCIO_LINK);

                /* Anuncio 2 */
                anuncioModel2 = new AnuncioModel();
                anuncioModel.setId(2);
                anuncioModel2.setTitulo("anuncio_test2");
                anuncioModel2.setAreaEmprego(areaEmprego);
                anuncioModel2.setDataExpiracao(ANUNCIO_EXPIRACAO);
                anuncioModel2.setSalario("55000");
                anuncioModel2.setDescricao(ANUNCIO_DESC);
                anuncioModel2.setLink(ANUNCIO_LINK);

                /* Authentication */
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

        @Order(1)
        @Test
        void testCadastrarAnuncio() throws Exception {
                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

                AnuncioDTO anuncioDTO = modelMapper.map(anuncioModel, AnuncioDTO.class);
                AnuncioDTO anuncioDTO2 = modelMapper.map(anuncioModel2, AnuncioDTO.class);

                /* Cadastro 1 */
                MvcResult resposta = mockMvc.perform(
                                MockMvcRequestBuilders.post("/anuncio")
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .content(objectMapper.writeValueAsString(anuncioDTO))
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isCreated()).andReturn();
                String retornoString = resposta.getResponse().getContentAsString();

                /* Cadastro 2 */
                MvcResult resposta2 = mockMvc.perform(
                                MockMvcRequestBuilders.post("/anuncio")
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .content(objectMapper.writeValueAsString(anuncioDTO2))
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isCreated()).andReturn();
                String retornoString2 = resposta2.getResponse().getContentAsString();

                assertEquals(ResponseType.SUCCESS_SAVE.getMessage(), retornoString);
                assertEquals(ResponseType.SUCCESS_SAVE.getMessage(), retornoString2);
        }

        @Order(2)
        @Test
        void testConsultarAnuncios() throws Exception {
                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

                MvcResult resposta = mockMvc.perform(
                                MockMvcRequestBuilders.get("/anuncio")
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                List<AnuncioDTO> anuncios = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(), new TypeReference<PageDTO<AnuncioDTO>>() {
                                }).getContent();

                assertNotNull(anuncios);
                assertEquals(2, anuncios.size());
        }

        @Order(3)
        @Test
        void testAtualizarAnuncio() throws Exception {
                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

                AnuncioDTO anuncioDTO = modelMapper.map(anuncioModel, AnuncioDTO.class);

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.put("/anuncio")
                                .contentType(MediaType.APPLICATION_JSON)
                                .header("Authorization", "Bearer " + this.token)
                                .content(objectMapper.writeValueAsString(anuncioDTO)))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isCreated())
                                .andReturn();
                String retornoString = resposta.getResponse().getContentAsString();
                assertEquals(ResponseType.SUCCESS_UPDATE.getMessage(), retornoString);

        }

        @Order(4)
        @Test
        void testFiltrarAnuncios() throws Exception {
                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

                MvcResult resposta = mockMvc.perform(
                                MockMvcRequestBuilders.get("/anuncio/busca")
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .param("titulo", ANUNCIO_TITULO)
                                                .param("areaEmprego", "1")
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                List<AnuncioDTO> anuncios = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(), new TypeReference<PageDTO<AnuncioDTO>>() {
                                }).getContent();

                assertNotNull(anuncios);
                assertEquals(2, anuncios.size());
                assertEquals(ANUNCIO_TITULO, anuncios.get(0).getTitulo());
                assertEquals(1, anuncios.get(0).getAreaEmprego().getId());
        }

        @Order(5)
        @Test
        void findByTitulo() throws Exception {
                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

                MvcResult resposta = mockMvc.perform(
                                MockMvcRequestBuilders.get("/anuncio/busca")
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .param("titulo", ANUNCIO_TITULO.toUpperCase())
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                List<AnuncioDTO> anuncios = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(), new TypeReference<PageDTO<AnuncioDTO>>() {
                                }).getContent();

                assertNotNull(anuncios);
                assertEquals(2, anuncios.size());
                assertEquals(ANUNCIO_TITULO, anuncios.get(0).getTitulo());
        }

        @Order(6)
        @Test
        void findByAreaEmprego() throws Exception {
                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

                MvcResult resposta = mockMvc.perform(
                                MockMvcRequestBuilders.get("/anuncio/busca")
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .param("areaEmprego", "1")
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                List<AnuncioDTO> anuncios = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(), new TypeReference<PageDTO<AnuncioDTO>>() {
                                }).getContent();

                assertNotNull(anuncios);
                assertEquals(2, anuncios.size());
                assertEquals(1, anuncios.get(0).getAreaEmprego().getId());
        }

}
