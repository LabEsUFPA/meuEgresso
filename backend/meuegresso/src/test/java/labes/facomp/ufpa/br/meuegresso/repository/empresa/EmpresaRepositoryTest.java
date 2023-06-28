package labes.facomp.ufpa.br.meuegresso.repository.empresa;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

/**
 * Classe que testa as features do EmpresaRepository
 *
 * @author Pedro Inácio
 * @since 10/06/2023
 */
@SpringBootTest
@ActiveProfiles("test")
class EmpresaRepositoryTest {

    @Autowired
    private EmpresaRepository empresaRepository;

    @Autowired
    private EgressoRepository egressoRepository;
    
    @Autowired
    private GeneroRepository generoRepository;
    
    @Autowired
    private UsuarioRepository usuarioRepository;
    
    private EmpresaModel empresaModel;

    private EgressoModel egressoModel;
    
    private GeneroModel generoModel;

    private UsuarioModel usuarioModel;

    private final static Integer ID = 1;
    private final static String NOME = "empresaTeste";

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

        empresaModel = EmpresaModel.builder()
            .id(ID)
            .nome(NOME)
            .build();

        empresaModel.setCreatedBy(usuarioModel.getId());

        empresaModel = empresaRepository.save(empresaModel);
    }
    
    @Test
    void testSave() {
        EmpresaModel response = empresaRepository.save(empresaModel);

        assertNotNull(response);
        assertEquals(NOME, response.getNome());
    }

    @Test
    void testFindAll() {
        List<EmpresaModel> response = empresaRepository.findAll();
        
        assertNotNull(response);
        assertEquals(List.of(empresaModel), response);
    }

    @Test
    void testExistsByIdAndCreatedById() {
        Boolean response = empresaRepository.existsByIdAndCreatedBy(empresaModel.getId(), usuarioModel.getId());

        assertNotNull(response);
        assertTrue(response);
    }

    @Test
    void testFindByNomeIgnoreCase() {
        Optional<EmpresaModel> response = empresaRepository.findByNomeIgnoreCase(empresaModel.getNome());
        
        assertNotNull(response);
        assertEquals(empresaModel, response.get());
    }

}
