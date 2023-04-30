package labes.facomp.ufpa.br.meuegresso.repository.depoimento;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.mockito.BDDMockito;
import org.mockito.Mockito;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;

/**
 * Classe que testa as features do DepoimentoRepository
 * 
 * @author Bruno Eiki
 * @since 24/03/2023
 */
@DirtiesContext
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
class DepoimentoRepositoryTest {

    @MockBean
    DepoimentoRepository depoimentoRepository;

    private final static Integer ID = 1;
    private final static String DESCRICAO = "DescricaoTeste";

    DepoimentoModel depoimentoModel;

    /**
     * Método que testa o repositório que salva Depoimento
     * 
     * @author Bruno Eiki
     * @since 29/04/2023
     */
    @Test
    void testSave() {
        BDDMockito.given(depoimentoRepository.save(Mockito.any(DepoimentoModel.class)))
                .willReturn(getMockDepoimento());

        DepoimentoModel response = depoimentoRepository.save(depoimentoModel);

        assertNotNull(response);
        assertEquals(DESCRICAO, response.getDescricao());
    }

    /**
     * Método que testa o repositório que retorna todos os Depoimentos
     * 
     * @author Bruno Eiki
     * @since 29/04/2023
     */
    @Test
    void testFindAll() {

        depoimentoRepository.save(getMockDepoimento());
        List<DepoimentoModel> response = depoimentoRepository.findAll();

        assertNotNull(response);
        assertEquals(response, List.of(getMockDepoimento()));
    }

    private DepoimentoModel getMockDepoimento() {
        // GeneroModel genero = new GeneroModel(
        // 1,
        // "GeneroTeste");

        // EnderecoModel endereco = new EnderecoModel(
        // 1,
        // "Ananindeua",
        // "Pará",
        // "Brazil",
        // null);

        // l cota = new CotaModel(
        // 1,
        // "CotaTeste",
        // null);

        // el grupo = new GrupoModel(
        // 1,
        // "ADMIN",
        // null);

        // oModel> grupos = new HashSet<GrupoModel>();
        // dd(grupo);

        // UsuarioModel usuario = new UsuarioModel(
        // 1,
        // "username",
        // "password",
        // "email@gmail.com",
        // "nome",
        // null,
        // grupos);

        // Set<UsuarioModel> usuarios = new HashSet<UsuarioModel>();
        // .add(usuario);
        // tUsuarios(usuarios);

        // odel egresso = new EgressoModel(
        // 1,
        // LocalDate.parse("2000-05-05"),
        // genero,
        // "202004940020",
        // false,
        // false,
        // "lattes",
        // "linkedin",
        // endereco,
        // cota,
        // usuario,
        // null);

        // toModel depoimentoTest = new DepoimentoModel(
        // 1,
        // DESCRICAO,
        // egresso);

        // imentoModel> depoimentos = new HashSet<DepoimentoModel>();
        // tos.add(depoimentoTest);

        // egresso.setDepoimentos(depoimentos);
        DepoimentoModel depoimentoTest = DepoimentoModel.builder()
                .id(ID)
                .descricao(DESCRICAO)
                .build();
        return depoimentoTest;
    }

    /**
     * Metodo para remover todos os dados do repository.
     * 
     * @author Bruno Eiki
     * @since 29/04/2023
     */
    @AfterAll
    public void tearDown() {
        depoimentoRepository.deleteAll();
    }
}
