package labes.facomp.ufpa.br.meuegresso.repository.cota;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.model.CotaModel;
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;
import labes.facomp.ufpa.br.meuegresso.model.EtniaModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.TrabalhoPublicadoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;

/**
 * Class that implements tests of the UserAccountRepository functionalities
 *
 * @author Mariana Azevedo
 * @since 06/12/2020
 */
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@SpringBootTest(webEnvironment=WebEnvironment.RANDOM_PORT)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
public class CotaRepositoryTest {

    @Autowired
    CotaRepository cotaRepository;


    EtniaModel etnia;
    GeneroModel genero;
    EnderecoModel endereco;
    GrupoModel grupo;
    UsuarioModel usuario;
    DepoimentoModel depoimento;
    TrabalhoPublicadoModel trabalhoPublicado;
    EgressoModel egresso;

    CotaModel testCota;



    /**
     * Method that test the repository that save an object Travel in the API.
     *
     * @author
     * @since 24/03/2020
     */
    @Test
    @Order(1)
    public void testSave() {

        CotaModel testarCota = CotaModel.builder()
                .id(1)
                .nome("Grupo")
                .build();

        CotaModel response = cotaRepository.save(testarCota);
        assertNotNull(response);
    }

    @Test
    @Order(2)
    public void testFindAll() {

        List<CotaModel> testar = cotaRepository.findAll();

        assertNotNull(testar);
    }

    @Test
    @Order(3)
    public void testExistsByIdAndCreatedById() {

        Boolean response = cotaRepository.existsByIdAndCreatedById(testCota.getId(), testCota.getCreatedBy().getId());

        assertTrue(response);
    }

}
