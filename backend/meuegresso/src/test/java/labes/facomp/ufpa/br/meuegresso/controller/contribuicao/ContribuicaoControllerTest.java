package labes.facomp.ufpa.br.meuegresso.controller.contribuicao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
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
import labes.facomp.ufpa.br.meuegresso.dto.contribuicao.ContribuicaoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.grupo.GrupoRepository;
import labes.facomp.ufpa.br.meuegresso.service.contribuicao.ContribuicaoService;

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class ContribuicaoControllerTest {

        static final String DESCRICAO = "ContribuicaoTeste";
        final String USERNAME = "username_test";

        @Autowired
        private GrupoRepository grupoRepository;

        @Autowired
        private ContribuicaoService contribuicaoService;

        @Autowired
        MockMvc mockMvc;

        String token;

        UsuarioModel usuarioModel;

        ContribuicaoModel contribuicaoModel;

        ContribuicaoModel contribuicaoModel2;

        ContribuicaoDTO contribuicaoDTO;

        @Autowired
        ModelMapper modelMapper;

        @BeforeAll
        void setUp() throws Exception {
                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();
                GrupoModel grupoModel = new GrupoModel();
                grupoModel.setNomeGrupo("ADMIN");

                grupoModel = grupoRepository.save(grupoModel);

                Set<GrupoModel> grupos = new HashSet<>();
                grupos.add(grupoModel);

                contribuicaoModel = ContribuicaoModel.builder()
                                .descricao(DESCRICAO)
                                .build();

                usuarioModel = new UsuarioModel();
                usuarioModel.setUsername(USERNAME);
                usuarioModel.setNome("nome_test");
                usuarioModel.setEmail("teste@gmail.com");
                usuarioModel.setPassword("teste123");
                usuarioModel.setGrupos(grupos);

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

                contribuicaoModel = contribuicaoService.save(contribuicaoModel);
        }

        @Test
        void testCadastrarContribuicao() throws Exception {

                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.post("/contribuicao")
                                .contentType(MediaType.APPLICATION_JSON)
                                .header("Authorization", "Bearer " + this.token)
                                .content(objectMapper.writeValueAsString(contribuicaoModel)))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isCreated())
                                .andReturn();

                String retornoString = resposta.getResponse().getContentAsString();
                assertEquals(ResponseType.SUCESS_SAVE.getMessage(), retornoString);
        }

        @Test
        void testFindById() throws Exception {

                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

                MvcResult resposta = mockMvc
                                .perform(MockMvcRequestBuilders.get("/contribuicao/" + contribuicaoModel.getId())
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();
                ContribuicaoDTO contribuicaoDTO = objectMapper.readValue(resposta.getResponse().getContentAsString(),
                                ContribuicaoDTO.class);
                contribuicaoModel.setId(contribuicaoDTO.getId());
                assertEquals(DESCRICAO, contribuicaoDTO.getDescricao());
        }

        @Test
        void testConsultarContribuicaos() throws Exception {

                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/contribuicao")
                                .contentType(MediaType.APPLICATION_JSON)
                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();
                                
                List<ContribuicaoDTO> contribuicaosDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                new TypeReference<List<ContribuicaoDTO>>() {
                                });

                List<ContribuicaoDTO> contribuicaosDTO2 = modelMapper.map(contribuicaoService.findAll(),
                                new TypeReference<List<ContribuicaoDTO>>() {
                                }.getType());
                assertEquals(contribuicaosDTO2, contribuicaosDTO);

        }

        @Test
        void testAtualizarContribuicao() throws Exception {

                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

                ContribuicaoDTO contribuicaoDTO = modelMapper.map(contribuicaoModel, ContribuicaoDTO.class);

                MvcResult resposta = mockMvc.perform(
                                MockMvcRequestBuilders.put("/contribuicao")
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .content(objectMapper.writeValueAsString(contribuicaoDTO))
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isCreated())
                                .andReturn();
                String retornoString = resposta.getResponse().getContentAsString();
                assertEquals(ResponseType.SUCESS_UPDATE.getMessage(), retornoString);
        }

        @Test
        void testDeleteById() throws Exception {

                MvcResult resposta = mockMvc.perform(
                                MockMvcRequestBuilders.delete("/contribuicao/" + contribuicaoModel.getId())
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk())
                                .andReturn();
                String resultado = resposta.getResponse().getContentAsString();
                assertEquals(ResponseType.SUCESS_DELETE.getMessage(), resultado);

        }
}
