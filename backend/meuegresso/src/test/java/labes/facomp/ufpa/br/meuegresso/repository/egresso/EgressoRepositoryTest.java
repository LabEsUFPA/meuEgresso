package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.model.CotaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;

/**
 * Classe que implementa testes das funcionalides de EgressoRepository
 *
 * @author Pedro Inácio
 * @since 28/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")
public class EgressoRepositoryTest {

    @Autowired
    private EgressoRepository egressoRepository;

    private EgressoModel testarEgresso;

    @BeforeEach
    public void setUp() {
        testarEgresso = new EgressoModel();
        testarEgresso.setId(1);
        testarEgresso.setNascimento(LocalDate.parse("1999-10-20"));
        testarEgresso.setInteresseEmPos(true);
        testarEgresso.setLattes("https://lattes.cnpq.br/");
        testarEgresso.setLinkedin("https://linkedin.com/");
        testarEgresso.setCota(new CotaModel(1, "null", null));
        testarEgresso.setMatricula("20200464222");
        testarEgresso.setEndereco(new EnderecoModel(1, "null", "null", "null", null));
        testarEgresso.setGenero(new GeneroModel(1, "null"));

        egressoRepository.save(testarEgresso);
    }

    @Test
    public void testSave() {
    
     EgressoModel.builder()
        .id(1)
        .nascimento(LocalDate.parse("1999-10-20"))
        .interesseEmPos(true)
        .lattes("https://lattes.cnpq.br/")
        .linkedin("https://linkedin.com/")
        .build();
        EgressoModel response = egressoRepository.save(testarEgresso);
        assertNotNull(response);
    }


    @Test
    public void testFindAll() {

        List<EgressoModel> testar = egressoRepository.findAll();

        assertNotNull(testar);
    }

    @Test
    public void testfindByUsuarioId(Integer idUsuario) {
        EgressoModel testar = egressoRepository.findByUsuarioId(idUsuario).orElseThrow();
        assertNotNull(testar);
    }

    @Test
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