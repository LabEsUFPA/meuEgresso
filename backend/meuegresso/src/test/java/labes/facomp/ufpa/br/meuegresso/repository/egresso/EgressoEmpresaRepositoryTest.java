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

import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.empresa.EmpresaRepository;
import labes.facomp.ufpa.br.meuegresso.repository.faixasalarial.FaixaSalarialRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.grupo.GrupoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

/**
 * Classe que implementa testes das funcionalides de EgressoEmpresaRepository
 *
 * @author Pedro Inácio
 * @since 28/04/2023
 */
@SpringBootTest
@ActiveProfiles("test")

class EgressoEmpresaRepositoryTest {

    @Autowired
    private EgressoEmpresaRepository egressoEmpresaRepository;

    @Autowired
    private EgressoRepository egressoRepository;

    @Autowired
    private GeneroRepository generoRepository;

    @Autowired
    private EmpresaRepository empresaRepository;

    @Autowired
    private FaixaSalarialRepository faixaSalarialRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private GrupoRepository grupoRepository;

    private GrupoModel grupoModel;

    private GeneroModel generoModel;

    private EgressoEmpresaModel egressoEmpresaModel;

    private EgressoEmpresaModelId egressoEmpresaModelId;

    private EgressoModel egressoModel;

    private EmpresaModel empresaModel;

    private FaixaSalarialModel faixaSalarialModel;

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

        empresaModel = new EmpresaModel();
        empresaModel.setId(1);
        empresaModel.setNome("El Cabis");

        empresaModel = empresaRepository.save(empresaModel);

        egressoEmpresaModelId = EgressoEmpresaModelId.builder().egressoId(egressoModel.getId())
                .empresaId(empresaModel.getId()).build();

        faixaSalarialModel = new FaixaSalarialModel();
        faixaSalarialModel.setId(1);
        faixaSalarialModel.setFaixa("1000-2000");

        faixaSalarialModel = faixaSalarialRepository.save(faixaSalarialModel);

        egressoEmpresaModel = new EgressoEmpresaModel();
        egressoEmpresaModel.setId(egressoEmpresaModelId);
        egressoEmpresaModel.setEgresso(egressoModel);
        egressoEmpresaModel.setEmpresa(empresaModel);
        egressoEmpresaModel.setFaixaSalarial(faixaSalarialModel);
        egressoEmpresaModel.setCreatedBy(usuarioModel);

        egressoEmpresaModel = egressoEmpresaRepository.save(egressoEmpresaModel);
    }

    @Test
    void testFindAll() {

        List<EgressoEmpresaModel> testar = egressoEmpresaRepository.findAll();

        assertNotNull(testar);
    }

    @Test
    void testExistsByIdAndCreatedById() {

        Boolean response = egressoEmpresaRepository.existsByIdAndCreatedById(
                egressoEmpresaModelId, egressoEmpresaModel.getCreatedBy().getId());

        assertTrue(response);
    }

    @AfterEach
    public void tearDown() {
        egressoEmpresaModel = null;
    }

}