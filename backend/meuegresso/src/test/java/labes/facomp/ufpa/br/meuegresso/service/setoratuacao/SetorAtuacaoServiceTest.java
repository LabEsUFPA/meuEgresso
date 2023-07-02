package labes.facomp.ufpa.br.meuegresso.service.setoratuacao;

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
import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.repository.setoratuacao.SetorAtuacaoRepository;

/**
 * Class que implementa testes para o setorAtuacaoService.
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
class SetorAtuacaoServiceTest {

    private static final Integer ID = 1;
    private static final String NOME = "setorTeste";

    @Autowired
    private SetorAtuacaoService setorAtuacaoService;

    @MockBean
    private SetorAtuacaoRepository setorAtuacaoRepository;

    /**
     * Metodo para testar a criacao de um setorAtuacaoModel com save.
     * 
     * @author Pedro Inácio
     * @since 16/06/2023
     */
    @Test
    void testSave() {

        BDDMockito.given(setorAtuacaoRepository.save(Mockito.any(SetorAtuacaoModel.class)))
                .willReturn(getMockSetorAtuacao());

        SetorAtuacaoModel response = setorAtuacaoService.save(getMockSetorAtuacao());

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(NOME, response.getNome());
    }

    /**
     * Metodo para testar o metodo findAll.
     * 
     * @author Pedro Inácio
     * @since 16/06/2023
     */
    @Test
    void testFindAll() {
        BDDMockito.given(setorAtuacaoRepository.findAll())
                .willReturn(List.of(getMockSetorAtuacao()));

        List<SetorAtuacaoModel> response = setorAtuacaoService.findAll();
        assertNotNull(response);
        assertEquals(response, List.of(getMockSetorAtuacao()));

    }

    /**
     * Metodo para testar o findById.
     * 
     * @author Pedro Inácio
     * @since 16/06/2023
     */
    @Test
    void testFindById() {
        BDDMockito.given(setorAtuacaoRepository.findById(ID))
                .willReturn(Optional.of(getMockSetorAtuacao()));

        SetorAtuacaoModel response = setorAtuacaoService.findById(ID);

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
        BDDMockito.given(setorAtuacaoRepository.save(Mockito.any(SetorAtuacaoModel.class)))
                .willReturn(getMockSetorAtuacao());

        SetorAtuacaoModel setorAtuacaoUpdated = setorAtuacaoService.update(getMockSetorAtuacao());

        assertNotNull(setorAtuacaoUpdated);
        assertEquals(setorAtuacaoUpdated, getMockSetorAtuacao());
    }

    /**
     * Metodo para testar o deleteById.
     * 
     * @author Pedro Inácio
     * @since 16/06/2023
     */
    @Test
    void testDeleteById() {

        Mockito.when(setorAtuacaoRepository.findById(Mockito.anyInt()))
                .thenReturn(Optional.of(getMockSetorAtuacao()));
        Mockito.when(setorAtuacaoRepository.existsById(Mockito.anyInt()))
                .thenReturn(true);
        Boolean response = setorAtuacaoService.deleteById(ID);
        assertTrue(response);
    }

    /**
     * Metodo para testar o findByNome.
     * 
     * @author Pedro Inácio
     * @since 16/06/2023
     */
    @Test
    void testFindByNome() {
        BDDMockito.given(setorAtuacaoRepository.findByNomeIgnoreCase(NOME))
                .willReturn(Optional.of(getMockSetorAtuacao()));

        SetorAtuacaoModel response = setorAtuacaoService.findByNome(NOME);

        assertNotNull(response);
        assertEquals(ID, response.getId());
    }

    /**
     * Metodo para testar o findByNome.
     * 
     * @author Pedro Inácio
     * @since 16/06/2023
     */
    @Test
    void testExistByNome() {
        BDDMockito.given(setorAtuacaoRepository.existsByNomeIgnoreCase(NOME))
                .willReturn(true);

        Boolean response = setorAtuacaoService.existByNome(NOME);

        assertNotNull(response);
        assertEquals(true, response);
    }

    /**
     * Metodo que preenche um mock de um setorAtuacaoModel para retorno dos testes
     * 
     * @author Pedro Inácio
     * @since 16/06/2023
     * 
     * @return <code>setorAtuacaoTeste</code> object
     */
    private SetorAtuacaoModel getMockSetorAtuacao() {
        SetorAtuacaoModel setorAtuacaoTest = SetorAtuacaoModel.builder()
                .id(ID)
                .nome(NOME)
                .build();
        return setorAtuacaoTest;
    }

    @AfterAll
    public void tearDown() {
        setorAtuacaoRepository.deleteAll();
    }

}
