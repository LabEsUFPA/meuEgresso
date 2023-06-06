package labes.facomp.ufpa.br.meuegresso.controller.publico.grafico;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
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
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationRequest;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationResponse;
import labes.facomp.ufpa.br.meuegresso.dto.curso.CursoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoCadastroDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoEmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoPublicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.faixasalarial.FaixaSalarialDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.AreaAtuacaoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.BolsistasGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.CotaGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.CotistaGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.CursosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.EmpresaGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.EnderecoEmpresasGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.GenerosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.IdadesGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.InteresseEmPosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.LocalPosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.PosGraduacaoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.RemuneracaoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.SalarioGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.SetorAtuacaoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.TipoAlunoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.TipoBolsaGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.model.AreaAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.CotaModel;
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.TipoBolsaModel;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.areaatuacao.AreaAtuacaoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.cota.CotaRepository;
import labes.facomp.ufpa.br.meuegresso.repository.curso.CursoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoEmpresaRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoTitulacaoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.empresa.EmpresaRepository;
import labes.facomp.ufpa.br.meuegresso.repository.endereco.EnderecoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.faixasalarial.FaixaSalarialRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.grupo.GrupoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.setoratuacao.SetorAtuacaoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.tipobolsa.TipoBolsaRepository;
import labes.facomp.ufpa.br.meuegresso.repository.titulacao.TitulacaoRepository;

/**
 * Teste unitario para o Grafico
 *
 * @author Bruno Eiki
 * @since 23/05/2023
 * @version 1.0
 */
@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class GraficoPubControllerTest {

        static final String ENDERECO_CIDADE = "Barcarena";
        static final String ENDERECO_ESTADO = "Para";
        static final String ENDERECO_PAIS = "Brasil";

        static final Integer EMPRESA_ID = 1;
        static final String EMPRESA_NOME = "EmpresaTeste";
        static final String SETORATUACAO = "SetorTeste";
        final String USERNAME = "username_test";

        static final Integer GENERO_ID = 1;
        static final String GENERO_NOME = "GeneroTeste";

        static final Integer EGRESSO_ID = 1;
        static final LocalDate EGRESSO_NASCIMENTO = LocalDate.parse("1997-05-05");
        static final String EGRESSO_EMAIL = "emai@teste.com";

        static final Integer CURSO_ID = 1;
        static final String CURSO_NOME = "CursoTeste";

        static final Integer COTA_ID = 1;
        static final String COTA_NOME = "CotaTeste";

        // TODO: faixa salarial quebra quando usa acentuação, talvez pelo banco
        static final Integer FAIXASALARIAL_ID = 1;
        static final String FAIXASALARIAL = "1 salario minimo";

        static final Integer TITULACAO_ID = 1;
        static final String TITULACAO_NOME = "TitulacaoTeste";

        static final Integer TIPOBOLSA_ID = 1;
        static final String TIPOBOLSA_NOME = "TipoBolsaTeste";

        static final Integer AREAATUACAO_ID = 1;
        static final String AREAATUACAO_NOME = "AreaAtuacaoTeste";

        static final Integer SETORATUACAO_ID = 1;
        static final String SETORATUACAO_NOME = "SetorAtuacaoTeste";

        private final Double REMUNERACAOBOLSA = 800.0;

        @Autowired
        private GrupoRepository grupoRepository;

        @Autowired
        private AreaAtuacaoRepository areaAtuacaoRepository;

        @Autowired
        private EgressoRepository egressoRepository;

        @Autowired
        private EgressoEmpresaRepository egressoEmpresaRepository;

        @Autowired
        private EgressoTitulacaoRepository egressoTitulacaoRepository;

        @Autowired
        private GeneroRepository generoRepository;

        @Autowired
        private EmpresaRepository empresaRepository;

        @Autowired
        private EnderecoRepository enderecoRepository;

        @Autowired
        private TitulacaoRepository titulacaoRepository;

        @Autowired
        private TipoBolsaRepository tipoBolsaRepository;

        @Autowired
        private CursoRepository cursoRepository;

        @Autowired
        private CotaRepository cotaRepository;

        @Autowired
        private FaixaSalarialRepository faixaSalarialRepository;

        @Autowired
        private SetorAtuacaoRepository setorAtuacaoRepository;

        @Autowired
        MockMvc mockMvc;

        String token;

        UsuarioModel usuarioModel;

        EnderecoModel enderecoModel;

        EmpresaDTO empresaDTO;
        EmpresaModel empresaModel;

        CursoDTO cursoDTO;
        CursoModel cursoModel;

        TipoBolsaModel tipoBolsaModel;

        CotaModel cotaModel;

        EgressoEmpresaModel egressoEmpresaModel;
        EgressoTitulacaoModel egressoTitulacaoModel;

        EgressoEmpresaDTO egressoEmpresaDTO;
        EgressoEmpresaModelId egressoEmpresaModelId;

        EgressoTitulacaoModelId egressoTitulacaoModelId;

        EgressoPublicDTO egressoPublicDTO;
        EgressoCadastroDTO egressoCadastroDTO;
        EgressoModel egressoModel;

        FaixaSalarialDTO faixaSalarialDTO;

        @Autowired
        ModelMapper modelMapper;

        ObjectMapper objectMapper = JsonMapper.builder()
                        .addModule(new JavaTimeModule())
                        .disable(MapperFeature.CAN_OVERRIDE_ACCESS_MODIFIERS)
                        .build();

        @BeforeAll
        void setUp() throws Exception {

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

                /* Gênero */
                GeneroModel genero = new GeneroModel(GENERO_ID, GENERO_NOME);
                genero = generoRepository.save(genero);

                /* Titulacao */
                TitulacaoModel titulacao = new TitulacaoModel(TITULACAO_ID, TITULACAO_NOME);
                titulacao = titulacaoRepository.save(titulacao);

                /* TipoBolsa */
                tipoBolsaModel = TipoBolsaModel.builder()
                                .id(TIPOBOLSA_ID)
                                .nome(TIPOBOLSA_NOME)
                                .build();
                tipoBolsaModel = tipoBolsaRepository.save(tipoBolsaModel);

                /* Cota */
                cotaModel = CotaModel.builder()
                                .id(COTA_ID)
                                .nome(COTA_NOME)
                                .build();
                cotaModel = cotaRepository.save(cotaModel);
                Set<CotaModel> cotas = new HashSet<>();
                cotas.add(cotaModel);

                /* Egresso */
                egressoModel = new EgressoModel();
                egressoModel.setId(EGRESSO_ID);
                egressoModel.setNascimento(EGRESSO_NASCIMENTO);
                egressoModel.setCotista(true);
                egressoModel.setBolsista(true);
                egressoModel.setInteresseEmPos(true);
                egressoModel.setGenero(genero);
                egressoModel.setPosGraduacao(true);
                egressoModel.setCotas(cotas);
                egressoModel.setUsuario(usuarioModel);
                egressoModel.setBolsa(tipoBolsaModel);
                egressoModel.setRemuneracaoBolsa(REMUNERACAOBOLSA);

                egressoRepository.save(this.egressoModel);

                /* Endereco */
                enderecoModel = EnderecoModel.builder()
                                .cidade(ENDERECO_CIDADE)
                                .estado(ENDERECO_ESTADO)
                                .pais(ENDERECO_PAIS)
                                .build();
                enderecoModel = enderecoRepository.save(enderecoModel);

                /* Empresa */
                empresaModel = EmpresaModel.builder()
                                .id(EGRESSO_ID)
                                .nome(EMPRESA_NOME)
                                .endereco(enderecoModel)
                                .build();
                empresaModel = empresaRepository.save(empresaModel);

                /* EgressoTitulacao ModelId */
                egressoTitulacaoModelId = EgressoTitulacaoModelId.builder()
                                .egressoId(EGRESSO_ID)
                                .titulacaoId(TITULACAO_ID)
                                .build();

                /* EgressoEmpresa ModelId */
                egressoEmpresaModelId = EgressoEmpresaModelId.builder()
                                .egressoId(EGRESSO_ID)
                                .empresaId(EMPRESA_ID)
                                .build();

                /* FaixaSalarial */
                faixaSalarialDTO = FaixaSalarialDTO.builder().id(FAIXASALARIAL_ID).faixa(FAIXASALARIAL).build();
                FaixaSalarialModel faixaSalarialModel = modelMapper.map(faixaSalarialDTO, FaixaSalarialModel.class);
                faixaSalarialModel = faixaSalarialRepository.save(faixaSalarialModel);

                /* Curso */
                cursoDTO = CursoDTO.builder().id(CURSO_ID).nome(CURSO_NOME).build();
                CursoModel cursoModel = modelMapper.map(cursoDTO, CursoModel.class);
                cursoModel = cursoRepository.save(cursoModel);

                /* Area Atuacao */
                AreaAtuacaoModel area = new AreaAtuacaoModel();
                area.setId(AREAATUACAO_ID);
                area.setNome(AREAATUACAO_NOME);
                area = areaAtuacaoRepository.save(area);

                /* Setor Atuacao */
                SetorAtuacaoModel setorAtuacaoModel = SetorAtuacaoModel.builder()
                                .nome(SETORATUACAO_NOME).build();
                setorAtuacaoModel = setorAtuacaoRepository.save(setorAtuacaoModel);

                /* Egresso Titulacao Model */
                egressoTitulacaoModel = new EgressoTitulacaoModel();

                egressoTitulacaoModel.setId(egressoTitulacaoModelId);
                egressoTitulacaoModel.setEgresso(egressoModel);
                egressoTitulacaoModel.setTitulacao(titulacao);
                egressoTitulacaoModel.setEmpresa(empresaModel);
                egressoTitulacaoModel.setCurso(cursoModel);

                egressoTitulacaoModel = egressoTitulacaoRepository.save(egressoTitulacaoModel);

                /* Egresso Empresa Model */
                egressoEmpresaModel = new EgressoEmpresaModel();

                egressoEmpresaModel.setId(egressoEmpresaModelId);
                egressoEmpresaModel.setEgresso(egressoModel);
                egressoEmpresaModel.setEmpresa(empresaModel);
                egressoEmpresaModel.setAreaAtuacao(area);
                egressoEmpresaModel.setSetorAtuacao(setorAtuacaoModel);
                egressoEmpresaModel.setFaixaSalarial(faixaSalarialModel);
                Set<EgressoModel> egressos = new HashSet<>();
                egressos.add(egressoModel);

                egressoEmpresaModel.setAreaAtuacao(area);
                egressoEmpresaModel = egressoEmpresaRepository.save(egressoEmpresaModel);

        }

        @Test
        @Order(1)
        void testGetGeneros() throws Exception {

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/generos")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                GenerosGraficoDTO generosGraficoDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                GenerosGraficoDTO.class);

                assertNotNull(generosGraficoDTO);
                assertEquals(1, generosGraficoDTO.getGeneros().size());
                assertEquals(1, generosGraficoDTO.getGeneros().get(GENERO_NOME));
        }

        @Test
        @Order(2)
        void testGetBolsistas() throws Exception {

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/bolsistas")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                BolsistasGraficoDTO bolsistasGraficoDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                BolsistasGraficoDTO.class);

                assertNotNull(bolsistasGraficoDTO);
                assertEquals(2, bolsistasGraficoDTO.getBolsistasContagem().size());
                assertEquals(1, bolsistasGraficoDTO.getBolsistasContagem().get("Bolsistas"));
                // TODO: verificar troca de null para 0 quando não houver instancia
                assertNull(bolsistasGraficoDTO.getBolsistasContagem().get("Não Bolsistas"));
        }

        @Test
        @Order(3)
        void testGetTipoBolsa() throws Exception {

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/tipoBolsa")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                TipoBolsaGraficoDTO tipoBolsaGraficoDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                TipoBolsaGraficoDTO.class);

                assertNotNull(tipoBolsaGraficoDTO);
                assertEquals(1, tipoBolsaGraficoDTO.getTipoBolsas().size());
                assertEquals(1, tipoBolsaGraficoDTO.getTipoBolsas().get(TIPOBOLSA_NOME));
        }

        @Test
        @Order(4)
        void testGetInteresseEmPos() throws Exception {

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/interesseEmPos")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                InteresseEmPosGraficoDTO interesseEmPosGraficoDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                InteresseEmPosGraficoDTO.class);

                assertNotNull(interesseEmPosGraficoDTO);
                assertEquals(2, interesseEmPosGraficoDTO.getInteresseContagem().size());
                assertEquals(1, interesseEmPosGraficoDTO.getInteresseContagem().get("Sim"));
                // TODO: verificar troca de null para 0 quando não houver instancia
                assertNull(interesseEmPosGraficoDTO.getInteresseContagem().get("Não"));
        }

        @Test
        @Order(5)
        void testGetPos() throws Exception {

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/pos")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                PosGraduacaoGraficoDTO posGraduacaoGraficoDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                PosGraduacaoGraficoDTO.class);

                assertNotNull(posGraduacaoGraficoDTO);
                assertEquals(2, posGraduacaoGraficoDTO.getPosGraduacaoContagem().size());
                assertEquals(1, posGraduacaoGraficoDTO.getPosGraduacaoContagem().get("Fez"));
                // TODO: verificar troca de null para 0 quando não houver instancia
                assertNull(posGraduacaoGraficoDTO.getPosGraduacaoContagem().get("Não fez"));
        }

        @Test
        @Order(6)
        void testGetCotistas() throws Exception {

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/cotista")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                CotistaGraficoDTO cotistaGraficoDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                CotistaGraficoDTO.class);

                assertNotNull(cotistaGraficoDTO);
                assertEquals(2, cotistaGraficoDTO.getCotistasEnumerados().size());
                assertEquals(1, cotistaGraficoDTO.getCotistasEnumerados().get("Cotista"));
                // TODO: verificar troca de null para 0 quando não houver instancia
                assertNull(cotistaGraficoDTO.getCotistasEnumerados().get("Não Cotista"));
        }

        @Test
        @Order(7)
        void testGetCotas() throws Exception {

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/cotas")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                CotaGraficoDTO cotaGraficoDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                CotaGraficoDTO.class);

                assertNotNull(cotaGraficoDTO);
                assertEquals(1, cotaGraficoDTO.getCotaAtuacao().size());
                assertEquals(1, cotaGraficoDTO.getCotaAtuacao().get(COTA_NOME));
        }

        @Test
        @Order(8)
        void testGetTipoAlunos() throws Exception {
                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/tipoAlunos")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                TipoAlunoGraficoDTO tipoAlunoGraficoDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                TipoAlunoGraficoDTO.class);

                assertNotNull(tipoAlunoGraficoDTO);
                assertEquals(1, tipoAlunoGraficoDTO.getTipoAlunos().size());
                assertEquals(1, tipoAlunoGraficoDTO.getTipoAlunos().get(TITULACAO_NOME));
        }

        @Test
        @Order(9)
        void testGetCursos() throws Exception {
                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/cursos")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                List<CursosGraficoDTO> cursosGraficoDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                new TypeReference<List<CursosGraficoDTO>>() {
                                });

                assertNotNull(cursosGraficoDTO);
                assertEquals(1, cursosGraficoDTO.size());
                assertEquals(1, cursosGraficoDTO.get(0).getQuantidade());
                assertEquals(CURSO_NOME, cursosGraficoDTO.get(0).getCurso());
        }

        @Test
        @Order(10)
        void testGetAtuacao() throws Exception {
                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/atuacao")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                AreaAtuacaoGraficoDTO areaAtuacaoGraficoDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                AreaAtuacaoGraficoDTO.class);

                assertNotNull(areaAtuacaoGraficoDTO);
                assertEquals(1, areaAtuacaoGraficoDTO.getAreaAtuacao().size());
                assertEquals(1, areaAtuacaoGraficoDTO.getAreaAtuacao()
                                .get(AREAATUACAO_NOME));
        }

        @Test
        @Order(11)
        void testGetSetor() throws Exception {
                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/setor")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                SetorAtuacaoGraficoDTO setorAtuacaoGraficoDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                SetorAtuacaoGraficoDTO.class);

                assertNotNull(setorAtuacaoGraficoDTO);
                assertEquals(1, setorAtuacaoGraficoDTO.getSetorAtuacao().size());
                assertEquals(1, setorAtuacaoGraficoDTO.getSetorAtuacao()
                                .get(SETORATUACAO_NOME));
        }

        @Test
        @Order(12)
        void testGetIdades() throws Exception {
                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/idades")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                IdadesGraficoDTO idadesGraficoDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                IdadesGraficoDTO.class);

                assertNotNull(idadesGraficoDTO);
                assertEquals(1, idadesGraficoDTO.getIdadesEgressos().size());
                // O get(26) seleciona a chave com idade 26 e retorna quantos egressos
                // tem essa idade, que nesse caso é 1
                assertEquals(1, idadesGraficoDTO.getIdadesEgressos().get(26));
                assertEquals(26.0, idadesGraficoDTO.getMediaIdades());
        }

        @Test
        @Order(13)
        void testGetSalarios() throws Exception {
                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/salarios")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                SalarioGraficoDTO salarioGraficoDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                SalarioGraficoDTO.class);

                assertNotNull(salarioGraficoDTO);
                assertEquals(1, salarioGraficoDTO.getSalarios().size());
                assertEquals(1, salarioGraficoDTO.getSalarios().get("1 salario minimo"));
        }

        @Test
        @Order(14)
        void testGetRemuneracao() throws Exception {
                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/remuneracao")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                RemuneracaoGraficoDTO remuneracaoGraficoDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                RemuneracaoGraficoDTO.class);

                assertNotNull(remuneracaoGraficoDTO);
                assertEquals(1, remuneracaoGraficoDTO.getRemuneracaoContagem().size());
                assertEquals(1, remuneracaoGraficoDTO.getRemuneracaoContagem().get(REMUNERACAOBOLSA));
        }

        @Test
        @Order(15)
        void testGetLocalPos() throws Exception {
                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/localPos")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                List<LocalPosGraficoDTO> localPosGraficoDTOs = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                new TypeReference<List<LocalPosGraficoDTO>>() {
                                });

                assertNotNull(localPosGraficoDTOs);
                assertEquals(1, localPosGraficoDTOs.size());
                assertEquals(EMPRESA_NOME, localPosGraficoDTOs.get(0).getInstituicao());
                assertEquals(1, localPosGraficoDTOs.get(0).getQuantidade());
        }

        @Test
        @Order(16)
        void testGetEnderecoEmpresas() throws Exception {
                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/enderecoEmpresas")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                EnderecoEmpresasGraficoDTO enderecoEmpresasGraficoDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                EnderecoEmpresasGraficoDTO.class);

                assertNotNull(enderecoEmpresasGraficoDTO);
                assertEquals(1, enderecoEmpresasGraficoDTO.getEnderecoEmpresas().size());
                assertEquals(EMPRESA_NOME, enderecoEmpresasGraficoDTO.getEnderecoEmpresas().get(0).get(0));
                assertEquals(ENDERECO_PAIS, enderecoEmpresasGraficoDTO.getEnderecoEmpresas().get(0).get(1));
                assertEquals(ENDERECO_ESTADO, enderecoEmpresasGraficoDTO.getEnderecoEmpresas().get(0).get(2));
                assertEquals(ENDERECO_CIDADE, enderecoEmpresasGraficoDTO.getEnderecoEmpresas().get(0).get(3));
        }

        @Test
        @Order(17)
        void testGetEmpresas() throws Exception {
                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/grafico/empresas")
                                .contentType(MediaType.APPLICATION_JSON))
                                // .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                List<EmpresaGraficoDTO> empresaGraficoDTOs = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                new TypeReference<List<EmpresaGraficoDTO>>() {
                                });

                assertNotNull(empresaGraficoDTOs);
                assertEquals(1, empresaGraficoDTOs.size());
                assertEquals(EMPRESA_NOME, empresaGraficoDTOs.get(0).getEmpresa());
                assertEquals(1, empresaGraficoDTOs.get(0).getQuantidade());
        }
}