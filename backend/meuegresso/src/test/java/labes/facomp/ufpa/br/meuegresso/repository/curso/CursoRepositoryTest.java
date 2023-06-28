package labes.facomp.ufpa.br.meuegresso.repository.curso;

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
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoTitulacaoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.empresa.EmpresaRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.titulacao.TitulacaoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

/**
 * Classe que testa as features do CursoRepository
 * 
 * @author Bruno Eiki
 * @since 29/04/2023
 */
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_CLASS)
@RunWith(SpringRunner.class)
@DataJpaTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
class CursoRepositoryTest {

    @Autowired
    private CursoRepository cursoRepository;
    
    @Autowired
    private EgressoRepository egressoRepository;
    
    @Autowired
    private GeneroRepository generoRepository;
    
    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private EmpresaRepository empresaRepository;

    @Autowired
    private TitulacaoRepository titulacaoRepository;

    @Autowired
    private EgressoTitulacaoRepository egressoTitulacaoRepository;

    private EgressoTitulacaoModel egressoTitulacaoModel;
    
    private CursoModel cursoModel;

    private EgressoModel egressoModel;
    
    private GeneroModel generoModel;
    
    private UsuarioModel usuarioModel;

    private EmpresaModel empresaModel;

    private TitulacaoModel titulacaoModel;
    
    private final static Integer ID = 1;
    private final static String NOME = "CursoTeste";

    @BeforeEach
    void setUp() {
        generoModel = new GeneroModel();
        generoModel.setId(1);
        generoModel.setNome("Feminino");
        generoModel = generoRepository.save(generoModel);

        usuarioModel = UsuarioModel.builder()
                .id(1)
                .nome("Ana")
                .username("ana123")
                .email("ana@example.com")
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

        titulacaoModel = TitulacaoModel.builder()
            .id(ID)
            .nome("titulacao")
            .build();

        titulacaoModel.setCreatedBy(usuarioModel.getId());

        titulacaoModel = titulacaoRepository.save(titulacaoModel);

        empresaModel = EmpresaModel.builder()
            .id(1)
            .nome("empresa")
            .build();

        empresaModel.setCreatedBy(usuarioModel.getId());

        empresaModel = empresaRepository.save(empresaModel);
        
        cursoModel = CursoModel.builder()
            .id(ID)
            .nome(NOME)
            .build();

        cursoModel.setCreatedBy(usuarioModel.getId());
        cursoModel = cursoRepository.save(cursoModel);
        
        egressoTitulacaoModel = EgressoTitulacaoModel.builder()
            .egresso(egressoModel)
            .empresa(empresaModel)
            .curso(cursoModel)
            .titulacao(titulacaoModel)
            .build();
        egressoTitulacaoRepository.save(egressoTitulacaoModel);

    }
    
    /**
     * Método que testa o repositório que retorna todos os Cursos
     * 
     * @author Bruno Eiki
     * @since 29/04/2023
     */
    @Test
    void testFindAll() {

        cursoRepository.save(cursoModel);
        List<CursoModel> response = cursoRepository.findAll();

        assertNotNull(response);
        assertEquals(cursoModel.getNome(), response.get(0).getNome());
    }

    /**
     * Método que testa o repositório que salva Curso
     * 
     * @author Pedro Inácio
     * @since 24/06/2023
     */
    @Test
    void testExistsByIdAndCreatedById() {

        Boolean response = cursoRepository.existsByIdAndCreatedBy(cursoModel.getId(), usuarioModel.getId());

        assertNotNull(response);
        assertTrue(response);
    }


    @Test
    void testFindByNomeIgnoreCase() {
        cursoRepository.save(cursoModel);

        Optional<CursoModel> response = cursoRepository.findByNomeIgnoreCase(cursoModel.getNome());

        assertNotNull(response);
        assertEquals(cursoModel.getNome(), response.get().getNome());
    }

    /**
     * Metodo para remover todos os dados do repository.
     * 
     * @author Bruno Eiki
     * @since 29/04/2023
     */
    @AfterAll
    void tearDown() {
        egressoTitulacaoRepository.deleteAll();
    }
}
