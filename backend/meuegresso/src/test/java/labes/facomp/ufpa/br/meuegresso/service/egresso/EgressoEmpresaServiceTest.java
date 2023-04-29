package labes.facomp.ufpa.br.meuegresso.service.egresso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

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
import org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;

/**
 * Class que implementa testes para o EgressoEmpresaService.
 * 
 * @author Pedro Inácio
 * @since 28/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
public class EgressoEmpresaServiceTest {

    private static final EgressoEmpresaModelId ID = new EgressoEmpresaModelId();
    private static final EgressoModel EGRESSO = new EgressoModel();
    private static final EmpresaModel EMPRESA = new EmpresaModel();
    private static final String AREA_ATUACAO = "area";
    private static final FaixaSalarialModel FAIXA_SALARIAL = new FaixaSalarialModel();

    @Autowired
    private EgressoEmpresaService egressoEmpresaService;

    EgressoEmpresaModel testEgresso;

    /**
     * Metodo para testar a criacao de um EgressoEmpresaModel com adicionar Egresso.
     * 
     * @author Pedro Inácio
     * @since 28/04/2023
     */

    @Test
    @Order(1)
    public void testSave() {

        BDDMockito.given(egressoEmpresaService.save(Mockito.any(EgressoEmpresaModel.class)))
                .willReturn(getMockEgressoEmpresa());

        EgressoEmpresaModel response = egressoEmpresaService.save(new EgressoEmpresaModel());

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(EGRESSO, response.getEgresso());
        assertEquals(EMPRESA, response.getEmpresa());
        assertEquals(AREA_ATUACAO, response.getAreaAtuacao());
        assertEquals(FAIXA_SALARIAL, response.getFaixaSalarial());
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
        BDDMockito.given(egressoEmpresaService.findAll())
                .willReturn(getMockEgressoEmpresaLista());
        // .willReturn(List.of(getMockEgressoEmpresa()));

        List<EgressoEmpresaModel> response = egressoEmpresaService.findAll();
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
    // BDDMockito.given(egressoEmpresaService.findByUsuarioId(Mockito.anyInt()))
    // .willReturn(getMockEgressoEmpresa());

    // EgressoEmpresaModel response = egressoEmpresaService.findByUsuarioId(ID);
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
            BDDMockito.given(egressoEmpresaService.update(Mockito.any(EgressoEmpresaModel.class)))
                    .willReturn(getMockEgressoEmpresa());
            EgressoEmpresaModel response = egressoEmpresaService.update(getMockEgressoEmpresa());
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

        BDDMockito.given(egressoEmpresaService.deleteById(Mockito.any(
                EgressoEmpresaModelId.class)))
                .willReturn(true);

        Boolean response = egressoEmpresaService.deleteById(ID);
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

        BDDMockito.given(egressoEmpresaService.existsByIdAndCreatedById(Mockito.any(
                EgressoEmpresaModelId.class), Mockito.anyInt()))
                .willReturn(true);

        Boolean response = egressoEmpresaService.existsByIdAndCreatedById(ID, 1);
        assertTrue(response);
    }

    /**
     * Metodo que preenche um mock de um EgressoEmpresaModel para retorno dos testes
     * 
     * @author Pedro Inácio
     * @since 28/04/2023
     * 
     * @return <code>egressoEmpresaTeste</code> object
     */
    private EgressoEmpresaModel getMockEgressoEmpresa() {
        EgressoEmpresaModel egressoEmpresaTest = new EgressoEmpresaModel(ID, EGRESSO, EMPRESA, AREA_ATUACAO,
                FAIXA_SALARIAL);
        return egressoEmpresaTest;
    }

    /**
     * Metodo que preenche um mock de uma lista de EgressoEmpresaModel para retorno
     * dos testes
     * 
     * @author Pedro Inácio
     * @since 28/04/2023
     * 
     * @return <code>egressoEmpresaLista</code> object
     */
    private List<EgressoEmpresaModel> getMockEgressoEmpresaLista() {
        List<EgressoEmpresaModel> egressoEmpresaLista = new ArrayList<>();
        EgressoEmpresaModel egressoEmpresaTest = new EgressoEmpresaModel(ID, EGRESSO, EMPRESA, AREA_ATUACAO,
                FAIXA_SALARIAL);
        EgressoEmpresaModel egressoEmpresaTest2 = new EgressoEmpresaModel(ID, EGRESSO, EMPRESA, AREA_ATUACAO,
                FAIXA_SALARIAL);

        egressoEmpresaLista.add(egressoEmpresaTest);
        egressoEmpresaLista.add(egressoEmpresaTest2);

        return egressoEmpresaLista;
    }

    // @AfterAll
    // private void tearDown() {
    // //
    // }
}