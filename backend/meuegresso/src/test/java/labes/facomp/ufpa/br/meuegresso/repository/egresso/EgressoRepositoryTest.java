package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.grupo.GrupoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

/**
 * Classe que implementa testes das funcionalides de EgressoRepository
 *
 * @author Pedro Inácio
 * @since 28/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")
class EgressoRepositoryTest {

    @Autowired
    private EgressoRepository egressoRepository;

    @Autowired
    private GeneroRepository generoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private GrupoRepository grupoRepository;

    private GrupoModel grupoModel;

    private EgressoModel egressoModel;

    private GeneroModel generoModel;

    @BeforeEach
    void setUp() {
        generoModel = new GeneroModel();
        generoModel.setId(1);
        generoModel.setNome("Masculino");
        generoModel = generoRepository.save(generoModel);

        grupoModel = GrupoModel.builder().id(1).nomeGrupo("ADMIN").build();
        grupoModel = grupoRepository.save(grupoModel);
        Set<GrupoModel> grupos = new HashSet<>();
        grupos.add(grupoModel);

        UsuarioModel usuarioModel = UsuarioModel.builder()
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
                .genero(generoModel)
                .matricula("202003940011")
                .interesseEmPos(true)
                .lattes("null")
                .linkedin("null")
                .usuario(usuarioModel)
                .build();
        egressoModel.setCreatedBy(usuarioModel);

        egressoModel = egressoRepository.save(egressoModel);

    }

    @Test
    void testFindAll() {
        List<EgressoModel> testar = egressoRepository.findAll();
        assertNotNull(testar);
    }

    @Test
    void testfindByUsuarioId() {
        EgressoModel testar = egressoRepository.findByUsuarioId(egressoModel.getUsuario().getId()).orElseThrow();
        assertNotNull(testar);
    }

    @Test
    void testExistsByIdAndCreatedById() {

        Boolean response = egressoRepository.existsByIdAndCreatedById(
                egressoModel.getId(), egressoModel.getCreatedBy().getId());

        assertTrue(response);
    }

    @AfterEach
    public void tearDown() {
        egressoModel = null;
    }

}