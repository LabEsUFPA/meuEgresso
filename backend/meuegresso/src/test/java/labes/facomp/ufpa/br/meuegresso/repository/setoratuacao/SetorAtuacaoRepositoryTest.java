package labes.facomp.ufpa.br.meuegresso.repository.setoratuacao;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

/**
 * Classe que testa as features do SetorAtuacaoRepository
 *
 * @author Pedro Inácio
 * @since 10/06/2023
 */
@DirtiesContext
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
class SetorAtuacaoRepositoryTest {

    @Autowired
    private SetorAtuacaoRepository setorAtuacaoRepository;
    
    @Autowired
    private EgressoRepository egressoRepository;

    @Autowired
    private GeneroRepository generoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    private SetorAtuacaoModel setorAtuacaoModel;
        
    
    private EgressoModel egressoModel;
    
    private GeneroModel generoModel;

    private UsuarioModel usuarioModel;

    private final static Integer ID = 1;
    private final static String SETOR = "setorTeste";

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
        egressoModel.setCreatedBy(usuarioModel);

        egressoModel = egressoRepository.save(egressoModel);

        setorAtuacaoModel = SetorAtuacaoModel.builder()
            .id(ID)
            .nome(SETOR)
            .build();

        setorAtuacaoModel.setCreatedBy(usuarioModel);

        setorAtuacaoModel = setorAtuacaoRepository.save(setorAtuacaoModel);
    }

    /**
     * Método que testa o repositório que retorna todos os SetorAtuacaos
     *
     * @author Pedro Inácio
     * @since 10/06/2023
     */
    @Test
    void testFindAll() {
        List<SetorAtuacaoModel> response = setorAtuacaoRepository.findAll();

        assertNotNull(response);
        assertEquals(List.of(setorAtuacaoModel), response);
    }
    
    @Test
    void testFindByNomeIgnoreCase() {
        Optional<SetorAtuacaoModel> response = setorAtuacaoRepository.findByNomeIgnoreCase(setorAtuacaoModel.getNome());
        
        assertNotNull(response);
        assertEquals(setorAtuacaoModel, response.get());
    }
    
    @Test
    void testExistsByNomeIgnoreCase() {
        Boolean response = setorAtuacaoRepository.existsByNomeIgnoreCase(setorAtuacaoModel.getNome());

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
        setorAtuacaoRepository.deleteAll();
    }
}
