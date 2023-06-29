package labes.facomp.ufpa.br.meuegresso.service.titulacao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

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
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.repository.titulacao.TitulacaoRepository;

/**
 * Classe que implementa os testes da TitulacaoService
 * 
 * @author Pedro Inácio
 * @since 27/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })

class TitulacaoServiceTest {

    private static final String TITULACAO = "Doutorado";
    private static final Integer ID = 1;

    @Autowired
    private TitulacaoService titulacaoService;

    @MockBean
    private TitulacaoRepository titulacaoRepository;

    /**
     * Teste da função de save do atributo de "titulação",
     * que armazena os dados de uma titulação
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     */
    @Test
    void testSave() {

        BDDMockito.given(titulacaoRepository.save(Mockito.any(TitulacaoModel.class)))
                .willReturn(getMockTitulacaoModel());
        TitulacaoModel response = titulacaoService.save(new TitulacaoModel());

        assertNotNull(response);
        assertEquals("Graduacao", response.getNome());
    }

    /**
     * Teste da função deleteById() do atributo de "titulação",
     * que deleta uma titulação cadastrada a partir de seu ID
     * 
     * @author Eude Monteiro
     * @since 30/04/2023
     */
    @Test
    void testDeleteById() {
        Mockito.when(titulacaoRepository.findById(Mockito.anyInt()))
                .thenReturn(Optional.of(getMockTitulacaoModel()));

        Mockito.when(titulacaoRepository.existsById(Mockito.anyInt()))
                .thenReturn(true);

        Boolean response = titulacaoService.deleteById(ID);
        assertTrue(response);
    }

    /**
     * Teste da função findAll() do atributo de "titulação",
     * que encontra todas as titulações cadastradas.
     * 
     * @author Eude Monteiro
     * @since 30/04/2023
     */
    @Test
    void testfindAll() {
        TitulacaoModel titulacao1 = TitulacaoModel.builder()
                .nome("Mestrado")
                .id(1)
                .build();

        TitulacaoModel titulacao2 = TitulacaoModel.builder()
                .nome("Doutorado")
                .id(2)
                .build();

        List<TitulacaoModel> titulacoes = new ArrayList<>();
        titulacoes.add(titulacao1);
        titulacoes.add(titulacao2);

        given(titulacaoRepository.findAll()).willReturn(titulacoes);

        List<TitulacaoModel> titulacoesEncontradas = titulacaoService.findAll();

        assertEquals(titulacoes, titulacoesEncontradas);
        verify(titulacaoRepository, times(1)).findAll();
    }

    /**
     * Teste da função findById() do atributo de "titulação",
     * que encontra uma titulação pelo seu ID
     * 
     * @author Eude Monteiro
     * @since 30/04/2023
     */
    @Test
    void testFindById() {
        TitulacaoModel titulacao = new TitulacaoModel(1, "Mestrado");

        when(titulacaoRepository.findById(1)).thenReturn(Optional.of(titulacao));

        TitulacaoModel result = titulacaoService.findById(1);

        assertEquals(titulacao.getId(), result.getId());
        assertEquals(titulacao.getNome(), result.getNome());
    }

    /**
     * Teste da função de update do atributo de "titulação",
     * que atualiza dados de uma titulação cadastrada
     * 
     * @author Pedro Inácio, Eude Monteiro
     * @since 27/04/2023
     * @throws InvalidRequestException
     */
    @Test
    void testUpdate() throws InvalidRequestException {

        TitulacaoModel titulacao = TitulacaoModel.builder()
                .nome(TITULACAO)
                .id(ID)
                .build();

        given(titulacaoRepository.save(titulacao)).willReturn(titulacao);

        TitulacaoModel updatedGenero = titulacaoService.update(titulacao);

        assertEquals(titulacao, updatedGenero);
        verify(titulacaoRepository, times(1)).save(titulacao);
    }

    /**
     * Método que preenche um mock de uma titulacao para usar como return nos
     * testes.
     * 
     * @author Pedro Inácio
     * @since 27/04/2023
     * 
     * @return <code>TitulacaoModel</code> object
     */
    private TitulacaoModel getMockTitulacaoModel() {

        TitulacaoModel titulacaoModel = new TitulacaoModel(1, "Graduacao");
        return titulacaoModel;
    }

    /**
     * Método para remover todos os dados do teste de titulação
     * 
     * @author Pedro Inácio, Eude Monteiro
     * @since 27/04/2023
     */
    @AfterAll
    public void tearDown() {
        titulacaoRepository.deleteAll();
    }

}
