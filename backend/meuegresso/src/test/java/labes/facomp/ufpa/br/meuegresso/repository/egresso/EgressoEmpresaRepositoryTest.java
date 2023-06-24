package labes.facomp.ufpa.br.meuegresso.repository.egresso;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.model.AreaAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.areaatuacao.AreaAtuacaoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.empresa.EmpresaRepository;
import labes.facomp.ufpa.br.meuegresso.repository.endereco.EnderecoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.faixasalarial.FaixaSalarialRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.setoratuacao.SetorAtuacaoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

/**
 * Classe que implementa testes das funcionalides de EgressoEmpresaRepository
 *
 * @author Pedro Inácio
 * @since 28/04/2023
 */
@DirtiesContext
@SpringBootTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
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
    private AreaAtuacaoRepository areaAtuacaoRepository;

    @Autowired
    private SetorAtuacaoRepository setorAtuacaoRepository;

    @Autowired
    private EnderecoRepository enderecoRepository;

    private EnderecoModel enderecoModel;

    private GeneroModel generoModel;

    private EgressoEmpresaModel egressoEmpresaModel;

    private EgressoEmpresaModelId egressoEmpresaModelId;

    private EgressoModel egressoModel;

    private EmpresaModel empresaModel;

    private FaixaSalarialModel faixaSalarialModel;

    private AreaAtuacaoModel areaAtuacaoModel;

    private SetorAtuacaoModel setorAtuacaoModel;

    @BeforeAll
    void setUp() {

        generoModel = new GeneroModel();
        generoModel.setId(1);
        generoModel.setNome("Masculino");
        generoModel = generoRepository.save(generoModel);

        UsuarioModel usuarioModel = UsuarioModel.builder()
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
        egressoModel.setCreatedBy(usuarioModel);

        egressoModel = egressoRepository.save(egressoModel);

        empresaModel = new EmpresaModel();
        empresaModel.setId(1);
        empresaModel.setNome("El Cabis");

        empresaModel = empresaRepository.save(empresaModel);

        enderecoModel = EnderecoModel.builder().cidade("cidade").estado("estado").pais("pais").build();
        enderecoModel = enderecoRepository.save(enderecoModel);

        egressoEmpresaModelId = EgressoEmpresaModelId.builder().egressoId(egressoModel.getId())
                .empresaId(empresaModel.getId())
                .enderecoId(enderecoModel.getId()).build();

        faixaSalarialModel = new FaixaSalarialModel();
        faixaSalarialModel.setId(1);
        faixaSalarialModel.setFaixa("1000-2000");

        faixaSalarialModel = faixaSalarialRepository.save(faixaSalarialModel);

        areaAtuacaoModel = new AreaAtuacaoModel();
        areaAtuacaoModel.setId(1);
        areaAtuacaoModel.setNome("areaTeste");

        areaAtuacaoModel = areaAtuacaoRepository.save(areaAtuacaoModel);

        setorAtuacaoModel = new SetorAtuacaoModel();
        setorAtuacaoModel.setId(1);
        setorAtuacaoModel.setNome("setorTeste");

        setorAtuacaoModel = setorAtuacaoRepository.save(setorAtuacaoModel);

        egressoEmpresaModel = new EgressoEmpresaModel();
        egressoEmpresaModel.setId(egressoEmpresaModelId);
        egressoEmpresaModel.setEgresso(egressoModel);
        egressoEmpresaModel.setEmpresa(empresaModel);
        egressoEmpresaModel.setEndereco(enderecoModel);
        egressoEmpresaModel.setFaixaSalarial(faixaSalarialModel);
        egressoEmpresaModel.setAreaAtuacao(areaAtuacaoModel);
        egressoEmpresaModel.setSetorAtuacao(setorAtuacaoModel);
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

        Boolean response = egressoEmpresaRepository.existsById(
                egressoEmpresaModelId);

        assertTrue(response);
    }

    @AfterAll
    public void tearDown() {
        egressoEmpresaModel = null;
    }

}