package labes.facomp.ufpa.br.meuegresso.service.empresa;

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
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.repository.empresa.EmpresaRepository;

/**
 * Class que implementa testes para o EmpresaService.
 *
 * @author
 * @since
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
@AutoConfigureMockMvc
class EmpresaServiceTest {

    private static final Integer ID = 1;
    private static final String NOME = "Empresa";

    private static final Integer ID2 = 2;
    private static final String NOME2 = "Ufpa";

    @Autowired
    private EmpresaService empresaService;

    EmpresaModel testEmpresa;

    @MockBean
    private EmpresaRepository repository;

    /**
     * Metodo para testar a criacao de um EmpresaModel com save.
     *
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testSave() {

        BDDMockito.given(repository.save(Mockito.any(EmpresaModel.class)))
                .willReturn(getMockEmpresa());

        EmpresaModel response = empresaService.save(new EmpresaModel());

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(NOME, response.getNome());
    }

    /**
     * Metodo para testar o metodo findAll.
     *
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testFindAll() {

        BDDMockito.given(empresaService.findAll())
                .willReturn(getMockEmpresaLista());

        List<EmpresaModel> response = empresaService.findAll();
        assertEquals(getMockEmpresaLista(), response);
    }

    /**
     * Metodo para testar o findById.
     *
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testFindById() {

        BDDMockito.given(repository.findById(ID)).willReturn(Optional.of(getMockEmpresa()));

        EmpresaModel response = empresaService.findById(ID);
        assertEquals(getMockEmpresa(), response);

    }

    /**
     * Metodo para testar o update.
     *
     * @author Bruno Eiki
     * @throws InvalidRequestException
     * @since 27/04/2023
     */
    @Test
    void testUpdate() throws InvalidRequestException {

        EmpresaModel empresa = getMockEmpresa();
        String NOME_ATUALIZADO = "NOME ATUALIZADO";

        BDDMockito.given(repository.save(Mockito.any(EmpresaModel.class)))
                .willReturn(empresa);

        empresa.setNome(NOME_ATUALIZADO);

        EmpresaModel response = empresaService.update(empresa);
        assertNotNull(response);
        assertEquals(response.getNome(), NOME_ATUALIZADO);
    }

    /**
     * Metodo para testar o deleteById.
     *
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testDeleteById() {

        Mockito.when(repository.findById(Mockito.anyInt()))
                .thenReturn(Optional.of(getMockEmpresa()));
        Mockito.when(repository.existsById(Mockito.anyInt()))
                .thenReturn(true);

        Boolean response = empresaService.deleteById(ID);
        assertTrue(response);
    }

    /**
     * Metodo para testar o existsByIdAndCreatedById.
     *
     * @author Bruno Eiki
     * @since 27/04/2023
     */

    // @Test
    // void testExistsByIdAndCreatedById() {

    // BDDMockito.given(empresaService.existsByIdAndCreatedById(Mockito.anyInt(),
    // Mockito.anyInt()))
    // .willReturn(true);

    // Boolean response = empresaService.existsByIdAndCreatedById(ID, ID);
    // assertTrue(response);
    // }

    /**
     * Metodo que preenche um mock de um EmpresaModel para retorno dos testes
     *
     * @author Bruno Eiki
     * @since 27/04/2023
     *
     * @return <code>empresaTeste</code> object
     */
    private EmpresaModel getMockEmpresa() {
        EmpresaModel empresaTest = EmpresaModel.builder()
                .id(ID)
                .nome(NOME)
                .build();
        return empresaTest;
    }

    private List<EmpresaModel> getMockEmpresaLista() {
        List<EmpresaModel> empresaLista = new ArrayList<>();
        EmpresaModel empresaTest = EmpresaModel.builder()
                .id(ID)
                .nome(NOME)
                .build();

        EmpresaModel empresaTest2 = EmpresaModel.builder()
                .id(ID2)
                .nome(NOME2)
                .build();

        empresaLista.add(empresaTest);
        empresaLista.add(empresaTest2);

        return empresaLista;
    }

    @AfterAll
    public void tearDown() {
        repository.deleteAll();
    }
}
