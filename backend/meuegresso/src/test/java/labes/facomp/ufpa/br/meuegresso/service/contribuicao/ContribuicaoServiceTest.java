package labes.facomp.ufpa.br.meuegresso.service.contribuicao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

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

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.contribuicao.ContribuicaoRepository;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;

/**
 * Class que implementa testes para o ContribuicaoService.
 * 
 * @author
 * @since
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
public class ContribuicaoServiceTest {

    private static final Integer ID = 1;
    private static final String DESCRICAO = "Contribui";

    @Autowired
    private ContribuicaoService contribuicaoService;

    @Autowired
    private UsuarioService userService;

    @MockBean
    private ContribuicaoRepository contribuicaoRepository;

    /**
     * Metodo para testar a criacao de um ContribuicaoModel com save.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(1)
    public void testSave() {

        BDDMockito.given(contribuicaoRepository.save(Mockito.any(ContribuicaoModel.class)))
                .willReturn(getMockContribuicao());

        ContribuicaoModel response = contribuicaoService.save(new ContribuicaoModel());

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
    @Order(2)
    public void testFindAll() {
        BDDMockito.given(contribuicaoService.findAll())
                .willReturn(List.of(getMockContribuicao()));

        List<ContribuicaoModel> response = contribuicaoService.findAll();

        assertNotNull(response);
        assertEquals(response, List.of(getMockContribuicao()));

    }

    /**
     * Metodo para testar o findById.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(3)
    public void testFindById() {
        BDDMockito.given(contribuicaoRepository.findById(ID))
                .willReturn(Optional.of(getMockContribuicao()));

        ContribuicaoModel response = contribuicaoService.findById(ID);

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
    @Order(4)
    public void testUpdate() throws InvalidRequestException {

        BDDMockito.given(contribuicaoRepository.save(Mockito.any(ContribuicaoModel.class)))
                .willReturn(getMockContribuicao());

        ContribuicaoModel contribuicaoAtualizada = contribuicaoService.update(getMockContribuicao());

        assertNotNull(contribuicaoAtualizada);
        assertEquals(contribuicaoAtualizada, getMockContribuicao());
    }

    /**
     * Metodo para testar o deleteById.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(5)
    public void testDeleteById() {

        BDDMockito.given(contribuicaoService.deleteById(ID))
                .willReturn(true);

        Boolean response = contribuicaoService.deleteById(ID);
        assertTrue(response);
    }

    /**
     * Metodo para testar o existsByIdAndCreatedById.
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     */
    @Test
    @Order(6)
    public void testExistsByIdAndCreatedById() {

        BDDMockito.given(contribuicaoRepository.existsByIdAndCreatedById(ID, ID))
                .willReturn(true);

        UsuarioModel usuario = new UsuarioModel(1, "username", "password", "email@gmail.com", "nome", null, null);
        ContribuicaoModel curso = getMockContribuicao();
        curso.setCreatedBy(usuario);

        userService.save(usuario);
        contribuicaoService.save(curso);

        Boolean response = contribuicaoService.existsByIdAndCreatedById(
                curso.getId(),
                curso.getCreatedBy().getId());
        assertTrue(response);
    }

    /**
     * Metodo que preenche um mock de um ContribuicaoModel para retorno dos testes
     * 
     * @author Bruno Eiki
     * @since 27/04/2023
     * 
     * @return <code>contribuicaoTeste</code> object
     */
    private ContribuicaoModel getMockContribuicao() {
        ContribuicaoModel contribuicaoTest = ContribuicaoModel.builder()
                .id(ID)
                .descricao(DESCRICAO)
                .build();
        return contribuicaoTest;
    }

    @AfterAll
    public void tearDown() {
        contribuicaoRepository.deleteAll();
    }
}
