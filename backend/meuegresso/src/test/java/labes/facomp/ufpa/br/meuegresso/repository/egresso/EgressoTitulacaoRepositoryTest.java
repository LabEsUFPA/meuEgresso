package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;

/**
 * Classe que implementa testes das funcionalides de EgressoTitulacaoRepository
 *
 * @author Pedro Inácio
 * @since 28/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")
public class EgressoTitulacaoRepositoryTest {

    @Autowired
    private EgressoTitulacaoRepository EgressoTitulacaoRepository;

    private EgressoTitulacaoModel testarEgressoTitulacao;

    @BeforeEach
    public void setUp() {
        testarEgressoTitulacao = new EgressoTitulacaoModel();
        testarEgressoTitulacao.setId(new EgressoTitulacaoModelId(1, 1));
        testarEgressoTitulacao.setEgresso(new EgressoModel());
        testarEgressoTitulacao.setTitulacao(new TitulacaoModel(1, "Graduacao"));
        testarEgressoTitulacao.setEmpresa(EmpresaModel.builder().id(1).nome("El Cabis").build());
        testarEgressoTitulacao.setCurso(new CursoModel(1, "Computacao"));

        EgressoTitulacaoRepository.save(testarEgressoTitulacao);
    }

    // @Test
    /*
     * public void testSave() {
     *
     * EgressoTitulacaoModel.builder()
     * .id(1)
     * .nascimento(null)
     * .interesseEmPos(true)
     * .lattes("https://lattes.cnpq.br/")
     * .linkedin("https://linkedin.com/")
     * .build();
     *
     * EgressoTitulacaoModel response =
     * EgressoTitulacaoRepository.save(testarEgressoTitulacao);
     * assertNotNull(response);
     * }
     */

    @Test
    public void testFindAll() {

        List<EgressoTitulacaoModel> testar = EgressoTitulacaoRepository.findAll();

        assertNotNull(testar);
    }

    @Test
    public void testExistsByIdAndCreatedById() {

        Boolean response = EgressoTitulacaoRepository.existsByIdAndCreatedById(
                testarEgressoTitulacao.getId(), testarEgressoTitulacao.getCreatedBy().getId());

        assertTrue(response);
    }

    @AfterEach
    public void tearDown() {
        testarEgressoTitulacao = null;
    }

}