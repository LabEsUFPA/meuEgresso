package labes.facomp.ufpa.br.meuegresso.repository.endereco;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

/**
 * Classe que testa as features do EnderecoRepository
 *
 * @author Pedro Inácio
 * @since 10/06/2023
 */
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_CLASS)
@RunWith(SpringRunner.class)
@DataJpaTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
class EnderecoRepositoryTest {

    @Autowired
    private EnderecoRepository enderecoRepository;
    
    @Autowired
    private EgressoRepository egressoRepository;

    @Autowired
    private GeneroRepository generoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    private EnderecoModel enderecoModel;
    
    private EgressoModel egressoModel;
    
    private GeneroModel generoModel;

    private UsuarioModel usuarioModel;

    private final static Integer ID = 1;
    private final static String CIDADE = "cidadeTeste";
    private final static String ESTADO = "estadoTeste";
    private final static String PAIS = "paisTeste";


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

        enderecoModel = EnderecoModel.builder()
            .id(ID)
            .cidade(CIDADE)
            .estado(ESTADO)
            .pais(PAIS)
            .build();

        enderecoModel.setCreatedBy(usuarioModel.getId());

        enderecoModel = enderecoRepository.save(enderecoModel);
    }

    /**
     * Método que testa o repositório que retorna todos os Enderecos
     *
     * @author Pedro Inácio
     * @since 10/06/2023
     */
    @Test
    void testFindAll() {
        List<EnderecoModel> response = enderecoRepository.findAll();

        assertNotNull(response);
        assertEquals(List.of(enderecoModel), response);
    }
    
    @Test
    void testFindByCidadeIgnoreCaseAndEstadoIgnoreCaseAndPaisIgnoreCase() {
        Optional<EnderecoModel> response = enderecoRepository.findByCidadeIgnoreCaseAndEstadoIgnoreCaseAndPaisIgnoreCase(enderecoModel.getCidade(), enderecoModel.getEstado(), enderecoModel.getPais());
        
        assertNotNull(response);
        assertEquals(enderecoModel, response.get());
    }
    
    @Test
    void testExistsByIdAndCreatedById() {
        Boolean response = enderecoRepository.existsByIdAndCreatedBy(enderecoModel.getId(), enderecoModel.getCreatedBy());

        assertNotNull(response);
        assertTrue(response);
    }

    /**
     * Metodo para remover todos os dados do repository.
     *
     * @author Pedro Inácio
     * @since 10/06/2023
     */
    @AfterAll
    public void tearDown() {
        enderecoRepository.deleteAll();
    }
}
