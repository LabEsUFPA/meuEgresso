package labes.facomp.ufpa.br.meuegresso.service.depoimento;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

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
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.depoimento.DepoimentoRepository;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;

/**
 * Class que implementa testes para o DepoimentoService.
 * 
 * @author Bruno Eiki
 * @since 27/04/2023
 */
@DirtiesContext
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
class DepoimentoServiceTest {

    private static final Integer ID = 1;
    private static final String DESCRICAO = "Me formei";

    @Autowired
    private DepoimentoService depoimentoService;

    @Autowired
    private UsuarioService usuarioService;

    @MockBean
    private DepoimentoRepository depoimentoRepository;

    /**
     * Metodo para testar a criacao de um DepoimentoModel com save.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testSave() {

        BDDMockito.given(depoimentoRepository.save(Mockito.any(DepoimentoModel.class)))
                .willReturn(getMockDepoimento());

        DepoimentoModel response = depoimentoService.save(getMockDepoimento());

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(DESCRICAO, response.getDescricao());
    }

    /**
     * Metodo para testar o metodo findAll.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testFindAll() {
        BDDMockito.given(depoimentoRepository.findAll())
                .willReturn(List.of(getMockDepoimento()));

        List<DepoimentoModel> response = depoimentoService.findAll();
        assertNotNull(response);
        assertEquals(response, List.of(getMockDepoimento()));

    }

    /**
     * Metodo para testar o findById.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testFindById() {
        BDDMockito.given(depoimentoRepository.findById(ID))
                .willReturn(Optional.of(getMockDepoimento()));

        DepoimentoModel response = depoimentoService.findById(ID);

        assertNotNull(response);
        assertEquals(ID, response.getId());
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
        BDDMockito.given(depoimentoRepository.save(Mockito.any(DepoimentoModel.class)))
                .willReturn(getMockDepoimento());

        DepoimentoModel depoimentoUpdated = depoimentoService.update(getMockDepoimento());

        assertNotNull(depoimentoUpdated);
        assertEquals(depoimentoUpdated, getMockDepoimento());
    }

    /**
     * Metodo para testar o deleteById.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testDeleteById() {

        BDDMockito.given(depoimentoService.deleteById(ID))
                .willReturn(true);

        Boolean response = depoimentoService.deleteById(ID);
        assertTrue(response);
    }

    /**
     * Metodo para testar o existsByIdAndCreatedById.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    void testExistsByIdAndCreatedById() {

        BDDMockito.given(depoimentoRepository.existsByIdAndCreatedById(Mockito.anyInt(), Mockito.anyInt()))
                .willReturn(true);

        UsuarioModel usuario = new UsuarioModel(1, "username", "password", "email@gmail.com", "nome", null, null);
        DepoimentoModel curso = getMockDepoimento();
        curso.setCreatedBy(usuario);

        usuarioService.save(usuario);
        depoimentoService.save(curso);

        Boolean response = depoimentoService.existsByIdAndCreatedById(
                curso.getId(),
                curso.getCreatedBy().getId());
        assertTrue(response);
    }

    /**
     * Metodo que preenche um mock de um DepoimentoModel para retorno dos testes
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     * 
     * @return <code>depoimentoTeste</code> object
     */
    private DepoimentoModel getMockDepoimento() {
        DepoimentoModel depoimentoTest = DepoimentoModel.builder()
                .id(ID)
                .descricao(DESCRICAO)
                .build();
        return depoimentoTest;
    }

    @AfterAll
    public void tearDown() {
        depoimentoRepository.deleteAll();
    }

}
