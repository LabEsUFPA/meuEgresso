package labes.facomp.ufpa.br.meuegresso.controller.egresso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoValidoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoValidoModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoValidoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoValidoService;

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class EgressoValidoControllerTest {

    final String NOME = "nome_test1";
    final String EMAIL = "test@gmail.com";
    final String MATRICULA = "2020013400";
    final Integer EGRESSO_ID = 1;

    @Autowired
    MockMvc mockMvc;

    @Autowired
    EgressoValidoRepository egressoValidoRepository;

    @Autowired
    GeneroRepository generoRepository;

    @Autowired
    EgressoValidoService egressoValidoService;

    EgressoService egressoService;

    EgressoValidoModel egressoValidoModel = new EgressoValidoModel();

    GeneroModel generoModel = new GeneroModel();

    @Autowired
    ObjectMapper objectMapper;

    @BeforeAll
    void setUp() throws Exception {

        generoModel.setId(1);
        generoModel.setNome("genero1");
        generoRepository.save(generoModel);

        egressoValidoModel.setId(EGRESSO_ID);
        egressoValidoModel.setNome(NOME);
        egressoValidoModel.setMatricula(MATRICULA);
        egressoValidoModel.setEmail(EMAIL);

        egressoValidoRepository.save(egressoValidoModel);

    }

    @Test
    void testValidarEgresso() throws Exception {
        ObjectMapper objectMapper = JsonMapper.builder().addModule(new JavaTimeModule()).build();

        EgressoValidoDTO egressoValidoDTO = new EgressoValidoDTO();
        egressoValidoDTO.setNome(NOME);
        egressoValidoDTO.setMatricula(MATRICULA);
        egressoValidoDTO.setEmail(EMAIL);
        egressoValidoDTO.setId(EGRESSO_ID);

        MvcResult resposta = mockMvc.perform(
                MockMvcRequestBuilders.post("/egressoValido")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(egressoValidoDTO)))
                .andExpect(status().isOk()).andReturn();

        EgressoValidoDTO egressoValidado = objectMapper.readValue(resposta.getResponse().getContentAsString(), 
                EgressoValidoDTO.class);
        assertEquals(egressoValidoDTO, egressoValidado);
    }
}