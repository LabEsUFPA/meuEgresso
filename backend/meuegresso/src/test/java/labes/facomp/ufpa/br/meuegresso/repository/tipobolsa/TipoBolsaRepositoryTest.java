package labes.facomp.ufpa.br.meuegresso.repository.tipobolsa;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
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
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.TipoBolsaModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

@AutoConfigureMockMvc
@ActiveProfiles("test")
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_CLASS)
@RunWith(SpringRunner.class)
@DataJpaTest
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
class TipoBolsaRepositoryTest {

    @Autowired
    private TipoBolsaRepository tipoBolsaRepository;

    @Autowired
    private EgressoRepository egressoRepository;

    @Autowired
    private GeneroRepository generoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    private TipoBolsaModel tipoBolsaModel;
    
    private EgressoModel egressoModel;
    
    private GeneroModel generoModel;

    private UsuarioModel usuarioModel;

    private final static Integer ID = 1;
    private final static String NOME = "PIBIC";

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

        tipoBolsaModel = TipoBolsaModel.builder()
            .id(ID)
            .nome(NOME)
            .build();
        
        tipoBolsaModel.setCreatedBy(usuarioModel.getId());

        tipoBolsaModel = tipoBolsaRepository.save(tipoBolsaModel);
    }

    @Test
    @Order(1)
    void testSave() {

        TipoBolsaModel response = tipoBolsaRepository.save(tipoBolsaModel);
        
        assertNotNull(response);
        assertEquals(tipoBolsaModel.getNome(), response.getNome());
    }

    @Test
    @Order(2)
    void testFindAll() {

        List<TipoBolsaModel> response = tipoBolsaRepository.findAll();

        assertNotNull(response);
        assertEquals(List.of(tipoBolsaModel), response);
    }

    @Test
    void testExistsByIdAndCreatedById() {
        Boolean response = tipoBolsaRepository.existsByIdAndCreatedBy(tipoBolsaModel.getId(), usuarioModel.getId());

        assertNotNull(response);
        assertTrue(response);
    }

}
