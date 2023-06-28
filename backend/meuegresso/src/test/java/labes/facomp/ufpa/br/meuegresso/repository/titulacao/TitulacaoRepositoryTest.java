package labes.facomp.ufpa.br.meuegresso.repository.titulacao;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
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
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.curso.CursoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoTitulacaoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.empresa.EmpresaRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_CLASS)
@RunWith(SpringRunner.class)
@DataJpaTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
public class TitulacaoRepositoryTest {

    @Autowired
    private TitulacaoRepository titulacaoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private EgressoRepository egressoRepository;

    @Autowired
    private EgressoTitulacaoRepository egressoTitulacaoRepository;

    @Autowired
    private GeneroRepository generoRepository;

    @Autowired
    private CursoRepository cursoRepository;

    @Autowired
    private EmpresaRepository empresaRepository;
    
    private EgressoTitulacaoModel egressoTitulacaoModel;

    private GeneroModel generoModel;

    private CursoModel cursoModel;
    
    private EmpresaModel empresaModel;

    private EgressoModel egressoModel;

    private TitulacaoModel titulacaoModel;

    private UsuarioModel usuarioModel;

    private final static String NOME = "Titulação1";
    
    @BeforeAll
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

        cursoModel = CursoModel.builder()
            .id(1)
            .nome("curso")
            .build();

        cursoModel.setCreatedBy(usuarioModel.getId());
        cursoModel = cursoRepository.save(cursoModel);

        empresaModel = EmpresaModel.builder()
            .id(1)
            .nome("empresa")
            .build();

        empresaModel.setCreatedBy(usuarioModel.getId());

        empresaModel = empresaRepository.save(empresaModel);

        titulacaoModel = TitulacaoModel.builder()
            .nome(NOME)
            .build();

        titulacaoModel.setCreatedBy(usuarioModel.getId());
        titulacaoModel = titulacaoRepository.save(titulacaoModel);

        egressoTitulacaoModel = EgressoTitulacaoModel.builder()
            .egresso(egressoModel)
            .empresa(empresaModel)
            .curso(cursoModel)
            .titulacao(titulacaoModel)
            .build();
        egressoTitulacaoRepository.save(egressoTitulacaoModel);
    }
    
    @Test
    void testFindAll() {

        titulacaoRepository.save(titulacaoModel);

        List<TitulacaoModel> response = titulacaoRepository.findAll();

        assertNotNull(response);
        assertEquals(titulacaoModel.getNome(), response.get(0).getNome());
    }

    @Test
    void testExistsByIdAndCreatedById() {
        Boolean response = titulacaoRepository.existsByIdAndCreatedBy(titulacaoModel.getId(),
                titulacaoModel.getCreatedBy());

        assertTrue(response);
    }

    @Test
    void testFindByNomeIgnoreCase() {
        titulacaoRepository.save(titulacaoModel);

        Optional<TitulacaoModel> response = titulacaoRepository.findByNomeIgnoreCase(titulacaoModel.getNome());

        assertNotNull(response);
        assertEquals(titulacaoModel.getNome(), response.get().getNome());
    }

    @AfterEach
    void tearDown() {
        egressoTitulacaoRepository.deleteAll();
    }
}
