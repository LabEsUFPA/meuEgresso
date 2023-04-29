package labes.facomp.ufpa.br.meuegresso.service.egresso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.mockito.BDDMockito;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModelId;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoColacaoRepository;

/**
 * Class que implementa testes para o EgressoColacaoService.
 * 
 * @author Pedro Inácio
 * @since 28/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
public class EgressoColacaoServiceTest {

    private static final EgressoColacaoModelId ID = new EgressoColacaoModelId();
    private static final EgressoModel EGRESSO = new EgressoModel();
    private static final TitulacaoModel COLACAO = new TitulacaoModel();
    private static final LocalDate DATA_INGRESSO = LocalDate.parse("2016-06-06");
    private static final LocalDate DATA_CONCLUSAO = LocalDate.parse("2020-06-06");
    private static final EmpresaModel EMPRESA = new EmpresaModel();
    private static final CursoModel CURSO = new CursoModel();

    @Autowired
    private EgressoColacaoService egressoColacaoService;

    EgressoColacaoModel testEgresso;

    @MockBean
    private EgressoColacaoRepository repository;

    /**
     * Metodo para testar a criacao de um EgressoColacaoModel com adicionar Egresso.
     * 
     * @author Pedro Inácio
     * @since 28/04/2023
     */

    @Test
    @Order(1)
    public void testSave() {

        BDDMockito.given(repository.save(Mockito.any(EgressoColacaoModel.class)))
                .willReturn(getMockEgressoColacao());

        EgressoColacaoModel response = egressoColacaoService.save(new EgressoColacaoModel());

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(EGRESSO, response.getEgresso());
        assertEquals(COLACAO, response.getColacao());
        assertEquals(DATA_INGRESSO, response.getIngresso());
        assertEquals(DATA_CONCLUSAO, response.getConclusao());
        assertEquals(EMPRESA, response.getEmpresa());
        assertEquals(CURSO, response.getCurso());
    }

    /**
     * Metodo para testar o metodo findAll.
     * 
     * @author Pedro Inácio
     * @since 28/04/2023
     */
    @Test
    @Order(2)
    public void testFindAll() {
        BDDMockito.given(egressoColacaoService.findAll())
                .willReturn(getMockEgressoColacaoLista());
        // .willReturn(List.of(getMockEgressoColacao()));

        List<EgressoColacaoModel> response = egressoColacaoService.findAll();
        assertNotNull(response);
    }

    /**
     * Metodo para testar o findById.
     * 
     * @author Pedro Inácio
     * @since 28/04/2023
     */
    // @Test
    // @Order(3)
    // public void testFindByUsuarioId() {
    // BDDMockito.given(egressoColacaoService.findByUsuarioId(Mockito.anyInt()))
    // .willReturn(getMockEgressoColacao());

    // EgressoColacaoModel response = egressoColacaoService.findByUsuarioId(ID);
    // assertNotNull(response);
    // }

    /**
     * Metodo para testar o update.
     * 
     * @author Pedro Inácio
     * @since 28/04/2023
     */
    @Test
    @Order(3)
    public void testUpdate() {
        try {
            BDDMockito.given(egressoColacaoService.update(Mockito.any(EgressoColacaoModel.class)))
                    .willReturn(getMockEgressoColacao());
            EgressoColacaoModel response = egressoColacaoService.update(getMockEgressoColacao());
            assertNotNull(response);
        } catch (Exception e) {
            e.getMessage();
        }
    }

    /**
     * Metodo para testar o deleteById.
     * 
     * @author Pedro Inácio
     * @since 28/04/2023
     */
    @Test
    @Order(4)

    public void testDeletarEgresso() {

        BDDMockito.given(egressoColacaoService.deleteById(Mockito.any(
                EgressoColacaoModelId.class)))
                .willReturn(true);

        Boolean response = egressoColacaoService.deleteById(ID);
        assertTrue(response);
    }

    /**
     * Metodo para testar o existsByIdAndCreatedById.
     * 
     * @author Pedro Inácio
     * @since 28/04/2023
     */
    @Test
    @Order(5)
    public void testExistsByIdAndCreatedById() {

        BDDMockito.given(egressoColacaoService.existsByIdAndCreatedById(Mockito.any(
                EgressoColacaoModelId.class), Mockito.anyInt()))
                .willReturn(true);

        Boolean response = egressoColacaoService.existsByIdAndCreatedById(ID, 1);
        assertTrue(response);
    }

    /**
     * Metodo que preenche um mock de um EgressoColacaoModel para retorno dos testes
     * 
     * @author Pedro Inácio
     * @since 28/04/2023
     * 
     * @return <code>egressoColacaoTeste</code> object
     */
    private EgressoColacaoModel getMockEgressoColacao() {
        EgressoColacaoModel egressoColacaoTest = new EgressoColacaoModel(ID, EGRESSO, COLACAO, DATA_INGRESSO,
                DATA_CONCLUSAO, EMPRESA, CURSO);
        /*
         * EgressoColacaoModel egressoColacaoTest = EgressoColacaoModel.builder()
         * .id(ID)
         * .egresso(EGRESSO)
         * .empresa(EMPRESA)
         * .areaAtuacao(AREA_ATUACAO)
         * .FaixaSalarial(FAIXA_SALARIAL)
         * .build();
         */
        return egressoColacaoTest;
    }

    /**
     * Metodo que preenche um mock de uma lista de EgressoColacaoModel para retorno
     * dos testes
     * 
     * @author Pedro Inácio
     * @since 28/04/2023
     * 
     * @return <code>egressoColacaoLista</code> object
     */
    private List<EgressoColacaoModel> getMockEgressoColacaoLista() {
        List<EgressoColacaoModel> egressoColacaoLista = new ArrayList<>();
        EgressoColacaoModel egressoColacaoTest = new EgressoColacaoModel(ID, EGRESSO, COLACAO, DATA_INGRESSO,
                DATA_CONCLUSAO, EMPRESA, CURSO);
        /*
         * EgressoColacaoModel egressoColacaoTest = EgressoColacaoModel.builder()
         * .id(ID)
         * .egresso(EGRESSO)
         * .empresa(EMPRESA)
         * .areaAtuacao(AREA_ATUACAO)
         * .FaixaSalarial(FAIXA_SALARIAL)
         * .build();
         */
        EgressoColacaoModel egressoColacaoTest2 = new EgressoColacaoModel(ID, EGRESSO, COLACAO, DATA_INGRESSO,
                DATA_CONCLUSAO, EMPRESA, CURSO);
        /*
         * EgressoColacaoModel egressoColacaoTest2 = EgressoColacaoModel.builder()
         * .id(ID)
         * .egresso(EGRESSO)
         * .empresa(EMPRESA)
         * .areaAtuacao(AREA_ATUACAO)
         * .FaixaSalarial(FAIXA_SALARIAL)
         * .build();
         */

        egressoColacaoLista.add(egressoColacaoTest);
        egressoColacaoLista.add(egressoColacaoTest2);

        return egressoColacaoLista;
    }

    // @AfterAll
    // private void tearDown() {
    // //
    // }
}
