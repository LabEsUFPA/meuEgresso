package labes.facomp.ufpa.br.meuegresso.repository.areaatuacao;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.HashSet;
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

import labes.facomp.ufpa.br.meuegresso.model.AreaAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.grupo.GrupoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

@DirtiesContext
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
public class AreaAtuacaoRepositoryTest {

    @Autowired
    private AreaAtuacaoRepository areaAtuacaoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private GrupoRepository grupoRepository;

    private AreaAtuacaoModel areaAtuacaoModel;

    private GrupoModel grupoModel;

    private UsuarioModel usuarioModel;

    private final static String NOME = "Area1";

    @BeforeAll
    void setUp() {
        grupoModel = GrupoModel.builder()
        .nomeGrupo("ADMIN").build();
        grupoModel = grupoRepository.save(grupoModel);
        Set<GrupoModel> grupos = new HashSet<>();
        grupos.add(grupoModel);

        usuarioModel = UsuarioModel.builder()
                .nome("John")
                .username("john123")
                .email("john@example.com")
                .password("password123")
                .grupos(grupos)
                .build();
        usuarioModel = usuarioRepository.save(usuarioModel);

        areaAtuacaoModel = AreaAtuacaoModel.builder()
        .nome(NOME)
        .build();

        areaAtuacaoModel.setCreatedBy(usuarioModel);

        areaAtuacaoModel = areaAtuacaoRepository.save(areaAtuacaoModel);
    }

    @Test
    void testFindAll() {
        List<AreaAtuacaoModel> response = areaAtuacaoRepository.findAll();

        assertNotNull(response);
        assertEquals(List.of(areaAtuacaoModel), response);

    }

    @Test
    void testFindByNomeIgnoreCase() {
        Optional<AreaAtuacaoModel> response = areaAtuacaoRepository.findByNomeIgnoreCase(areaAtuacaoModel.getNome());

        assertNotNull(response);
        assertEquals(areaAtuacaoModel, response.get());

    }
}
