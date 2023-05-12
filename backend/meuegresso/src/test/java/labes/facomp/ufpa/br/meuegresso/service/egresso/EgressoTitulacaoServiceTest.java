package labes.facomp.ufpa.br.meuegresso.service.egresso;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
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
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoTitulacaoRepository;

/**
 * Classe que implementa testes para o EgressoTitulacaoService.
 *
 * @author Pedro Inácio
 * @since 28/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
class EgressoTitulacaoServiceTest {

    private static final EgressoTitulacaoModelId ID = new EgressoTitulacaoModelId();
    private static final EgressoModel EGRESSO = new EgressoModel();
    private static final TitulacaoModel COLACAO = new TitulacaoModel();
    private static final EmpresaModel EMPRESA = new EmpresaModel();
    private static final CursoModel CURSO = new CursoModel();

    @Autowired
    private EgressoTitulacaoService EgressoTitulacaoService;

    EgressoTitulacaoModel testEgresso;

    @MockBean
    private EgressoTitulacaoRepository repository;

    /**
     * Metodo para testar a criacao de um EgressoTitulacaoModel com save.
     *
     * @author Pedro Inácio
     * @since 28/04/2023
     */

    @Test
    void testSave() {

        BDDMockito.given(repository.save(Mockito.any(EgressoTitulacaoModel.class)))
                .willReturn(getMockEgressoTitulacao());

        EgressoTitulacaoModel response = EgressoTitulacaoService.save(new EgressoTitulacaoModel());

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(EGRESSO, response.getEgresso());
        assertEquals(COLACAO, response.getTitulacao());
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
    void testFindAll() {
        BDDMockito.given(repository.findAll())
                .willReturn(getMockEgressoTitulacaoLista());

        List<EgressoTitulacaoModel> response = EgressoTitulacaoService.findAll();
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
        BDDMockito.given(repository.findById(Mockito.any(EgressoTitulacaoModelId.class)))
                .willReturn(Optional.ofNullable(getMockEgressoTitulacao()));

        EgressoTitulacaoModel response = EgressoTitulacaoService.findById(ID);
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
            BDDMockito.given(repository.save(Mockito.any(EgressoTitulacaoModel.class)))
                    .willReturn(getMockEgressoTitulacao());
            EgressoTitulacaoModel response = EgressoTitulacaoService.update(getMockEgressoTitulacao());
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
                EgressoTitulacaoModelId.class), Mockito.anyInt()))
                .willReturn(true);

        Boolean response = EgressoTitulacaoService.existsByIdAndCreatedById(ID, 1);
        assertTrue(response);
    }

    /**
     * Metodo para testar o deleteById.
     *
     * @author Pedro Inácio
     * @since 28/04/2023
     */
    @Test
    void testDeletarEgresso() {

        BDDMockito.given(EgressoTitulacaoService.deleteById(Mockito.any(
                EgressoTitulacaoModelId.class)))
                .willReturn(true);

        Boolean response = EgressoTitulacaoService.deleteById(ID);
        assertTrue(response);
    }

    /**
     * Metodo que preenche um mock de um EgressoTitulacaoModel para retorno dos
     * testes
     *
     * @author Pedro Inácio
     * @since 28/04/2023
     *
     * @return <code>EgressoTitulacaoTeste</code> object
     */
    private EgressoTitulacaoModel getMockEgressoTitulacao() {
        EgressoTitulacaoModel EgressoTitulacaoTest = new EgressoTitulacaoModel(ID, EGRESSO, COLACAO, EMPRESA, CURSO);

        return EgressoTitulacaoTest;
    }

    /**
     * Metodo que preenche um mock de uma lista de EgressoTitulacaoModel para
     * retorno
     * dos testes
     *
     * @author Pedro Inácio
     * @since 28/04/2023
     *
     * @return <code>EgressoTitulacaoLista</code> object
     */
    private List<EgressoTitulacaoModel> getMockEgressoTitulacaoLista() {
        List<EgressoTitulacaoModel> EgressoTitulacaoLista = new ArrayList<>();
        EgressoTitulacaoModel EgressoTitulacaoTest = new EgressoTitulacaoModel(ID, EGRESSO, COLACAO, EMPRESA, CURSO);
        EgressoTitulacaoModel EgressoTitulacaoTest2 = new EgressoTitulacaoModel(ID, EGRESSO, COLACAO, EMPRESA, CURSO);

        EgressoTitulacaoLista.add(EgressoTitulacaoTest);
        EgressoTitulacaoLista.add(EgressoTitulacaoTest2);

        return EgressoTitulacaoLista;
    }

    @AfterAll
    public void tearDown() {
        repository.deleteAll();
    }
}
