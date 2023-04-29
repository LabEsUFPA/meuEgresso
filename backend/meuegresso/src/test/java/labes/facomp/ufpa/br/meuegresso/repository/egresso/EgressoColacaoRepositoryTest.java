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

import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModelId;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;

/**
 * Classe que implementa testes das funcionalides de EgressoColacaoRepository
 *
 * @author Pedro Inácio
 * @since 28/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")
public class EgressoColacaoRepositoryTest {

    @Autowired
    private EgressoColacaoRepository egressoColacaoRepository;

    private EgressoColacaoModel testarEgressoColacao;

    @BeforeEach
    public void setUp() {
        testarEgressoColacao = new EgressoColacaoModel();
        testarEgressoColacao.setId(new EgressoColacaoModelId(1, 1));
        testarEgressoColacao.setEgresso(new EgressoModel());
        testarEgressoColacao.setColacao(new TitulacaoModel(1, "Graduacao"));
        testarEgressoColacao.setIngresso(LocalDate.parse("2020-03-01"));
        testarEgressoColacao.setConclusao(LocalDate.parse("2025-03-01"));
        testarEgressoColacao.setEmpresa(new EmpresaModel(1, "El Cabis", "Capivaras"));
        testarEgressoColacao.setCurso(new CursoModel(1, "Computacao"));

        egressoColacaoRepository.save(testarEgressoColacao);
    }

    // @Test
    /*
     * public void testSave() {
     *
     * EgressoColacaoModel.builder()
     * .id(1)
     * .nascimento(null)
     * .interesseEmPos(true)
     * .lattes("https://lattes.cnpq.br/")
     * .linkedin("https://linkedin.com/")
     * .build();
     *
     * EgressoColacaoModel response = egressoColacaoRepository.save(testarEgressoColacao);
     * assertNotNull(response);
     * }
     */

    @Test
    public void testFindAll() {

        List<EgressoColacaoModel> testar = egressoColacaoRepository.findAll();

        assertNotNull(testar);
    }

    @Test
    public void testExistsByIdAndCreatedById() {

        Boolean response = egressoColacaoRepository.existsByIdAndCreatedById(
                testarEgressoColacao.getId(), testarEgressoColacao.getCreatedBy().getId());

        assertTrue(response);
    }

    @AfterEach
    public void tearDown() {
        testarEgressoColacao = null;
    }

}