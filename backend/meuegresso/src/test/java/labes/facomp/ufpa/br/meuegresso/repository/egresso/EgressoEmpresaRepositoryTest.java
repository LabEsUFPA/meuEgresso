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

import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;

/**
 * Classe que implementa testes das funcionalides de EgressoEmpresaRepository
 *
 * @author Pedro Inácio
 * @since 28/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")

public class EgressoEmpresaRepositoryTest {

    @Autowired
    private EgressoEmpresaRepository egressoEmpresaRepository;

    private EgressoEmpresaModel testarEgressoEmpresa;

    @BeforeEach
    public void setUp() {
        testarEgressoEmpresa = new EgressoEmpresaModel();
        testarEgressoEmpresa.setId(new EgressoEmpresaModelId());
        testarEgressoEmpresa.setEgresso(new EgressoModel());
        testarEgressoEmpresa.setEmpresa(new EmpresaModel());
        testarEgressoEmpresa.setFaixaSalarial(new FaixaSalarialModel());

        egressoEmpresaRepository.save(testarEgressoEmpresa);
    }

    // @Test
    /*
     * public void testSave() {
     *
     * EgressoEmpresaModel.builder()
     * .id(1)
     * .nascimento(null)
     * .interesseEmPos(true)
     * .lattes("https://lattes.cnpq.br/")
     * .linkedin("https://linkedin.com/")
     * .build();
     *
     * EgressoEmpresaModel response =
     * egressoEmpresaRepository.save(testarEgressoEmpresa);
     * assertNotNull(response);
     * }
     */

    @Test
    public void testFindAll() {

        List<EgressoEmpresaModel> testar = egressoEmpresaRepository.findAll();

        assertNotNull(testar);
    }

    @Test
    public void testExistsByIdAndCreatedById() {

        Boolean response = egressoEmpresaRepository.existsByIdAndCreatedById(
                testarEgressoEmpresa.getId(), testarEgressoEmpresa.getCreatedBy().getId());

        assertTrue(response);
    }

    @AfterEach
    public void tearDown() {
        testarEgressoEmpresa = null;
    }

}