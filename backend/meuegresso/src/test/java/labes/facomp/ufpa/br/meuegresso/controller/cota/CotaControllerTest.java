package labes.facomp.ufpa.br.meuegresso.controller.cota;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.HashSet;
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

import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationRequest;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationResponse;
import labes.facomp.ufpa.br.meuegresso.dto.cota.CotaDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.grupo.GrupoRepository;

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
public class CotaControllerTest {

    UsuarioModel usuarioModel;

    CotaDTO cotaDTO;

    @Autowired
    private GrupoRepository grupoRepository;

    String token;

    @Autowired
    MockMvc mockMvc;

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

        usuarioModel = new UsuarioModel();
        usuarioModel.setUsername("username_test");
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

    }

    @Test
    @Order(1)
    void testCadastrarCota() throws Exception {
        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        CotaDTO cotaDTO = new CotaDTO();
        cotaDTO.setNome("cota1");
        cotaDTO.setId(1);

        MvcResult resposta = mockMvc.perform(
            MockMvcRequestBuilders.post("/cota")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(cotaDTO))
                        .header("Authorization", "Bearer " + this.token))
                        .andDo(MockMvcResultHandlers.print())
                        .andExpect(status().isCreated()).andReturn();
        String retornoString = resposta.getResponse().getContentAsString();
        assertEquals(ResponseType.SUCESS_SAVE.getMessage(), retornoString);
    }

    @Test
    @Order(2)
    void testBuscarCotas() throws Exception{
        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();


        MvcResult resposta = mockMvc.perform(
                MockMvcRequestBuilders.get("/cota")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header("Authorization", "Bearer " + this.token))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isOk()).andReturn();

        List<CotaDTO> cotas = objectMapper.readValue(resposta.getResponse().getContentAsString(),
                new TypeReference<List<CotaDTO>>() {
                });

        cotaDTO = cotas.get(0);
        assertNotNull(cotaDTO);
    }

    @Test
    @Order(3)
    void testAtualizarCota() throws Exception{
        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        final String NOVO_NOME = "cota2222";
        cotaDTO.setNome(NOVO_NOME);

        MvcResult resposta = mockMvc.perform(
                MockMvcRequestBuilders.put("/cota")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(cotaDTO))
                        .header("Authorization", "Bearer " + this.token))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isAccepted()).andReturn();

        String resp = resposta.getResponse().getContentAsString();
        assertEquals(ResponseType.SUCESS_UPDATE.getMessage(), resp);

    }

    @Test
    @Order(4)
    void testDeletarCota() throws Exception{
        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        MvcResult resposta = mockMvc.perform(
                MockMvcRequestBuilders.delete("/cota")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(
                                cotaDTO))
                        .header("Authorization", "Bearer " + this.token))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isOk()).andReturn();

        String res = resposta.getResponse().getContentAsString();
        assertEquals(res, ResponseType.SUCESS_DELETE.getMessage());
    }
}
