package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.runner.RunWith;
import org.mockito.BDDMockito;
import org.mockito.Mockito;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;

/**
 * Classe que implementa testes das funcionalides de EgressoTitulacaoRepository
 *
 * @author Pedro Inácio
 * @since 28/04/2023
 */
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_CLASS)
@RunWith(SpringRunner.class)
@DataJpaTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
class EgressoTitulacaoRepositoryTest {

    @MockBean
    private EgressoTitulacaoRepository egressoTitulacaoRepository;


    @BeforeAll
    void setUp() {
        BDDMockito.given(egressoTitulacaoRepository.save(Mockito.any(EgressoTitulacaoModel.class)))
                .willReturn(getMockEgressoTitulacao());

        BDDMockito.given(egressoTitulacaoRepository.findAll())
        .willReturn(List.of(getMockEgressoTitulacao()));
    }

    @Test
    void testFindAll() {

        List<EgressoTitulacaoModel> testar = egressoTitulacaoRepository.findAll();

        assertNotNull(testar);
    }

    private EgressoTitulacaoModel getMockEgressoTitulacao() {
        return EgressoTitulacaoModel.builder()
                .id(EgressoTitulacaoModelId.builder().egressoId(1).titulacaoId(1).build())
                .egresso(EgressoModel.builder().id(1).build())
                .empresa(EmpresaModel.builder().id(1).build())
                .build();
    }
}