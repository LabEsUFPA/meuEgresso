package labes.facomp.ufpa.br.meuegresso.service.endereco;

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

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;
import labes.facomp.ufpa.br.meuegresso.repository.endereco.EnderecoRepository;

/**
 * Class que implementa testes para o EnderecoService.
 *
 * @author
 * @since
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
class EnderecoServiceTest {

    private static final Integer ID = 1;
    private static final String CIDADE = "Ananindeua";
    private static final String ESTADO = "Pará";
    private static final String PAIS = "Brasil";

    private static final Integer ID2 = 2;
    private static final String CIDADE2 = "São Paulo";
    private static final String ESTADO2 = "São Paulo";
    private static final String PAIS2 = "Brasil";

    @Autowired
    private EnderecoService enderecoService;

    EnderecoModel testEndereco;

    @MockBean
    private EnderecoRepository repository;

    /**
     * Metodo para testar a criacao de um EnderecoModel com save.
     *
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testSave() {

        BDDMockito.given(repository.save(Mockito.any(EnderecoModel.class)))
                .willReturn(getMockEndereco());

        EnderecoModel response = enderecoService.save(new EnderecoModel());

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(CIDADE, response.getCidade());
        assertEquals(ESTADO, response.getEstado());
        assertEquals(PAIS, response.getPais());

    }

    /**
     * Metodo para testar o metodo findAll.
     *
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testFindAll() {
        BDDMockito.given(repository.findAll())
                .willReturn(getMockEnderecoLista());
        // .willReturn(List.of(getMockEndereco()));

        List<EnderecoModel> response = enderecoService.findAll();

        assertEquals(getMockEnderecoLista(), response);
    }

    /**
     * Metodo para testar o findById.
     *
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testFindById() {
        BDDMockito.given(repository.findById(ID)).willReturn(Optional.of(getMockEndereco()));

        EnderecoModel response = enderecoService.findById(ID);
        assertEquals(getMockEndereco(), response);
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

        EnderecoModel testeEndereco = getMockEndereco();
        String CIDADE_ATUALIZADO = "GOTHAM_CITY";

        BDDMockito.given(repository.save(Mockito.any(EnderecoModel.class)))
                .willReturn(testeEndereco);

        testeEndereco.setCidade(CIDADE_ATUALIZADO);

        EnderecoModel response = enderecoService.update(getMockEndereco());
        assertNotNull(response);
        assertEquals(response.getCidade(), CIDADE_ATUALIZADO);
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
                .thenReturn(Optional.of(getMockEndereco()));
        Mockito.when(repository.existsById(Mockito.anyInt()))
                .thenReturn(true);

        Boolean response = enderecoService.deleteById(ID);
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

    // BDDMockito.given(enderecoService.existsByIdAndCreatedById(Mockito.anyInt(),
    // Mockito.anyInt()))
    // .willReturn(true);

    // Boolean response = enderecoService.existsByIdAndCreatedById(ID, ID);
    // assertTrue(response);
    // }

    /**
     * Metodo que preenche um mock de um EnderecoModel para retorno dos testes
     *
     * @author Bruno Eiki
     * @since 27/04/2023
     *
     * @return <code>enderecoTeste</code> object
     */
    private EnderecoModel getMockEndereco() {
        EnderecoModel enderecoTest = EnderecoModel.builder()
                .id(ID)
                .cidade(CIDADE)
                .estado(ESTADO)
                .pais(PAIS)
                .build();
        return enderecoTest;
    }

    private List<EnderecoModel> getMockEnderecoLista() {
        List<EnderecoModel> enderecoLista = new ArrayList<>();
        EnderecoModel enderecoTest = EnderecoModel.builder()
                .id(ID2)
                .cidade(CIDADE2)
                .estado(ESTADO2)
                .pais(PAIS2)
                .build();

        EnderecoModel enderecoTest2 = EnderecoModel.builder()
                .id(ID2)
                .cidade(CIDADE2)
                .estado(ESTADO2)
                .pais(PAIS2)
                .build();

        enderecoLista.add(enderecoTest);
        enderecoLista.add(enderecoTest2);

        return enderecoLista;
    }

    @AfterAll
    public void tearDown() {
        repository.deleteAll();
    }
}
