package labes.facomp.ufpa.br.meuegresso.repository.areaemprego;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.junit.jupiter.api.BeforeAll;
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
import labes.facomp.ufpa.br.meuegresso.model.AreaEmpregoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

@DirtiesContext
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
public class AreaEmpregoRepositoryTest {

    @Autowired
    private AreaEmpregoRepository areaEmpregoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    private AreaEmpregoModel areaEmpregoModel;

    private UsuarioModel usuarioModel;

    private final static String NOME = "Emprego1";

    @BeforeAll
    void setUp() {

        usuarioModel = UsuarioModel.builder()
                .nome("John Jooss")
                .username("john123654")
                .email("john654@example.com")
                .password("password123")
                .build();
        usuarioModel.setGrupos(Set.of(Grupos.ADMIN));
        usuarioModel = usuarioRepository.save(usuarioModel);

        areaEmpregoModel = AreaEmpregoModel.builder()
                .nome(NOME)
                .build();

        areaEmpregoModel.setCreatedBy(usuarioModel);
        areaEmpregoModel = areaEmpregoRepository.save(areaEmpregoModel);
    }

    @Test
    void testExistsByIdAndCreatedById() {
        Boolean response = areaEmpregoRepository.existsByIdAndCreatedById(areaEmpregoModel.getId(),
                areaEmpregoModel.getCreatedBy().getId());
        assertTrue(response);

    }

    @Test
    void testFindAll() {
        List<AreaEmpregoModel> response = areaEmpregoRepository.findAll();

        assertNotNull(response);
        assertEquals(List.of(areaEmpregoModel), response);

    }

    @Test
    void testFindByNomeIgnoreCase() {
        Optional<AreaEmpregoModel> response = areaEmpregoRepository.findByNomeIgnoreCase(areaEmpregoModel.getNome());

        assertNotNull(response);
        assertEquals(areaEmpregoModel, response.get());
    }
}
