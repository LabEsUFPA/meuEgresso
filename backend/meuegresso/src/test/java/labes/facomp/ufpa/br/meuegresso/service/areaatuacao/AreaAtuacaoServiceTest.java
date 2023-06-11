package labes.facomp.ufpa.br.meuegresso.service.areaatuacao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.mockito.BDDMockito;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AreaAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.repository.areaatuacao.AreaAtuacaoRepository;

@SpringBootTest
@DirtiesContext
@ActiveProfiles("test")
public class AreaAtuacaoServiceTest {

    @Autowired
    private AreaAtuacaoService areaAtuacaoService;

    @MockBean
    private AreaAtuacaoRepository areaAtuacaoRepository;

    private static final Integer ID = 1;
    private static final String NOME = "Area1";

    
    @Test
    @Order(1)
    void testSave() {
        BDDMockito.given(areaAtuacaoRepository.save(Mockito.any(AreaAtuacaoModel.class)))
                .willReturn(getMockAreaAtuacao());

        AreaAtuacaoModel response = areaAtuacaoService.save(new AreaAtuacaoModel());

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(NOME, response.getNome());
    }
    
    @Test
    @Order(1)
    void testFindAll() {
        BDDMockito.given(areaAtuacaoService.findAll()).willReturn(List.of(getMockAreaAtuacao()));

        List<AreaAtuacaoModel> response = areaAtuacaoService.findAll();

        assertNotNull(response);
        assertEquals(response, List.of(getMockAreaAtuacao()));

    }

    @Test
    @Order(3)
    void testFindByNome() {
        BDDMockito.given(areaAtuacaoRepository.findByNomeIgnoreCase(NOME)).willReturn(Optional.of(getMockAreaAtuacao()));

        AreaAtuacaoModel response = areaAtuacaoService.findByNome(NOME);

        assertNotNull(response);
        assertEquals(NOME, response.getNome());

    }

    @Test
    @Order(4)
    void testFindById() {
        BDDMockito.given(areaAtuacaoRepository.findById(ID)).willReturn(Optional.of(getMockAreaAtuacao()));

        AreaAtuacaoModel response = areaAtuacaoService.findById(ID);

        assertNotNull(response);
        assertEquals(ID, response.getId());
    }

    @Test
    @Order(5)
    void testUpdate() throws InvalidRequestException {
        BDDMockito.given(areaAtuacaoRepository.save(Mockito.any(AreaAtuacaoModel.class)))
                .willReturn(getMockAreaAtuacao());

        AreaAtuacaoModel areaAtualizada = areaAtuacaoService.update(getMockAreaAtuacao());

        assertNotNull(areaAtualizada);
        assertEquals(areaAtualizada, getMockAreaAtuacao());

    }

    @Test
    @Order(6)
    void testDeleteById() {

        Mockito.when(areaAtuacaoRepository.findById(Mockito.anyInt()))
                .thenReturn(Optional.of(getMockAreaAtuacao()));

        Mockito.when(areaAtuacaoRepository.existsById(Mockito.anyInt()))
                .thenReturn(true);

        Boolean response = areaAtuacaoService.deleteById(ID);
        assertTrue(response);

    }

    private AreaAtuacaoModel getMockAreaAtuacao() {
        AreaAtuacaoModel areaAtuacaoTest = AreaAtuacaoModel.builder()
                .id(ID)
                .nome(NOME)
                .build();
        return areaAtuacaoTest;
    }
}
