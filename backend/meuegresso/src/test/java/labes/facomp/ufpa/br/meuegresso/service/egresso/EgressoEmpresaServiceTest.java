package labes.facomp.ufpa.br.meuegresso.service.egresso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.AfterAll;
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

import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoEmpresaRepository;

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
class EgressoEmpresaServiceTest {

    private static final EgressoEmpresaModelId ID = new EgressoEmpresaModelId();
    private static final EgressoModel EGRESSO = new EgressoModel();
    private static final EmpresaModel EMPRESA = new EmpresaModel();
    private static final FaixaSalarialModel FAIXA_SALARIAL = new FaixaSalarialModel();

    @Autowired
    private EgressoEmpresaService egressoEmpresaService;

    @MockBean
    private EgressoEmpresaRepository repository;

    /**
     * Metodo para testar a criacao de um EgressoEmpresaModel com adicionar Egresso.
     *
     * @author Pedro Inácio
     * @since 28/04/2023
     */

    @Test
    @Order(1)
    void testSave() {

        BDDMockito.given(repository.save(Mockito.any(EgressoEmpresaModel.class)))
                .willReturn(getMockEgressoEmpresa());

        EgressoEmpresaModel response = egressoEmpresaService.save(new EgressoEmpresaModel());

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(EGRESSO, response.getEgresso());
        assertEquals(EMPRESA, response.getEmpresa());
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
    void testFindAll() {
        BDDMockito.given(egressoEmpresaService.findAll())
                .willReturn(getMockEgressoEmpresaLista());

        List<EgressoEmpresaModel> response = egressoEmpresaService.findAll();
        assertNotNull(response);
    }

    /**
     * Metodo para testar o findById.
     *
     * @author Pedro Inácio
     * @since 28/04/2023
     */
    @Test
    void testFindById() {
        BDDMockito.given(repository.findById(Mockito.any(EgressoEmpresaModelId.class)))
                .willReturn(Optional.ofNullable(getMockEgressoEmpresa()));

        EgressoEmpresaModel response = egressoEmpresaService.findById(ID);
        assertNotNull(response);
    }

    /**
     * Metodo para testar o update.
     *
     * @author Pedro Inácio
     * @since 28/04/2023
     */
    @Test
    void testUpdate() {
        try {
            BDDMockito.given(repository.save(Mockito.any(EgressoEmpresaModel.class)))
                    .willReturn(getMockEgressoEmpresa());
            EgressoEmpresaModel response = egressoEmpresaService.update(getMockEgressoEmpresa());
            assertNotNull(response);
        } catch (Exception e) {
            e.getMessage();
        }
    }

    /**
     * Metodo para testar o existsByIdAndCreatedById.
     *
     * @author Pedro Inácio
     * @since 28/04/2023
     */
    @Test
    void testExistsByIdAndCreatedById() {

        BDDMockito.given(repository.existsByIdAndCreatedById(Mockito.any(
                EgressoEmpresaModelId.class), Mockito.anyInt()))
                .willReturn(true);

        Boolean response = egressoEmpresaService.existsByIdAndCreatedById(ID, 1);
        assertTrue(response);
    }

    /**
     * Metodo para testar o deleteById.
     *
     * @author Pedro Inácio
     * @since 28/04/2023
     */
    @Test
    void testdeleteById() {

        BDDMockito.given(egressoEmpresaService.deleteById(Mockito.any(
                EgressoEmpresaModelId.class)))
                .willReturn(true);

        Boolean response = egressoEmpresaService.deleteById(ID);
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
        EgressoEmpresaModel egressoEmpresaTest = EgressoEmpresaModel.builder().id(ID).egresso(EGRESSO).empresa(EMPRESA)
                .faixaSalarial(FAIXA_SALARIAL).build();
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
        EgressoEmpresaModel egressoEmpresaTest = EgressoEmpresaModel.builder().id(ID).egresso(EGRESSO).empresa(EMPRESA)
                .faixaSalarial(FAIXA_SALARIAL).build();
        EgressoEmpresaModel egressoEmpresaTest2 = EgressoEmpresaModel.builder().id(ID).egresso(EGRESSO).empresa(EMPRESA)
                .faixaSalarial(FAIXA_SALARIAL).build();

        egressoEmpresaLista.add(egressoEmpresaTest);
        egressoEmpresaLista.add(egressoEmpresaTest2);

        return egressoEmpresaLista;
    }

    @AfterAll
    public void tearDown() {
        repository.deleteAll();
    }
}