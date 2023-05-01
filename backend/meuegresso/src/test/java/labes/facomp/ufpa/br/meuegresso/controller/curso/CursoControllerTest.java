package labes.facomp.ufpa.br.meuegresso.controller.curso;

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
import labes.facomp.ufpa.br.meuegresso.dto.curso.CursoDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.grupo.GrupoRepository;
import labes.facomp.ufpa.br.meuegresso.service.curso.CursoService;

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class CursoControllerTest {

        static final String NOME = "CursoTeste";
        final String USERNAME = "username_test";

        @Autowired
        private GrupoRepository grupoRepository;

        @Autowired
        private CursoService cursoService;

        @Autowired
        MockMvc mockMvc;

        String token;

        UsuarioModel usuarioModel;

        CursoModel cursoModel;

        CursoModel cursoModel2;

        CursoDTO cursoDTO;

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

                cursoModel = CursoModel.builder()
                                .nome(NOME)
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
                
                cursoModel = cursoService.save(cursoModel);
        }


        @Test
        void testCadastrarCurso() throws Exception {

                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.post("/curso")
                                .contentType(MediaType.APPLICATION_JSON)
                                .header("Authorization", "Bearer " + this.token)
                                .content(objectMapper.writeValueAsString(cursoModel)))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isCreated())
                                .andReturn();

                String retornoString = resposta.getResponse().getContentAsString();
                assertEquals(ResponseType.SUCESS_SAVE.getMessage(), retornoString);
        }

        @Test
        void testFindById() throws Exception {

                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/curso/" + cursoModel.getId())
                                .contentType(MediaType.APPLICATION_JSON)
                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();
                CursoDTO cursoDTO = objectMapper.readValue(resposta.getResponse().getContentAsString(),
                                CursoDTO.class);
                cursoModel.setId(cursoDTO.getId());
                assertEquals(NOME, cursoDTO.getNome());
        }

        @Test
        void testConsultarCursos() throws Exception {

                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/curso")
                                .contentType(MediaType.APPLICATION_JSON)
                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();
                List<CursoDTO> cursosDTO = objectMapper.readValue(resposta.getResponse().getContentAsString(),
                                new TypeReference<List<CursoDTO>>() {
                                });

                List<CursoDTO> cursosDTO2 = modelMapper.map(cursoService.findAll(),
                                new TypeReference<List<CursoDTO>>() {
                                }.getType());
                assertEquals(cursosDTO2, cursosDTO);

        }

        @Test
        void testAtualizarCurso() throws Exception {

                ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

                CursoDTO cursoDTO = modelMapper.map(cursoModel, CursoDTO.class);

                MvcResult resposta = mockMvc.perform(
                                MockMvcRequestBuilders.put("/curso")
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .content(objectMapper.writeValueAsString(cursoDTO))
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
                                MockMvcRequestBuilders.delete("/curso/" + cursoModel.getId())
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk())
                                .andReturn();
                String resultado = resposta.getResponse().getContentAsString();
                assertEquals(ResponseType.SUCESS_DELETE.getMessage(), resultado);

        }
}
