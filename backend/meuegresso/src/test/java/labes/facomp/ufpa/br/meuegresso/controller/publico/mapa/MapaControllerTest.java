package labes.facomp.ufpa.br.meuegresso.controller.publico.mapa;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.time.LocalDate;
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
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoCadastroDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoEmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoMapaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.faixasalarial.FaixaSalarialDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.model.AreaAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.areaatuacao.AreaAtuacaoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoEmpresaRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.empresa.EmpresaRepository;
import labes.facomp.ufpa.br.meuegresso.repository.faixasalarial.FaixaSalarialRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;

/**
 * Teste unitario para o mapa
 *
 * @author Pedro Inácio
 * @since 14/05/2023
 * @version 1.0
 */
@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class MapaControllerTest {

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
        private AreaAtuacaoRepository areaAtuacaoRepository;

        @Autowired
        private EgressoRepository egressoRepository;

        @Autowired
        private EgressoEmpresaRepository egressoEmpresaRepository;

        @Autowired
        private GeneroRepository generoRepository;

        @Autowired
        private EmpresaRepository empresaRepository;

        @Autowired
        private FaixaSalarialRepository faixaSalarialRepository;

        @Autowired
        MockMvc mockMvc;

        String token;

        UsuarioModel usuarioModel;

        EmpresaDTO empresaDTO;
        EmpresaModel empresaModel;

        EgressoEmpresaModel egressoEmpresaModel;

        EgressoEmpresaDTO egressoEmpresaDTO;
        EgressoEmpresaModelId egressoEmpresaModelId;

        EgressoCadastroDTO egressoCadastroDTO;
        EgressoModel egressoModel;

        FaixaSalarialDTO faixaSalarialDTO;

        @Autowired
        ModelMapper modelMapper;

        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        @BeforeAll
        void setUp() throws Exception {

                usuarioModel = new UsuarioModel();
                usuarioModel.setUsername(USERNAME);
                usuarioModel.setNome("nome_test");
                usuarioModel.setEmail("teste@gmail.com");
                usuarioModel.setPassword("teste123");
                usuarioModel.setGrupos(Set.of(Grupos.ADMIN));

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
                GeneroModel genero = new GeneroModel(1, "genero X");
                genero = generoRepository.save(genero);

                /* Egresso */
                egressoModel = new EgressoModel();
                egressoModel.setId(EGRESSO_ID);
                egressoModel.setNascimento(EGRESSO_NASCIMENTO);
                egressoModel.setGenero(genero);
                egressoModel.setUsuario(usuarioModel);

                egressoRepository.save(this.egressoModel);

                /* Empresa */
                empresaModel = EmpresaModel.builder().id(EGRESSO_ID).nome(NOME).build();
                empresaRepository.save(empresaModel);

                /* ModelId */
                egressoEmpresaModelId = EgressoEmpresaModelId.builder().egressoId(EGRESSO_ID).empresaId(EMPRESA_ID)
                                .build();

                /* FaixaSalarial */
                faixaSalarialDTO = FaixaSalarialDTO.builder().id(FAIXASALARIAL_ID).faixa(FAIXASALARIAL).build();
                FaixaSalarialModel faixaSalarialModel = modelMapper.map(faixaSalarialDTO, FaixaSalarialModel.class);
                faixaSalarialRepository.save(faixaSalarialModel);

                AreaAtuacaoModel area = new AreaAtuacaoModel();
                area.setId(1);
                area.setNome("area x");
                SetorAtuacaoModel setorAtuacaoModel = SetorAtuacaoModel.builder().nome("SETOR X").build();
                egressoEmpresaModel = new EgressoEmpresaModel();
                egressoEmpresaModel.setId(egressoEmpresaModelId);
                egressoEmpresaModel.setEgresso(egressoModel);
                egressoEmpresaModel.setEmpresa(empresaModel);
                egressoEmpresaModel.setAreaAtuacao(area);
                egressoEmpresaModel.setSetorAtuacao(setorAtuacaoModel);
                egressoEmpresaModel.setFaixaSalarial(faixaSalarialModel);
                Set<EgressoModel> egressos = new HashSet<>();
                egressos.add(egressoModel);

                areaAtuacaoRepository.save(area);

                egressoEmpresaModel.setAreaAtuacao(area);
                egressoEmpresaRepository.save(egressoEmpresaModel);

        }

        @Test
        void testFindAllEgressoMapaDTO() throws Exception {

                MvcResult resposta = mockMvc.perform(MockMvcRequestBuilders.get("/publico/mapa")
                                .contentType(MediaType.APPLICATION_JSON)
                                .header("Authorization", "Bearer " + this.token))
                                .andDo(MockMvcResultHandlers.print())
                                .andExpect(status().isOk()).andReturn();

                List<EgressoMapaDTO> egressoEmpresasDTO = objectMapper.readValue(
                                resposta.getResponse().getContentAsString(),
                                new TypeReference<List<EgressoMapaDTO>>() {
                                });

                assertNotNull(egressoEmpresasDTO);
                assertEquals(1, egressoEmpresasDTO.size());
                assertEquals(usuarioModel.getNome(), egressoEmpresasDTO.get(0).getNomeEgresso());
        }

}
