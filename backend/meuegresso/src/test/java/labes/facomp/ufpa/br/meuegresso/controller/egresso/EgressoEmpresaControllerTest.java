package labes.facomp.ufpa.br.meuegresso.controller.egresso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.time.LocalDate;
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

import labes.facomp.ufpa.br.meuegresso.dto.areaatuacao.AreaAtuacaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationRequest;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationResponse;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoCadastroDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoEmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoPublicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.faixasalarial.FaixaSalarialDTO;
import labes.facomp.ufpa.br.meuegresso.dto.genero.GeneroDTO;
import labes.facomp.ufpa.br.meuegresso.dto.setoratuacao.SetorAtuacaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.AreaAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.areaatuacao.AreaAtuacaoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.empresa.EmpresaRepository;
import labes.facomp.ufpa.br.meuegresso.repository.faixasalarial.FaixaSalarialRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.grupo.GrupoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.setoratuacao.SetorAtuacaoRepository;

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class EgressoEmpresaControllerTest {

    static final Integer EMPRESA_ID = 1;
    static final String NOME = "EmpresaTeste";
    static final String SETORATUACAO = "SetorTeste";

    final String USERNAME = "username_test";

    static final Integer EGRESSO_ID = 1;
    static final LocalDate EGRESSO_NASCIMENTO = LocalDate.parse("1999-10-20");
    static final String EGRESSO_EMAIL = "cantao162@gmail.com";

    static final Integer FAIXASALARIAL_ID = 1;
    static final String FAIXASALARIAL = "5000 - 15000";

    @Autowired
    private GrupoRepository grupoRepository;

    @Autowired
    private EgressoRepository egressoRepository;

    @Autowired
    private GeneroRepository generoRepository;

    @Autowired
    private EmpresaRepository empresaRepository;

    @Autowired
    private FaixaSalarialRepository faixaSalarialRepository;

    @Autowired
    private AreaAtuacaoRepository areaAtuacaoRepository;

    @Autowired
    private SetorAtuacaoRepository setorAtuacaoRepository;

    @Autowired
    MockMvc mockMvc;

    String token;

    UsuarioModel usuarioModel;

    EmpresaDTO empresaDTO;
    EmpresaModel empresaModel;

    EgressoEmpresaDTO egressoEmpresaDTO;
    EgressoEmpresaModelId egressoEmpresaModelId;

    EgressoPublicDTO egressoPublicDTO;
    EgressoCadastroDTO egressoCadastroDTO;
    EgressoModel egressoModel;

    FaixaSalarialDTO faixaSalarialDTO;

    @Autowired
    ModelMapper modelMapper;

    @BeforeAll
    void setUp() throws Exception {
        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        /* Gênero */
        GeneroModel genero = new GeneroModel(1, "genero X");
        GeneroDTO generoDTO = modelMapper.map(genero, GeneroDTO.class);
        genero = generoRepository.save(genero);

        /* Egresso */
        egressoPublicDTO = EgressoPublicDTO.builder().id(EGRESSO_ID).email(EGRESSO_EMAIL).nascimento(EGRESSO_NASCIMENTO)
                .genero(generoDTO).build();
        egressoModel = modelMapper.map(egressoPublicDTO, EgressoModel.class);
        egressoRepository.save(this.egressoModel);

        /* Empresa */
        empresaDTO = EmpresaDTO.builder().id(EMPRESA_ID).nome(NOME).setorAtuacao(SETORATUACAO)
                .faixaSalarialId(FAIXASALARIAL_ID).build();
        empresaModel = modelMapper.map(empresaDTO, EmpresaModel.class);
        empresaRepository.save(empresaModel);

        /* ModelId */
        egressoEmpresaModelId = EgressoEmpresaModelId.builder().egressoId(EGRESSO_ID).empresaId(EMPRESA_ID).build();

        /* FaixaSalarial */
        faixaSalarialDTO = FaixaSalarialDTO.builder().id(FAIXASALARIAL_ID).faixa(FAIXASALARIAL).build();
        FaixaSalarialModel faixaSalarialModel = modelMapper.map(faixaSalarialDTO, FaixaSalarialModel.class);
        faixaSalarialRepository.save(faixaSalarialModel);

        /* AreaAtuacao */
        AreaAtuacaoDTO areaAtuacaoDTO= AreaAtuacaoDTO.builder().id(1).nome("areaTeste").build();
        AreaAtuacaoModel areaAtuacaoModel = modelMapper.map(areaAtuacaoDTO, AreaAtuacaoModel.class);
        areaAtuacaoRepository.save(areaAtuacaoModel);

        /* SetorAtuacao */
        SetorAtuacaoDTO setorAtuacaoDTO= SetorAtuacaoDTO.builder().id(1).nome("setorTeste").build();
        SetorAtuacaoModel setorAtuacaoModel = modelMapper.map(setorAtuacaoDTO, SetorAtuacaoModel.class);
        setorAtuacaoRepository.save(setorAtuacaoModel);

        /* EgressoEmpresa */
        egressoEmpresaDTO = EgressoEmpresaDTO.builder().id(egressoEmpresaModelId).egresso(egressoPublicDTO)
                .empresa(empresaDTO).areaAtuacao(areaAtuacaoDTO).setorAtuacao(setorAtuacaoDTO).faixaSalarial(faixaSalarialDTO).build();

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

        UsuarioAuthDTO usuarioAuthDTO = objectMapper.readValue(resposta.getResponse().getContentAsString(),
                UsuarioAuthDTO.class);

        usuarioModel.setId(usuarioAuthDTO.getId());

    }

    @Test
    @Order(1)
    void testCadastrarEgressoEmpresa() throws Exception {
        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.post("/egressoEmpresa")
                .contentType(MediaType.APPLICATION_JSON)
                .header("Authorization", "Bearer " + this.token)
                .content(objectMapper.writeValueAsString(egressoEmpresaDTO)))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isCreated())
                .andReturn();

        String retornoString = resposta.getResponse().getContentAsString();
        assertEquals(ResponseType.SUCESS_SAVE.getMessage(), retornoString);
    }

    @Test
    @Order(2)
    void testFindById() throws Exception {
        //TODO: fazer setorAtuacaoController e areaAtuacaoController pra funcionar

        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        MvcResult resposta = mockMvc
                .perform(MockMvcRequestBuilders
                        .get("/egressoEmpresa?egressoId=" + egressoPublicDTO.getId() + "&empresaId="
                                + empresaDTO.getId())
                        .contentType(MediaType.APPLICATION_JSON)
                        .header("Authorization", "Bearer " + this.token))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isOk()).andReturn();

        EgressoEmpresaDTO egressoEmpresaDTOresponse = objectMapper
                .readValue(resposta.getResponse().getContentAsString(), EgressoEmpresaDTO.class);
        assertEquals(NOME, egressoEmpresaDTOresponse.getEmpresa().getNome());

    }

    @Test
    @Order(3)
    void testAtualizarEgressoEmpresa() throws Exception {
        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.put("/egressoEmpresa")
                .contentType(MediaType.APPLICATION_JSON)
                .header("Authorization", "Bearer " + this.token)
                .content(objectMapper.writeValueAsString(egressoEmpresaDTO)))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isCreated())
                .andReturn();

        String retornoString = resposta.getResponse().getContentAsString();
        assertEquals(ResponseType.SUCESS_UPDATE.getMessage(), retornoString);

    }

    @Test
    @Order(4)
    void testConsultarEgressoEmpresas() throws Exception {

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
        assertEquals(1, egressoEmpresasDTO.size());

    }

    @Test
    @Order(5)
    void testDeleteById() throws Exception {
        MvcResult resposta = mockMvc.perform(
                MockMvcRequestBuilders
                        .delete("/egressoEmpresa?egressoId=" + egressoPublicDTO.getId() + "&empresaId="
                                + empresaDTO.getId())
                        .contentType(MediaType.APPLICATION_JSON)
                        .header("Authorization", "Bearer " + this.token))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isOk())
                .andReturn();
        String resultado = resposta.getResponse().getContentAsString();
        assertEquals(ResponseType.SUCESS_DELETE.getMessage(), resultado);
    }

}
