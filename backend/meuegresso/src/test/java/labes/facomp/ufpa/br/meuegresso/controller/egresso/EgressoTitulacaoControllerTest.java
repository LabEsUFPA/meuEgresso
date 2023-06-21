package labes.facomp.ufpa.br.meuegresso.controller.egresso;

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
import labes.facomp.ufpa.br.meuegresso.dto.curso.CursoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoTitulacaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.faixasalarial.FaixaSalarialDTO;
import labes.facomp.ufpa.br.meuegresso.dto.titulacao.TitulacaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.curso.CursoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.empresa.EmpresaRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.titulacao.TitulacaoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;
//TODO consertar teste
@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)

/**
 * Classe de testes para EgressoTitulacaoController:
 * Implementa testes para as funções de cadastro, consulta,
 * atualização e deleção por ID
 *
 * @author Eude Monteiro
 * @since 03/05/2023
 */
 class EgressoTitulacaoControllerTest {
    static final Integer TITULACAO_ID = 1;
    static final String NOME = "TituloTeste";
    static final String SETORATUACAO = "SetorTeste";
    static final Integer EMPRESA_ID = 2;

    final String USERNAME = "username_test";

    static final Integer EGRESSO_ID = 1;
    static final String EGRESSO_EMAIL = "cantao162@gmail.com";

    static final LocalDate INGRESSO = LocalDate.of(2023, 4, 1);
    static final LocalDate CONCLUSAO = LocalDate.of(2023, 4, 10);

    static final Integer FAIXASALARIAL_ID = 1;
    static final String FAIXASALARIAL = "5000 - 15000";

    @Autowired
    private CursoRepository cursoRepository;

    @Autowired
    private EgressoRepository egressoRepository;

    @Autowired
    private EmpresaRepository empresaRepository;

    @Autowired
    private GeneroRepository generoRepository;

    @Autowired
    private TitulacaoRepository titulacaoRepository;

    @Autowired
    MockMvc mockMvc;

    String token;

    UsuarioModel usuarioModel;

    CursoModel cursoModel;
    CursoDTO cursoDTO;

    EmpresaDTO empresaDTO;
    EmpresaModel empresaModel;


    EgressoTitulacaoDTO egressoTitulacaoDTO;
    EgressoTitulacaoModelId egressoTitulacaoModelId;

    EgressoModel egressoModel;

    FaixaSalarialDTO faixaSalarialDTO;

    TitulacaoDTO titulacaoDTO;
    TitulacaoModel titulacaoModel;

    @Autowired
	PasswordEncoder passwordEncoder;

    @Autowired
    ModelMapper modelMapper;

	@Autowired
	UsuarioRepository usuarioRepository;

    @BeforeAll
    void setUp() throws Exception {
        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        /*Gênero */
        GeneroModel genero = new GeneroModel(1, "genero X");
        genero = generoRepository.save(genero);

        usuarioModel = new UsuarioModel();
        usuarioModel.setUsername(USERNAME);
        usuarioModel.setNome("nome_test");
        usuarioModel.setEmail("teste@gmail.com");
        usuarioModel.setGrupos(Set.of(Grupos.ADMIN));

        final String plainTextPassword = "teste123";
        final String encodedPassword = passwordEncoder.encode(plainTextPassword);

        usuarioModel.setPassword(encodedPassword);
        usuarioRepository.save(usuarioModel);

        /*Egresso */
        egressoModel = EgressoModel.builder().cotista(true).interesseEmPos(true).nascimento(LocalDate.parse("1999-10-20")).genero(genero).build();
        egressoModel = egressoRepository.save(this.egressoModel);
        //egressoPublicDTO = modelMapper.map(egressoModel, EgressoPublicDTO.class);

        /*Curso */
        cursoModel = CursoModel.builder().nome("Ciência da Computação").build();
        cursoModel = cursoRepository.save(cursoModel);
        cursoDTO = modelMapper.map(cursoModel, CursoDTO.class);

        /*Empresa */
        empresaModel = EmpresaModel.builder().nome("EmpresaTeste").endereco(null).build();
        empresaModel = empresaRepository.save(empresaModel);
        empresaDTO = modelMapper.map(empresaModel, EmpresaDTO.class);

        /*Titulação */
        titulacaoModel = TitulacaoModel.builder().nome("Mestrado").build();
        titulacaoModel = titulacaoRepository.save(titulacaoModel);
        titulacaoDTO = modelMapper.map(titulacaoModel, TitulacaoDTO.class);

        /*ModelId */
        egressoTitulacaoModelId = EgressoTitulacaoModelId.builder().egressoId(egressoModel.getId()).titulacaoId(titulacaoModel.getId()).build();

        /*EgressoTitulacao */
        egressoTitulacaoDTO = EgressoTitulacaoDTO.builder().id(egressoTitulacaoModelId)
                    .empresa(empresaDTO)
                    .curso(cursoDTO)
                    .titulacao(titulacaoDTO).build();

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

        UsuarioAuthDTO usuarioAuthDTO = objectMapper.readValue(resposta.getResponse().getContentAsString(), UsuarioAuthDTO.class);

        usuarioModel.setId(usuarioAuthDTO.getId());
    }

    @Test
    @Order(1)
    void cadastrarEgressoTitulacao() throws Exception{
        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

            MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.post("/egressoTitulacao")
                    .contentType(MediaType.APPLICATION_JSON)
                    .header("Authorization", "Bearer " + this.token)
                    .content(objectMapper.writeValueAsString(egressoTitulacaoDTO)))
                    .andDo(MockMvcResultHandlers.print())
                    .andExpect(status().isCreated())
                    .andReturn();

        String retornoString = resposta.getResponse().getContentAsString();
        assertEquals(ResponseType.SUCCESS_SAVE.getMessage(), retornoString);
    }

    @Test
    @Order(2)
    void testConsultarTitulacao() throws Exception {
        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/egressoTitulacao")
                                .contentType(MediaType.APPLICATION_JSON)
                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

        List<EgressoTitulacaoDTO> egressoTitulacaoDTOs = objectMapper.readValue(resposta.getResponse().getContentAsString(),
                                new TypeReference<List<EgressoTitulacaoDTO>>() {
                                });

        assertNotNull(egressoTitulacaoDTOs);
        egressoTitulacaoDTO.setId(egressoTitulacaoDTOs.get(0).getId());
        assertEquals(1, egressoTitulacaoDTOs.size());

    }

    @Test
    @Order(3)
    void testAtualizarTitulacao() throws Exception{
        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.put("/egressoTitulacao")
                    .contentType(MediaType.APPLICATION_JSON)
                    .header("Authorization", "Bearer " + this.token)
                    .content(objectMapper.writeValueAsString(egressoTitulacaoDTO)))
                    .andDo(MockMvcResultHandlers.print())
                    .andExpect(status().isCreated())
                    .andReturn();

        String retornoString = resposta.getResponse().getContentAsString();
        assertEquals(ResponseType.SUCCESS_UPDATE.getMessage(), retornoString);

    }

    @Test
    @Order(4)
    void testDeleteById() throws Exception{
        MvcResult resposta = mockMvc.perform(
                                MockMvcRequestBuilders.delete("/egressoTitulacao")
                                                .contentType(MediaType.APPLICATION_JSON)
                                                .param("egressoId", egressoTitulacaoDTO.getId().getEgressoId().toString())
                                                .param("titulacaoId", egressoTitulacaoDTO.getId().getTitulacaoId().toString())
                                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk())
                                .andReturn();
        String resultado = resposta.getResponse().getContentAsString();
        assertEquals(ResponseType.SUCCESS_DELETE.getMessage(), resultado);

    }
}
