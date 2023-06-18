package labes.facomp.ufpa.br.meuegresso.service.areaemprego;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.mockito.BDDMockito;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AreaEmpregoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.areaemprego.AreaEmpregoRepository;

@SpringBootTest
@DirtiesContext
@ActiveProfiles("test")
public class AreaEmpregoServiceTest {

    @Autowired
    private AreaEmpregoService areaEmpregoService;

    @MockBean
    private AreaEmpregoRepository areaEmpregoRepository;

    private static final Integer ID = 1;
    private static final String NOME = "Emprego1";

    @Test
    @Order(1)
    void testSave() {
        BDDMockito.given(areaEmpregoRepository.save(Mockito.any(AreaEmpregoModel.class)))
                .willReturn(getMockAreaEmprego());

        AreaEmpregoModel response = areaEmpregoService.save(new AreaEmpregoModel());

        assertNotNull(response);
        assertEquals(ID, response.getId());
        assertEquals(NOME, response.getNome());
    }

    @Test
    @Order(2)
    void testFindAll() {
        BDDMockito.given(areaEmpregoService.findAll()).willReturn(List.of(getMockAreaEmprego()));

        List<AreaEmpregoModel> response = areaEmpregoService.findAll();

        assertNotNull(response);
        assertEquals(response, List.of(getMockAreaEmprego()));
    }

    @Test
    @Order(3)
    void testFindByNome() {
        BDDMockito.given(areaEmpregoRepository.findByNomeIgnoreCase(NOME)).willReturn(Optional.of(getMockAreaEmprego()));

        AreaEmpregoModel response = areaEmpregoService.findByNome(NOME);

        assertNotNull(response);
        assertEquals(NOME, response.getNome());
    }

    @Test
    @Order(4)
    void testFindById() {
        BDDMockito.given(areaEmpregoRepository.findById(ID)).willReturn(Optional.of(getMockAreaEmprego()));

        AreaEmpregoModel response = areaEmpregoService.findById(ID);

        assertNotNull(response);
        assertEquals(ID, response.getId());
    }

    @Test
    @Order(5)
    void testUpdate() throws InvalidRequestException {
        BDDMockito.given(areaEmpregoRepository.save(Mockito.any(AreaEmpregoModel.class)))
                .willReturn(getMockAreaEmprego());

        AreaEmpregoModel response = areaEmpregoService.update(getMockAreaEmprego());

        assertNotNull(response);
        assertEquals(response, getMockAreaEmprego());
    }

    @Test
    @Order(6)
    void testExistsByIdAndCreatedById() {
        BDDMockito.given(areaEmpregoRepository.existsByIdAndCreatedById(Mockito.anyInt(), Mockito.anyInt()))
                .willReturn(true);

        Boolean response = areaEmpregoService.existsByIdAndCreatedById(1,1);
        assertTrue(response);
    }

    @Test
    @Order(7)
    void testDeleteById() {
        Mockito.when(areaEmpregoRepository.findById(Mockito.anyInt()))
                .thenReturn(Optional.of(getMockAreaEmprego()));

        Mockito.when(areaEmpregoRepository.existsById(Mockito.anyInt()))
                .thenReturn(true);

        Boolean response = areaEmpregoService.deleteById(ID);
        assertTrue(response);
    }

    private AreaEmpregoModel getMockAreaEmprego() {
        AreaEmpregoModel areaEmpregoModel = AreaEmpregoModel.builder()
                .id(ID)
                .nome(NOME)
                .build();
        return areaEmpregoModel;
    }
}
