package labes.facomp.ufpa.br.meuegresso.repository.genero;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.grupo.GrupoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

/**
 * Classe que testa as features do generoRepository
 * 
 * @author Pedro Inácio
 * @since 10/06/2023
 */
@DirtiesContext
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
class GeneroRepositoryTest {

    @Autowired
    private GeneroRepository generoRepository;
    
    @Autowired
    private EgressoRepository egressoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private GrupoRepository grupoRepository;

    private GeneroModel generoModel;
    
    private GrupoModel grupoModel;
    
    private EgressoModel egressoModel;
    

    private UsuarioModel usuarioModel;
    
    private final static Integer ID = 1;
    private final static String GENERO = "GeneroTeste";

    @BeforeEach
    void setUp() {

        grupoModel = GrupoModel.builder().id(1).nomeGrupo("ADMIN").build();
        grupoModel = grupoRepository.save(grupoModel);
        Set<GrupoModel> grupos = new HashSet<>();
        grupos.add(grupoModel);

        usuarioModel = UsuarioModel.builder()
                .id(1)
                .nome("John")
                .username("john123")
                .email("john@example.com")
                .password("password123")
                .grupos(grupos)
                .build();
        usuarioModel = usuarioRepository.save(usuarioModel);

        
        egressoModel = EgressoModel.builder()
                .id(1)
                .nascimento(LocalDate.parse("1999-10-20"))
                //.genero(generoModel)
                .matricula("202003940011")
                .interesseEmPos(true)
                .lattes("null")
                .linkedin("null")
                .usuario(usuarioModel)
                .build();
        
        generoModel = GeneroModel.builder()
                .id(ID)
                .nome(GENERO)
                .build();
        
        generoModel.setCreatedBy(usuarioModel);

        generoModel = generoRepository.save(generoModel);

        egressoModel.setGenero(generoModel);
        egressoModel.setCreatedBy(usuarioModel);

        egressoModel = egressoRepository.save(egressoModel);
    }
    /**
     * Método que testa o repositório que salva genero
     * 
     * @author Pedro Inácio
     * @since 10/06/2023
     */
    @Test
    void testSave() {

        GeneroModel response = generoRepository.save(generoModel);

        assertNotNull(response);
        assertEquals(GENERO, response.getNome());
    }

    /**
     * Método que testa o repositório que retorna todos os generos
     * 
     * @author Pedro Inácio
     * @since 10/06/2023
     */
    @Test
    void testFindAll() {

        List<GeneroModel> response = generoRepository.findAll();

        assertNotNull(response);
        assertEquals(List.of(generoModel),response);
    }

    @Test
    void testExistsByIdAndCreatedById() {
        Boolean response = generoRepository.existsByIdAndCreatedById(generoModel.getId(), usuarioModel.getId());

        assertNotNull(response);
        assertTrue(response);
    }

}
