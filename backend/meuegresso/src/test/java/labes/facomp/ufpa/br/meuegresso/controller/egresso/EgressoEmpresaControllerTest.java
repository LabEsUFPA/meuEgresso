package labes.facomp.ufpa.br.meuegresso.controller.egresso;

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
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoEmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoPublicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.faixasalarial.FaixaSalarialDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.grupo.GrupoRepository;

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
public class EgressoEmpresaControllerTest {

    static final String NOME = "EmpresaTeste";
    static final String SETORATUACAO = "SetorTeste";
    final String USERNAME = "username_test";

    static final Integer EGRESSO_ID = 1;
    static final String EGRESSO_EMAIL = "cantao162@gmail.com";
    
    static final Integer FAIXASALARIAL_ID = 1;
    static final String FAIXASALARIAL = "5000 - 15000";

    static final Integer EMRPESA_ID = 1;


    @Autowired
    private GrupoRepository grupoRepository;

    @Autowired
    MockMvc mockMvc;

    String token;

    UsuarioModel usuarioModel;

    EmpresaDTO empresaDTO;

    EgressoEmpresaDTO egressoEmpresaDTO;

    EgressoEmpresaModelId egressoEmpresaModelId;
    
    EgressoPublicDTO egressoPublicDTO;

    FaixaSalarialDTO faixaSalarialDTO;

    @Autowired
    ModelMapper modelMapper;

    @BeforeAll
    void setUp() throws Exception {
        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        egressoPublicDTO = new EgressoPublicDTO(EGRESSO_ID, null, EGRESSO_EMAIL, null, null, null, null, null, null);
        empresaDTO = EmpresaDTO.builder().id(EGRESSO_ID).nome(NOME).setorAtuacao(SETORATUACAO).faixaSalarialId(FAIXASALARIAL_ID).build();

        egressoEmpresaModelId = EgressoEmpresaModelId.builder().egressoId(EGRESSO_ID).empresaId(EMRPESA_ID).build();

        faixaSalarialDTO = FaixaSalarialDTO.builder().id(FAIXASALARIAL_ID).faixa(FAIXASALARIAL).build();

        egressoEmpresaDTO = EgressoEmpresaDTO.builder().id(egressoEmpresaModelId).egresso(egressoPublicDTO).empresa(empresaDTO).faixaSalarial(faixaSalarialDTO).build();

        GrupoModel grupoModel = new GrupoModel();
        grupoModel.setNomeGrupo("ADMIN");
        grupoModel = grupoRepository.save(grupoModel);

        Set<GrupoModel> grupos = new HashSet<>();
        grupos.add(grupoModel);

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

        MvcResult resposta = mockMvc.perform(
                                MockMvcRequestBuilders.get("/usuario")
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

        UsuarioAuthDTO usuarioAuthDTO = objectMapper.readValue(resposta.getResponse().getContentAsString(), UsuarioAuthDTO.class);

        usuarioModel.setId(usuarioAuthDTO.getId());

    }

    @Test
    @Order(3)
    void testAtualizarEgressoEmpresa() throws Exception {
        
    }

    @Test
    @Order(1)
    void testCadastrarEgressoEmpresa() throws Exception {
        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.post("/egressoEmpresa")
                    .contentType(MediaType.APPLICATION_JSON)
                    .header("Authorization", "Bearer " + this.token)
                    .content(objectMapper.writeValueAsString(this.egressoEmpresaDTO)))
                    .andDo(MockMvcResultHandlers.print())
                    .andExpect(status().isCreated())
                    .andReturn();

        String retornoString = resposta.getResponse().getContentAsString();
        assertEquals(ResponseType.SUCESS_SAVE.getMessage(), retornoString);
    }

    @Test
    @Order(4)
    void testConsultarEgressoEmpresas() throws Exception{

        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/egressoEmpresa")
                                .contentType(MediaType.APPLICATION_JSON)
                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

        List<EgressoEmpresaDTO> egressoEmpresasDTO = objectMapper.readValue(resposta.getResponse().getContentAsString(),
                                new TypeReference<List<EgressoEmpresaDTO>>() {
                                });

        assertNotNull(egressoEmpresasDTO);
        assertEquals(0, egressoEmpresasDTO.size());

    }

    @Test
    @Order(5)
    void testDeleteById() throws Exception {

    }

    @Test
    @Order(2)
    void testFindById() throws Exception {

    }
}
