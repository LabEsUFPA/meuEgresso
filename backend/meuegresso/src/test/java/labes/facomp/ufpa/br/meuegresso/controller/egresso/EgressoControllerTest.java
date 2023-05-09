package labes.facomp.ufpa.br.meuegresso.controller.egresso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.time.LocalDate;
import java.util.HashSet;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationRequest;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationResponse;
import labes.facomp.ufpa.br.meuegresso.dto.contribuicao.ContribuicaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoCadastroDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoPublicDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.grupo.GrupoRepository;

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class EgressoControllerTest {

        @Autowired
        private GrupoRepository grupoRepository;

        @Autowired
        private GeneroRepository generoRepository;

        @Autowired
        MockMvc mockMvc;

        @Autowired
        ModelMapper modelMapper;

        String token;


        EgressoModel egressoModel;

        UsuarioModel usuarioModel;

        GeneroModel genero;


        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        EgressoPublicDTO egressoPublicDTO;

        EgressoCadastroDTO egressoCadastro;

        static final Integer EGRESSO_ID = 1;
        static final String EGRESSO_EMAIL = "teste@gmail.com";


        @BeforeAll
        void setUp() throws Exception {
            /*Gênero */
            genero = new GeneroModel(null, "genero X");
            genero = generoRepository.save(genero);

            GrupoModel grupoModel = new GrupoModel();
            grupoModel.setNomeGrupo("ADMIN");

            grupoModel = grupoRepository.save(grupoModel);

            Set<GrupoModel> grupos = new HashSet<>();
            grupos.add(grupoModel);

            UsuarioModel usuarioModel = new UsuarioModel();
            usuarioModel.setUsername("username");
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
        void testCadastrarEgressoPrimeiroCadastro() throws Exception {
            DepoimentoDTO depoimento = new DepoimentoDTO(1, "TextoDepoimento");

            egressoCadastro = new EgressoCadastroDTO();
            egressoCadastro.setId(1);
            egressoCadastro.setNome("nome_test");
            egressoCadastro.setMatricula("202003940011");
            egressoCadastro.setNascimento(LocalDate.parse("1999-10-20"));
            egressoCadastro.setGeneroId(genero.getId());

            ContribuicaoDTO contribuicao = new ContribuicaoDTO(1, "TextoContribuicao", egressoCadastro.getId());

            egressoCadastro.setContribuicao(contribuicao);
            egressoCadastro.setDepoimento(depoimento);

            MvcResult resposta = mockMvc.perform(
                    MockMvcRequestBuilders.post("/egresso")
                            .contentType(MediaType.APPLICATION_JSON)
                            .content(objectMapper.writeValueAsString(egressoCadastro))
                            .header("Authorization", "Bearer " + this.token))
                    .andDo(MockMvcResultHandlers.print())
                    .andExpect(status().isCreated()).andReturn();

            String resp = resposta.getResponse().getContentAsString();
            assertEquals(ResponseType.SUCESS_SAVE.getMessage(), resp);
        }

        @Test
        @Order(2)
        void testgetEgresso() throws Exception {

            MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.get("/egresso")
						.contentType(MediaType.APPLICATION_JSON)
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk()).andReturn();

            EgressoDTO egresso = objectMapper.readValue(resposta.getResponse().getContentAsString(),EgressoDTO.class);
            egressoPublicDTO = modelMapper.map(egresso, EgressoPublicDTO.class);

            assertEquals(egressoCadastro.getMatricula(), egresso.getMatricula());
        }

        @Test
        @Order(3)
        void testAtualizarEgresso() throws Exception {

            MvcResult resposta = mockMvc.perform(
                    MockMvcRequestBuilders.put("/egresso")
                            .contentType(MediaType.APPLICATION_JSON)
                            .content(objectMapper.writeValueAsString(egressoPublicDTO))
                            .header("Authorization", "Bearer " + this.token))
                            .andDo(MockMvcResultHandlers.print())
                            .andExpect(status().isAccepted()).andReturn();

            String resp = resposta.getResponse().getContentAsString();
            assertEquals(ResponseType.SUCESS_UPDATE.getMessage(), resp);
        }

        @Test
        @Order(4)
        void testDeletarEgresso() throws Exception {
            MvcResult resposta = mockMvc.perform(
				MockMvcRequestBuilders.delete("/egresso")
						.contentType(MediaType.APPLICATION_JSON)
						.param("id", egressoPublicDTO.getId().toString())
						.header("Authorization", "Bearer " + this.token))
				.andDo(MockMvcResultHandlers.print())
				.andExpect(status().isOk()).andReturn();

            String res = resposta.getResponse().getContentAsString();
            assertEquals(res, ResponseType.SUCESS_DELETE.getMessage());

        }
}