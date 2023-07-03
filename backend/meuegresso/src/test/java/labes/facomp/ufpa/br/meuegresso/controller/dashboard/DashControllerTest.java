// package labes.facomp.ufpa.br.meuegresso.controller.dashboard;

// import static org.junit.jupiter.api.Assertions.assertEquals;
// import static org.junit.jupiter.api.Assertions.assertNotNull;
// import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

// import java.time.LocalDate;
// import java.time.LocalDateTime;
// import java.util.List;
// import java.util.Set;

// import org.junit.jupiter.api.BeforeAll;
// import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
// import org.junit.jupiter.api.Order;
// import org.junit.jupiter.api.Test;
// import org.junit.jupiter.api.TestInstance;
// import org.junit.jupiter.api.TestInstance.Lifecycle;
// import org.junit.jupiter.api.TestMethodOrder;
// import org.modelmapper.ModelMapper;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
// import org.springframework.boot.test.context.SpringBootTest;
// import org.springframework.http.MediaType;
// import org.springframework.security.crypto.password.PasswordEncoder;
// import org.springframework.test.annotation.DirtiesContext;
// import org.springframework.test.context.ActiveProfiles;
// import org.springframework.test.web.servlet.MockMvc;
// import org.springframework.test.web.servlet.MvcResult;
// import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
// import org.springframework.test.web.servlet.result.MockMvcResultHandlers;

// import com.fasterxml.jackson.core.type.TypeReference;
// import com.fasterxml.jackson.databind.ObjectMapper;
// import com.fasterxml.jackson.databind.json.JsonMapper;
// import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

// import labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso.EgressoDashDTO;
// import labes.facomp.ufpa.br.meuegresso.dto.administradores.notificacao.NotificacaoDTO;
// import labes.facomp.ufpa.br.meuegresso.dto.areaatuacao.AreaAtuacaoDTO;
// import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationRequest;
// import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationResponse;
// import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoCadastroDTO;
// import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoEmpresaDTO;
// import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoPublicDTO;
// import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaBasicDTO;
// import labes.facomp.ufpa.br.meuegresso.dto.faixasalarial.FaixaSalarialDTO;
// import labes.facomp.ufpa.br.meuegresso.dto.genero.GeneroDTO;
// import labes.facomp.ufpa.br.meuegresso.dto.page.PageDTO;
// import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.EgressoCadastroAnualGraficoDTO;
// import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.EgressoCadastroDiaGraficoDTO;
// import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.EgressoCadastroMensalGraficoDTO;
// import labes.facomp.ufpa.br.meuegresso.dto.setoratuacao.SetorAtuacaoDTO;
// import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
// import labes.facomp.ufpa.br.meuegresso.model.AreaAtuacaoModel;
// import labes.facomp.ufpa.br.meuegresso.model.CotaModel;
// import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
// import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
// import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
// import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;
// import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
// import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;
// import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
// import labes.facomp.ufpa.br.meuegresso.repository.areaatuacao.AreaAtuacaoRepository;
// import labes.facomp.ufpa.br.meuegresso.repository.cota.CotaRepository;
// import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
// import labes.facomp.ufpa.br.meuegresso.repository.empresa.EmpresaRepository;
// import labes.facomp.ufpa.br.meuegresso.repository.faixasalarial.FaixaSalarialRepository;
// import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
// import labes.facomp.ufpa.br.meuegresso.repository.setoratuacao.SetorAtuacaoRepository;
// import labes.facomp.ufpa.br.meuegresso.repository.titulacao.TitulacaoRepository;
// import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

// /**
//  * Teste unitario para o Dashboard do administrador
//  *
//  * @author Bruno Eiki
//  * @since 18/06/2023
//  * @version 1.0
//  */
// @SpringBootTest
// @DirtiesContext
// @AutoConfigureMockMvc
// @ActiveProfiles("test")
// @TestInstance(Lifecycle.PER_CLASS)
// @TestMethodOrder(OrderAnnotation.class)
// class DashControllerTest {

//     static final Integer EMPRESA_ID = 1;
//     static final String NOME = "EmpresaTeste";
//     static final String SETORATUACAO = "SetorTeste";

//     final String USERNAME = "username_test";

//     static final Integer EGRESSO_ID = 1;
//     static final LocalDate EGRESSO_NASCIMENTO = LocalDate.parse("1999-10-20");
//     static final String EGRESSO_EMAIL = "cantao162@gmail.com";

//     static final Integer FAIXASALARIAL_ID = 1;
//     static final String FAIXASALARIAL = "5000 - 15000";

//     /* Usuario ADM para permissao */
//     final String ADM_USERNAME = "admin";
//     final String ADM_PASSWORD = "123456";
//     final String[] DASH_STATUS = new String[] { "pendente", "incompleto" };

//     /* Usuario com Egresso Pendente */
//     final String DASH_USERNAME = "EGRESSO PENDENTE";
//     final String DASH_NOME = "EGRESSO PENDENTE";
//     final String DASH_SENHA = "SENHA";
//     final String DASH_NOME_EMPRESA = "EMPRESA PENDENTE";
//     final String DASH_EMAIL = "duck@gmail.com";
//     final LocalDate DASH_CREATED_DATE = LocalDate.parse("2099-12-12");
//     final String DASH_FOTO = "http://localhost:5173.com/public/egresso/1.png";

//     /* Usuario com Egresso Completo */
//     final String USERNAME_C = "EGRESSO  COMPLETO";
//     final String DASH_NOME_C = "EGRESSO COMPLETO";
//     final String DASH_SENHA_C = "DIFICIL";
//     final String DASH_NOME_EMPRESA_C = "EMPRESA COMPLETE";
//     final String DASH_EMAIL_C = "cat@gmail.com";
//     final LocalDate DASH_CREATED_DATE_C = LocalDate.parse("2001-12-25");
//     final String DASH_FOTO_C = "http://localhost:5173.com/public/egresso/2.png";

//     EgressoModel egressoCadastroPendente = new EgressoModel();
//     EgressoModel egressoCadastroCompleto = new EgressoModel();

//     @Autowired
//     private UsuarioRepository usuarioRepository;

//     @Autowired
//     private EgressoRepository egressoRepository;

//     @Autowired
//     private GeneroRepository generoRepository;

//     @Autowired
//     private CotaRepository cotaRepository;

//     @Autowired
//     private TitulacaoRepository titulacaoRepository;

//     @Autowired
//     private EmpresaRepository empresaRepository;

//     @Autowired
//     private FaixaSalarialRepository faixaSalarialRepository;

//     @Autowired
//     private AreaAtuacaoRepository areaAtuacaoRepository;

//     @Autowired
//     private SetorAtuacaoRepository setorAtuacaoRepository;

//     @Autowired
//     private PasswordEncoder passwordEncoder;

//     @Autowired
//     MockMvc mockMvc;

//     String token;

//     UsuarioModel usuarioModelPendente;
//     UsuarioModel usuarioModelCompleto;
//     UsuarioModel usuarioModelAdmin;

//     EmpresaBasicDTO empresaBasicDTO;
//     EmpresaModel empresaModel;

//     EgressoEmpresaDTO egressoEmpresaDTO;
//     EgressoEmpresaModelId egressoEmpresaModelId;

//     EgressoPublicDTO egressoPublicDTO;
//     EgressoCadastroDTO egressoCadastroDTO;
//     EgressoModel egressoModel;

//     FaixaSalarialDTO faixaSalarialDTO;

//     @Autowired
//     ModelMapper modelMapper;

//     ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

//     GeneroModel genero;
//     CotaModel cotaModel;

//     @BeforeAll
//     void setUp() throws Exception {
//         ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

//         /* Gênero */
//         genero = new GeneroModel(1, "genero X");
//         genero = generoRepository.save(genero);

//         /* Empresa */
//         empresaBasicDTO = EmpresaBasicDTO.builder().id(EMPRESA_ID).nome(NOME).build();
//         empresaModel = modelMapper.map(empresaBasicDTO, EmpresaModel.class);
//         empresaRepository.save(empresaModel);

//         /* ModelId */
//         egressoEmpresaModelId = EgressoEmpresaModelId.builder().egressoId(EGRESSO_ID).empresaId(EMPRESA_ID).build();

//         /* FaixaSalarial */
//         faixaSalarialDTO = FaixaSalarialDTO.builder().id(FAIXASALARIAL_ID).faixa(FAIXASALARIAL).build();
//         FaixaSalarialModel faixaSalarialModel = modelMapper.map(faixaSalarialDTO, FaixaSalarialModel.class);
//         faixaSalarialRepository.save(faixaSalarialModel);

//         /* AreaAtuacao */
//         AreaAtuacaoDTO areaAtuacaoDTO = AreaAtuacaoDTO.builder().id(1).nome("areaTeste").build();
//         AreaAtuacaoModel areaAtuacaoModel = modelMapper.map(areaAtuacaoDTO, AreaAtuacaoModel.class);
//         areaAtuacaoRepository.save(areaAtuacaoModel);

//         /* SetorAtuacao */
//         SetorAtuacaoDTO setorAtuacaoDTO = SetorAtuacaoDTO.builder().id(1).nome("setorTeste").build();
//         SetorAtuacaoModel setorAtuacaoModel = modelMapper.map(setorAtuacaoDTO, SetorAtuacaoModel.class);
//         setorAtuacaoRepository.save(setorAtuacaoModel);

//         /* Cadastro de Usuario com Egresso Pendente */
//         usuarioModelPendente = new UsuarioModel();
//         usuarioModelPendente.setId(1);
//         usuarioModelPendente.setUsername(USERNAME);
//         usuarioModelPendente.setPassword(DASH_SENHA);
//         usuarioModelPendente.setEmail(DASH_EMAIL);
//         usuarioModelPendente.setNome(DASH_NOME);
//         usuarioModelPendente.setCreatedDate(LocalDateTime.now());
//         usuarioModelPendente.setLastModifiedDate(LocalDateTime.now());
//         usuarioModelPendente.setGrupos(Set.of(Grupos.EGRESSO));

//         usuarioModelPendente = usuarioRepository.save(usuarioModelPendente);

//         /* Cadastro de Usuario com Egresso Completo */
//         usuarioModelCompleto = new UsuarioModel();
//         usuarioModelCompleto.setId(2);
//         usuarioModelCompleto.setUsername(USERNAME_C);
//         usuarioModelCompleto.setNome(DASH_NOME_C);
//         usuarioModelCompleto.setEmail(DASH_EMAIL_C);
//         usuarioModelCompleto.setPassword(DASH_SENHA_C);
//         usuarioModelCompleto.setCreatedDate(LocalDateTime.now());
//         usuarioModelCompleto.setLastModifiedDate(LocalDateTime.now());
//         usuarioModelCompleto.setGrupos(Set.of(Grupos.EGRESSO));

//         usuarioModelCompleto = usuarioRepository.save(usuarioModelCompleto);

//         /* Guarda Egresso */
//         EgressoModel egressoCadastroCompleto = EgressoModel.builder()
//                 .id(EGRESSO_ID)
//                 .nascimento(EGRESSO_NASCIMENTO)
//                 .genero(genero)
//                 .matricula("303005550011")
//                 .usuario(usuarioModelCompleto)
//                 .build();

//         egressoCadastroCompleto.setCreatedDate(LocalDateTime.now());
//         egressoCadastroCompleto.setLastModifiedDate(LocalDateTime.now());
//         egressoCadastroCompleto = egressoRepository.save(egressoCadastroCompleto);

//         /* Usuario ADMIN */
//         final String plainPassword = "teste123";
//         usuarioModelAdmin = new UsuarioModel();
//         usuarioModelAdmin.setId(3);
//         usuarioModelAdmin.setUsername("username");
//         usuarioModelAdmin.setEmail("teste@gmail.com");
//         usuarioModelAdmin.setNome("Nome Nome");
//         usuarioModelAdmin.setCreatedDate(LocalDateTime.now());
//         usuarioModelAdmin.setLastModifiedDate(LocalDateTime.now());
//         usuarioModelAdmin.setGrupos(Set.of(Grupos.ADMIN));
//         usuarioModelAdmin.setEmailVerificado(true);
//         usuarioModelAdmin.setAtivo(true);


//         usuarioModelAdmin.setPassword(passwordEncoder.encode(plainPassword));
//         usuarioRepository.save(usuarioModelAdmin);

//         AuthenticationRequest authenticationRequest = new AuthenticationRequest();
//         authenticationRequest.setUsername(usuarioModelAdmin.getUsername());
//         authenticationRequest.setPassword(plainPassword);
//         String objectJson = objectMapper.writeValueAsString(authenticationRequest);

//         MvcResult resultado = mockMvc.perform(MockMvcRequestBuilders.post("/auth/login")
//                 .contentType(MediaType.APPLICATION_JSON)
//                 .content(objectJson))
//                 .andDo(MockMvcResultHandlers.print())
//                 .andExpect(status().isOk())
//                 .andReturn();

//         AuthenticationResponse authenticationResponse = objectMapper.readValue(
//                 resultado.getResponse().getContentAsString(), AuthenticationResponse.class);
//         this.token = authenticationResponse.getToken();

//         /* Troca de valido false para true */
//         mockMvc.perform(MockMvcRequestBuilders.put("/administrador/usuario/2/valido")
//                 .contentType(MediaType.APPLICATION_JSON)
//                 .header("Authorization", "Bearer " + this.token))
//                 .andDo(MockMvcResultHandlers.print())
//                 .andExpect(status().isCreated()).andReturn();
//     }

//     @Order(1)
//     @Test
//     void testConsultarEgressoDash() throws Exception {
//         ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

//         MvcResult resposta = mockMvc.perform(
//                 MockMvcRequestBuilders.get("/administrador/dashboard?status=completo&status=incompleto")
//                         .contentType(MediaType.APPLICATION_JSON)
//                         .header("Authorization", "Bearer " + this.token))
//                 .andDo(MockMvcResultHandlers.print())
//                 .andExpect(status().isOk()).andReturn();

//         List<EgressoDashDTO> dashs = objectMapper.readValue(
//                 resposta.getResponse().getContentAsString(),
//                 new TypeReference<PageDTO<EgressoDashDTO>>() {
//                 }).getContent();

//         assertNotNull(dashs);
//         assertEquals(1, dashs.size());
//         assertEquals(DASH_EMAIL, dashs.get(0).getEmail());
//     }

//     @Order(2)
//     @Test
//     void testExportarPDF() throws Exception {

//         MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/administrador/dashboard/export")
//                 .contentType(MediaType.APPLICATION_JSON)
//                 .header("Authorization", "Bearer " + this.token))
//                 .andDo(MockMvcResultHandlers.print())
//                 .andExpect(status().isOk())
//                 .andReturn();

//         String retornoString = resposta.getResponse().getHeader("Content-Disposition");
//         assertEquals(retornoString.substring(22, 53),
//                 "listagem-egresso-" + LocalDateTime.now().toLocalDate().toString() + ".pdf");

//     }

//     @Order(3)
//     @Test
//     void testGetStatus() throws Exception {

//         /* Guarda Egresso */
//         EgressoModel egressoCadastro = EgressoModel.builder()
//                 .id(2)
//                 .nascimento(LocalDate.parse("1999-10-20"))
//                 .genero(genero)
//                 .matricula("123123123123")
//                 .usuario(usuarioModelPendente)
//                 .build();

//         egressoCadastroCompleto = egressoRepository.save(egressoCadastro);

//         MvcResult resposta = mockMvc.perform(
//                 MockMvcRequestBuilders.get("/notificacaoStatus?status=completo")
//                         .contentType(MediaType.APPLICATION_JSON)
//                         .header("Authorization", "Bearer " + this.token))
//                 .andDo(MockMvcResultHandlers.print())
//                 .andExpect(status().isOk()).andReturn();

//         List<NotificacaoDTO> notificacao = objectMapper.readValue(
//                 resposta.getResponse().getContentAsString(), new TypeReference<PageDTO<NotificacaoDTO>>() {
//                 }).getContent();

//         assertNotNull(notificacao);
//         assertEquals(1, notificacao.size());
//         assertEquals(DASH_NOME_C, notificacao.get(0).getNome());
//     }

//     @Order(3)
//     @Test
//     void testGetCadastroEgressoDiario() throws Exception {
//         MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/administrador/dashboard/cadastro/dia")
//                 .contentType(MediaType.APPLICATION_JSON)
//                 .header("Authorization", "Bearer " + this.token))
//                 .andDo(MockMvcResultHandlers.print())
//                 .andExpect(status().isOk())
//                 .andReturn();

//         EgressoCadastroDiaGraficoDTO dia = objectMapper.readValue(
//                 resposta.getResponse().getContentAsString(),
//                 EgressoCadastroDiaGraficoDTO.class);

//         assertNotNull(dia);
//         assertEquals(1, dia.getEgressosCadastradosPorDia().get(LocalDate.now()));

//     }

//     @Order(4)
//     @Test
//     void testGetCadastroEgressoMensal() throws Exception {
//         MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/administrador/dashboard/cadastro/mes")
//                 .contentType(MediaType.APPLICATION_JSON)
//                 .header("Authorization", "Bearer " + this.token))
//                 .andDo(MockMvcResultHandlers.print())
//                 .andExpect(status().isOk())
//                 .andReturn();

//         EgressoCadastroMensalGraficoDTO mes = objectMapper.readValue(
//                 resposta.getResponse().getContentAsString(),
//                 EgressoCadastroMensalGraficoDTO.class);

//         assertNotNull(mes);
//         assertEquals(1, mes.getEgressosCadastradosPorMesAno().get(LocalDate.now().withDayOfMonth(1)));

//     }

//     @Order(5)
//     @Test
//     void testGetCadastroEgressoAnual() throws Exception {
//         MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/administrador/dashboard/cadastro/ano")
//                 .contentType(MediaType.APPLICATION_JSON)
//                 .header("Authorization", "Bearer " + this.token))
//                 .andDo(MockMvcResultHandlers.print())
//                 .andExpect(status().isOk())
//                 .andReturn();

//         EgressoCadastroAnualGraficoDTO ano = objectMapper.readValue(
//                 resposta.getResponse().getContentAsString(),
//                 EgressoCadastroAnualGraficoDTO.class);

//         assertNotNull(ano);
//         assertEquals(1, ano.getEgressosCadastradosPorAno().get(LocalDate.now().getYear()));

//     }
// }
