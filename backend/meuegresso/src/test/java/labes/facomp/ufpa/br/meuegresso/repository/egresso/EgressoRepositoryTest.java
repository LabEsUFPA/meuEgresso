package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.Order;
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

import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;

/**
 * Class that implements tests of the UserAccountRepository functionalities
 *
 * @author Mariana Azevedo
 * @since 06/12/2020
 */
@SpringBootTest
// @AutoConfigureMockMvc
@ActiveProfiles("test")
/*
 * @TestInstance(Lifecycle.PER_CLASS)
 * 
 * @TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
 */
public class EgressoRepositoryTest {

    @Autowired
    private EgressoRepository egressoRepository;

    private EgressoModel testarEgresso;

    @BeforeEach
    public void setUp() {
        testarEgresso = new EgressoModel();
        testarEgresso.setId(1);
        testarEgresso.setNascimento(null);
        testarEgresso.setInteresseEmPos(true);
        testarEgresso.setLattes("https://lattes.cnpq.br/");
        testarEgresso.setLinkedin("https://linkedin.com/");
        /*
         * testarEgresso.setGenero(null);
         * testarEgresso.setEndereco(null);
         * testarEgresso.setUsuario(null);
         * testarEgresso.setDepoimentos(null);
         */

        egressoRepository.save(testarEgresso);
        /*
         * testarEgresso = EgressoModel.builder()
         * .id(1)
         * .nascimento(null)
         * .interesseEmPos(true)
         * .lattes("https://lattes.cnpq.br/")
         * .linkedin("https://linkedin.com/")
         * .build();
         */

        /*
         * EgressoModel response = egressoRepository.save(testarEgresso);
         * assertNotNull(response);
         */
    }

    /**
     * Method that test the repository that save an object Travel in the API.
     *
     * @author
     * @since 24/03/2020
     */
    // @Test
    // @Order(1)
    /*
     * public void testSave() {
     * 
     * EgressoModel.builder()
     * .id(1)
     * .nascimento(null)
     * .interesseEmPos(true)
     * .lattes("https://lattes.cnpq.br/")
     * .linkedin("https://linkedin.com/")
     * .build();
     * 
     * EgressoModel response = egressoRepository.save(testarEgresso);
     * assertNotNull(response);
     * }
     */

    @Test
    // @Order(2)
    public void testFindAll() {

        List<EgressoModel> testar = egressoRepository.findAll();

        assertNotNull(testar);
    }

    @Test
    // @Order(3)
    public void testfindByUsuarioId(Integer idUsuario) {
        EgressoModel testar = egressoRepository.findByUsuarioId(idUsuario).orElseThrow();
        assertNotNull(testar);
    }

    @Test
    // @Order(4)
    public void testExistsByIdAndCreatedById() {

        Boolean response = egressoRepository.existsByIdAndCreatedById(
                testarEgresso.getId(), testarEgresso.getCreatedBy().getId());

        assertTrue(response);
    }

    @AfterEach
    public void tearDown() {
        testarEgresso = null;
    }

}