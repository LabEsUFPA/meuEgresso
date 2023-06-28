package labes.facomp.ufpa.br.meuegresso.repository.titulacao;
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
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

@DirtiesContext
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
public class TitulacaoRepositoryTest {

    @Autowired
    private TitulacaoRepository titulacaoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    private TitulacaoModel titulacaoModel;

    private UsuarioModel usuarioModel;

    private final static String NOME = "Titulação1";
    
    @BeforeAll
    void setUp() {
        //TODO: investigar dataIntegratyViolation do setup que ocorre no maven pra todos
        usuarioModel = UsuarioModel.builder()
                .nome("John")
                .username("john123")
                .email("john@example.com")
                .password("password123")
                .build();
        usuarioModel.setGrupos(Set.of(Grupos.ADMIN));
        usuarioModel = usuarioRepository.save(usuarioModel);

        titulacaoModel = TitulacaoModel.builder()
        .nome(NOME)
        .build();

        titulacaoModel.setCreatedBy(usuarioModel.getId());

        titulacaoModel = titulacaoRepository.save(titulacaoModel);
    }
    
    @Test
    void testFindAll() {
        List<TitulacaoModel> response = titulacaoRepository.findAll();

        assertNotNull(response);
        assertEquals(List.of(titulacaoModel), response);
    }

    @Test
    void testExistsByIdAndCreatedById() {
        Boolean response = titulacaoRepository.existsByIdAndCreatedBy(titulacaoModel.getId(),
                titulacaoModel.getCreatedBy());

        assertTrue(response);
    }

    @Test
    void testFindByNomeIgnoreCase() {
        Optional<TitulacaoModel> response = titulacaoRepository.findByNomeIgnoreCase(titulacaoModel.getNome());

        assertNotNull(response);
        assertEquals(titulacaoModel, response.get());
    }
}
