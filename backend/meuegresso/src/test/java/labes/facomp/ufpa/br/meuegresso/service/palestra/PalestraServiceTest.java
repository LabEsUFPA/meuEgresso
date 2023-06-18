package labes.facomp.ufpa.br.meuegresso.service.palestra;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;
import java.util.Optional;
import java.util.Set;

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

import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.PalestraModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.palestra.PalestraRepository;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;

/**
 * Class que implementa testes para o palestraService.
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
class PalestraServiceTest {

    private static final Integer ID = 1;
    private static final String DESCRICAO = "Me formei";

    @Autowired
    private PalestraService palestraService;

    @Autowired
    private UsuarioService usuarioService;

    @MockBean
    private PalestraRepository palestraRepository;

    /**
     * Metodo para testar a criacao de um palestraModel com save.
     * 
     * @author Pedro Inácio
     * @since 16/06/2023
     */
    @Test
    void testSave() {

        BDDMockito.given(palestraRepository.save(Mockito.any(PalestraModel.class)))
                .willReturn(getMockPalestra());

        PalestraModel response = palestraService.save(getMockPalestra());

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(DESCRICAO, response.getDescricao());
    }

    /**
     * Metodo para testar o metodo findAll.
     * 
     * @author Pedro Inácio
     * @since 16/06/2023
     */
    @Test
    void testFindAll() {
        BDDMockito.given(palestraRepository.findAll())
                .willReturn(List.of(getMockPalestra()));

        List<PalestraModel> response = palestraService.findAll();
        assertNotNull(response);
        assertEquals(response, List.of(getMockPalestra()));

    }

    /**
     * Metodo para testar o findById.
     * 
     * @author Pedro Inácio
     * @since 16/06/2023
     */
    @Test
    void testFindById() {
        BDDMockito.given(palestraRepository.findById(ID))
                .willReturn(Optional.of(getMockPalestra()));

        PalestraModel response = palestraService.findById(ID);

        assertNotNull(response);
        assertEquals(ID, response.getId());
    }

    /**
     * Metodo para testar o update.
     * 
     * @author Pedro Inácio
     * @throws InvalidRequestException
     * @since 16/06/2023
     */
    @Test
    void testUpdate() throws InvalidRequestException {
        BDDMockito.given(palestraRepository.save(Mockito.any(PalestraModel.class)))
                .willReturn(getMockPalestra());

        PalestraModel palestraUpdated = palestraService.update(getMockPalestra());

        assertNotNull(palestraUpdated);
        assertEquals(palestraUpdated, getMockPalestra());
    }

    /**
     * Metodo para testar o deleteById.
     * 
     * @author Pedro Inácio
     * @since 16/06/2023
     */
    @Test
    void testDeleteById() {

        Mockito.when(palestraRepository.findById(Mockito.anyInt()))
                .thenReturn(Optional.of(getMockPalestra()));
        Mockito.when(palestraRepository.existsById(Mockito.anyInt()))
                .thenReturn(true);
        Boolean response = palestraService.deleteById(ID);
        assertTrue(response);
    }

    /**
     * Metodo para testar o existsByIdAndCreatedById.
     * 
     * @author Pedro Inácio
     * @since 16/06/2023
     */
    @Test
    void testExistsByIdAndCreatedById() {

        BDDMockito.given(palestraRepository.existsByIdAndCreatedById(Mockito.anyInt(), Mockito.anyInt()))
                .willReturn(true);

        UsuarioModel usuarioModel = new UsuarioModel();
                usuarioModel.setUsername("username");
                usuarioModel.setNome("nome_test");
                usuarioModel.setEmail("teste@gmail.com");
                usuarioModel.setPassword("teste123");
                usuarioModel.setGrupos(Set.of(Grupos.ADMIN));
        PalestraModel curso = getMockPalestra();
        curso.setCreatedBy(usuarioModel);

        usuarioService.save(usuarioModel);
        palestraService.save(curso);

        Boolean response = palestraService.existsByIdAndCreatedById(
                curso.getId(),
                curso.getCreatedBy().getId());
        assertTrue(response);
    }

    /**
     * Metodo para testar o findByEgressoId.
     * 
     * @author Pedro Inácio
     * @since 16/06/2023
     */
    @Test
    void testFindByEgressoId() {
        BDDMockito.given(palestraRepository.findByEgressoId(ID))
                .willReturn(Optional.of(getMockPalestra()));

        PalestraModel response = palestraService.findByEgressoId(ID);

        assertNotNull(response);
        assertEquals(ID, response.getId());
    }
    
    /**
     * Metodo para testar o findByEgressoUsuarioId.
     * 
     * @author Pedro Inácio
     * @since 16/06/2023
     */
    @Test
    void testFindByEgressoUsuarioId() {
        BDDMockito.given(palestraRepository.findByEgressoUsuarioId(ID))
                .willReturn(Optional.of(getMockPalestra()));

        PalestraModel response = palestraService.findByEgressoUsuarioId(ID);

        assertNotNull(response);
        assertEquals(ID, response.getId());
    }

    /**
     * Metodo que preenche um mock de um palestraModel para retorno dos testes
     * 
     * @author Pedro Inácio
     * @since 16/06/2023
     * 
     * @return <code>palestraTeste</code> object
     */
    private PalestraModel getMockPalestra() {
        PalestraModel palestraTest = PalestraModel.builder()
                .id(ID)
                .descricao(DESCRICAO)
                .build();
        return palestraTest;
    }

    @AfterAll
    public void tearDown() {
        palestraRepository.deleteAll();
    }

}
