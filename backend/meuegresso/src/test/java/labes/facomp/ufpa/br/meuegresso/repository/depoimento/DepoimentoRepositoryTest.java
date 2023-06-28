package labes.facomp.ufpa.br.meuegresso.repository.depoimento;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

/**
 * Classe que testa as features do DepoimentoRepository
 *
 * @author Bruno Eiki
 * @since 24/03/2023
 */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
class DepoimentoRepositoryTest {

    @Autowired
    DepoimentoRepository depoimentoRepository;

    @Autowired
    private EgressoRepository egressoRepository;

    @Autowired
    private GeneroRepository generoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    private DepoimentoModel depoimentoModel;
        
    
    private EgressoModel egressoModel;
    
    private GeneroModel generoModel;

    private UsuarioModel usuarioModel;

    private final static Integer ID = 1;
    private final static String DESCRICAO = "DescricaoTeste";

    @BeforeEach
    void setUp() {
        generoModel = new GeneroModel();
        generoModel.setId(1);
        generoModel.setNome("Masculino");
        generoModel = generoRepository.save(generoModel);

        usuarioModel = UsuarioModel.builder()
                .id(1)
                .nome("John")
                .username("john123")
                .email("john@example.com")
                .password("password123")
                .build();
        usuarioModel.setGrupos(Set.of(Grupos.ADMIN));
        usuarioModel = usuarioRepository.save(usuarioModel);

        egressoModel = EgressoModel.builder()
                .id(1)
                .nascimento(LocalDate.parse("1999-10-20"))
                .genero(generoModel)
                .matricula("202003940011")
                .interesseEmPos(true)
                .lattes("null")
                .linkedin("null")
                .usuario(usuarioModel)
                .build();
        egressoModel.setCreatedBy(usuarioModel.getId());

        egressoModel = egressoRepository.save(egressoModel);

        depoimentoModel = DepoimentoModel.builder()
            .id(ID)
            .descricao(DESCRICAO)
            .egresso(egressoModel)
            .build();

        depoimentoModel.setCreatedBy(usuarioModel.getId());

        depoimentoModel = depoimentoRepository.save(depoimentoModel);
    }

    /**
     * Método que testa o repositório que retorna todos os Depoimentos
     *
     * @author Bruno Eiki
     * @since 29/04/2023
     */
    @Test
    void testFindAll() {

        List<DepoimentoModel> response = depoimentoRepository.findAll();

        assertNotNull(response);
        assertEquals(List.of(depoimentoModel), response);
    }

    @Test
    void testExistsByIdAndCreatedById() {
        Boolean response = depoimentoRepository.existsByIdAndCreatedBy(depoimentoModel.getId(), usuarioModel.getId());

        assertNotNull(response);
        assertTrue(response);
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
