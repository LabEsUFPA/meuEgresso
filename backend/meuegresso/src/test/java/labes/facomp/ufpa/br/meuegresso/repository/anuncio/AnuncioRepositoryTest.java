package labes.facomp.ufpa.br.meuegresso.repository.anuncio;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;
import labes.facomp.ufpa.br.meuegresso.model.AreaEmpregoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.areaemprego.AreaEmpregoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;

@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_CLASS)
@RunWith(SpringRunner.class)
@DataJpaTest
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
class AnuncioRepositoryTest 
{
        private AreaEmpregoModel engenharia;

        private AreaEmpregoModel programacao;

        private EgressoModel egresso;

        private UsuarioModel usuario;

        private GeneroModel generoModel;

        @Autowired
        private EgressoRepository egressoRepository;

        @Autowired
        private GeneroRepository generoRepository;

        @Autowired
        private UsuarioRepository usuarioRepository;

        @Autowired
        private AreaEmpregoRepository areaEmpregoRepository;

        @Autowired
        private AnuncioRepository anuncioRepository;

        @BeforeAll
        void setUp() {

                generoModel = new GeneroModel();
                generoModel.setId(1);
                generoModel.setNome("Masculino");
                generoModel = generoRepository.save(generoModel);

                usuario = UsuarioModel.builder()
                        .id(1)
                        .nome("John")
                        .username("john123")
                        .email("john@example.com")
                        .password("password123")
                        .build();
                usuario.setGrupos(Set.of(Grupos.ADMIN));
                usuario = usuarioRepository.save(usuario);

                egresso = EgressoModel.builder()
                        .id(1)
                        .nascimento(LocalDate.parse("1999-10-20"))
                        .genero(generoModel)
                        .matricula("202003940011")
                        .interesseEmPos(true)
                        .lattes("null")
                        .linkedin("null")
                        .usuario(usuario)
                        .build();
                egresso.setCreatedBy(usuario.getId());

                egresso = egressoRepository.save(egresso);

                engenharia = AreaEmpregoModel.builder()
                        .id(1)
                        .nome("Engenharia de Software")
                        .build();

                programacao = AreaEmpregoModel.builder()
                        .id(2)
                        .nome("Programacao")
                        .build();
                engenharia = areaEmpregoRepository.save(engenharia);
                programacao = areaEmpregoRepository.save(programacao);
                // BDDMockito.when(areaEmpregoRepository.findAll())
                        // .willReturn(getMockAreaEmprego());
        }

        @Test
        @Order(1)
        void testSave() {
                AnuncioModel response = anuncioRepository.save(getMockAnuncioIdOne());

                assertNotNull(response);
                assertEquals(getMockAnuncioIdOne(), response);
        }

        @Test
        @Order(2)
        void testFindAll() {

                List<AnuncioModel> lista = List.of(getMockAnuncioIdOne(), getMockAnuncioIdTwo(), getMockAnuncioIdThree());
                // List<AnuncioModel> lista = List.of(getMockAnuncioIdOne());

                anuncioRepository.save(getMockAnuncioIdTwo());
                anuncioRepository.save(getMockAnuncioIdThree());

                Page<AnuncioModel> response = anuncioRepository.findAll(PageRequest.of(0, 20));
                List<AnuncioModel> content = response.getContent();

                assertNotNull(content);
                assertEquals(lista, content);
        }

        @Test
        @Order(3)
        void testExistsByIdAndCreatedById() {

                Boolean response = anuncioRepository.existsByIdAndCreatedBy(1, 1);
                assertTrue(response);
        }

        @Test
        @Order(4)
        void TestFindBySearchTitulo() {

                Integer[] areas = {1};
                
                Page<AnuncioModel> response = anuncioRepository.findBySearch("%Google%", areas, PageRequest.of(0, 20, Sort.by(Direction.ASC, "titulo")));

                assertEquals(1, response.getContent().size());

        }

        @Test
        @Order(5)
        void TestFindBySearchArea() {

                List<AnuncioModel> lista = List.of(getMockAnuncioIdOne(), getMockAnuncioIdThree());

                // Page<AnuncioModel> page = new PageImpl<>(lista, PageRequest.of(0, 20), lista.size());

                // BDDMockito.given(anuncioRepository.findBySearch(Mockito.anyString(),
                //                 Mockito.any(), Mockito.any(Pageable.class)))
                //                 .willReturn(page);

                Integer[] areas = {1,2};

                Page<AnuncioModel> response = anuncioRepository.findBySearch("%%", areas, PageRequest.of(0, 20));

                // assertEquals(2, response.getContent().size());
                // assertEquals(lista, response.getContent());
                // assertEquals(getMockAnuncioIdOne(), response.getContent().get(0));
                // assertEquals(getMockAnuncioIdThree(), response.getContent().get(1));

        }

        private AnuncioModel getMockAnuncioIdOne() {
                AnuncioModel anuncio = AnuncioModel.builder()
                                .id(1)
                                .titulo("Vaga de Emprego no Google")
                                .descricao("Entre agora para a maior empresa de tecnologia do mundo")
                                .areaEmprego(engenharia)
                                .salario("5000")
                                .dataExpiracao(LocalDate.parse("2050-06-20"))
                                .link("http://vagas.com.br")
                                .build();
                anuncio.setCreatedBy(usuario.getId());
                return anuncio;
        }

        private AnuncioModel getMockAnuncioIdTwo() {
                AnuncioModel anuncio = AnuncioModel.builder()
                                .id(2)
                                .titulo("Vaga de Emprego na Amazon")
                                .descricao("Entre agora para a maior empresa de vendas do mundo")
                                .areaEmprego(engenharia)
                                .salario("7000")
                                .dataExpiracao(LocalDate.parse("2022-05-05"))
                                .link("http://vagas.com.br")
                                .build();
                anuncio.setCreatedBy(usuario.getId());
                return anuncio;
        }

        private AnuncioModel getMockAnuncioIdThree() {
                AnuncioModel anuncio = AnuncioModel.builder()
                                .id(3)
                                .titulo("Vaga de Emprego na Loud")
                                .descricao("Entre agora para a maior ORG do VCT America")
                                .areaEmprego(programacao)
                                .dataExpiracao(LocalDate.parse("2050-06-08"))
                                .salario("10000")
                                .link("http://vagas.com.br")
                                .build();
                anuncio.setCreatedBy(usuario.getId());
                return anuncio;
        }

        @AfterAll
        void tearDown() {
                anuncioRepository.deleteAll();
        }
}   
