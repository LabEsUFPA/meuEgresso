package labes.facomp.ufpa.br.meuegresso.service.anuncio;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.mockito.BDDMockito;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;
import labes.facomp.ufpa.br.meuegresso.model.AreaEmpregoModel;
import labes.facomp.ufpa.br.meuegresso.repository.anuncio.AnuncioRepository;
import labes.facomp.ufpa.br.meuegresso.repository.areaemprego.AreaEmpregoRepository;

/**
 * Class que implementa testes para o AnuncioService.
 *
 * @author
 * @since
 */
@SpringBootTest
@DirtiesContext
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
class AnuncioServiceTest {

        private AreaEmpregoModel engenharia = AreaEmpregoModel.builder()
                        .id(1)
                        .nome("Engenharia de Software")
                        .build();

        private AreaEmpregoModel programacao = AreaEmpregoModel.builder()
                        .id(2)
                        .nome("Programacao")
                        .build();

        @MockBean
        private AnuncioRepository anuncioRepository;

        @MockBean
        private AreaEmpregoRepository areaEmpregoRepository;

        @Autowired
        private AnuncioService anuncioService;

        AnuncioModel testAnuncio;

        @BeforeAll
        void setUp() {
                BDDMockito.given(anuncioRepository.save(Mockito.any(AnuncioModel.class)))
                                .willReturn(getMockAnuncioIdOne());

                BDDMockito.given(areaEmpregoRepository.findAll())
                                .willReturn(getMockAreaEmprego());

                BDDMockito.given(anuncioRepository.findById(Mockito.anyInt()))
                                .willReturn(Optional.of(getMockAnuncioIdOne()));
        }

        /**
         * Metodo para testar a criacao de um AnuncioModel com save.
         *
         * @author Bruno Eiki
         * @since 27/04/2023
         */
        @Test
        @Order(1)
        void testSave() {

                BDDMockito.given(anuncioRepository.save(Mockito.any(AnuncioModel.class)))
                                .willReturn(getMockAnuncioIdOne());

                AnuncioModel response = anuncioService.save(new AnuncioModel());

                assertNotNull(response);
                assertEquals(getMockAnuncioIdOne(), response);
        }

        /**
         * Metodo para testar o metodo findAll.
         *
         * @author Bruno Eiki
         * @since 27/04/2023
         */
        @Test
        @Order(2)
        void testFindAll() {
                List<AnuncioModel> lista = List.of(getMockAnuncioIdOne(),
                                getMockAnuncioIdTwo(), getMockAnuncioIdThree());

                Page<AnuncioModel> page = new PageImpl<>(lista, PageRequest.of(0, 20), lista.size());

                BDDMockito.given(anuncioRepository.findAll(Mockito.any(
                                Pageable.class)))
                                .willReturn(page);

                Page<AnuncioModel> response = anuncioService.findAll(0, 20, Direction.ASC);
                List<AnuncioModel> content = response.getContent();

                assertNotNull(content);
        }

        /**
         * Metodo para testar o findById.
         *
         * @author Bruno Eiki
         * @since 27/04/2023
         */
        @Test
        @Order(3)
        void testFindById() {

                AnuncioModel response = anuncioService.findById(1);
                assertEquals(getMockAnuncioIdOne(), response);

        }

        /**
         * Metodo para testar o update.
         *
         * @author Bruno Eiki
         * @throws InvalidRequestException
         * @since 27/04/2023
         */
        @Test
        @Order(4)
        void testUpdate() throws InvalidRequestException {

                var anuncioUpdate = getMockAnuncioIdOne();
                anuncioUpdate.setDescricao("Teste");

                BDDMockito.given(anuncioRepository.save(Mockito.any(AnuncioModel.class)))
                                .willReturn(anuncioUpdate);

                AnuncioModel response = anuncioService.update(anuncioUpdate);
                assertEquals(1, response.getId());
                assertEquals("Teste", response.getDescricao());
        }

        /**
         * Metodo para testar o existsByIdAndCreatedBy.
         *
         * @author Bruno Eiki
         * @since 27/04/2023
         */
        @Test
        @Order(5)
        void testexistsByIdAndCreatedBy() {

                BDDMockito.given(anuncioService.existsByIdAndCreatedBy(Mockito.anyInt(), Mockito.anyInt()))
                                .willReturn(true);

                Boolean response = anuncioService.existsByIdAndCreatedBy(1, 1);
                assertTrue(response);
        }

        @Test
        @Order(6)
        void TestFindBySearchTitulo() {

                List<AnuncioModel> lista = List.of(getMockAnuncioIdOne());

                Page<AnuncioModel> page = new PageImpl<>(lista, PageRequest.of(0, 20), lista.size());

                BDDMockito.given(anuncioRepository.findBySearch(Mockito.anyString(),
                                Mockito.any(), Mockito.any(Pageable.class)))
                                .willReturn(page);

                Page<AnuncioModel> response = anuncioService.findBySearch("teste", null, 0, 20, Direction.ASC);

                assertEquals(1, response.getContent().size());

        }

        @Test
        @Order(7)
        void TestFindBySearchArea() {

                List<AnuncioModel> lista = List.of(getMockAnuncioIdOne(), getMockAnuncioIdTwo());

                Page<AnuncioModel> page = new PageImpl<>(lista, PageRequest.of(0, 20), lista.size());

                BDDMockito.given(anuncioRepository.findBySearch(Mockito.anyString(),
                                Mockito.any(), Mockito.any(Pageable.class)))
                                .willReturn(page);

                Integer[] areas = { 1, 2 };

                Page<AnuncioModel> response = anuncioService.findBySearch(null, areas, 0, 20, Direction.ASC);

                assertEquals(2, response.getContent().size());
                assertEquals(getMockAnuncioIdOne(), response.getContent().get(0));
                assertEquals(getMockAnuncioIdTwo(), response.getContent().get(1));

        }

        @Test
        @Order(8)
        void TestFindBySearchArea2() {

                List<AnuncioModel> lista = List.of(getMockAnuncioIdTwo());

                Page<AnuncioModel> page = new PageImpl<>(lista, PageRequest.of(0, 20), lista.size());

                BDDMockito.given(anuncioRepository.findBySearch(Mockito.anyString(),
                                Mockito.any(), Mockito.any(Pageable.class)))
                                .willReturn(page);

                Integer[] area = { 2 };

                Page<AnuncioModel> response = anuncioService.findBySearch(null, area, 0, 20, Direction.ASC);

                assertEquals(1, response.getContent().size());
                assertEquals(getMockAnuncioIdTwo(), response.getContent().get(0));
        }

        /**
         * Metodo para testar o deleteById.
         *
         * @author Bruno Eiki
         * @since 27/04/2023
         */

        @Test
        @Order(10)
        void testDeleteById() {

                Mockito.when(anuncioRepository.findById(Mockito.anyInt()))
                                .thenReturn(Optional.of(getMockAnuncioIdOne()));
                Mockito.when(anuncioRepository.existsById(Mockito.anyInt()))
                                .thenReturn(true);
                Boolean response = anuncioService.deleteById(1);

                Mockito.verify(anuncioRepository).deleteById(1);
                assertTrue(response);
        }

        /**
         * Metodo que preenche um mock de um AnuncioModel para retorno dos testes
         *
         * @author Bruno Eiki
         * @since 27/04/2023
         *
         * @return <code>anuncioTeste</code> object
         */
        private List<AreaEmpregoModel> getMockAreaEmprego() {
                List<AreaEmpregoModel> areaEmprego = new ArrayList<>();

                areaEmprego.add(engenharia);
                areaEmprego.add(programacao);

                return areaEmprego;
        }

        private AnuncioModel getMockAnuncioIdOne() {
                return AnuncioModel.builder()
                                .id(1)
                                .titulo("Vaga de Emprego no Google")
                                .descricao("Entre agora para a maior empresa de tecnologia do mundo")
                                .areaEmprego(engenharia)
                                .salario("5000")
                                .dataExpiracao(LocalDate.parse("2023-06-20"))
                                .build();
        }

        private AnuncioModel getMockAnuncioIdTwo() {
                return AnuncioModel.builder()
                                .id(2)
                                .titulo("Vaga de Emprego na Amazon")
                                .descricao("Entre agora para a maior empresa de vendas do mundo")
                                .areaEmprego(engenharia)
                                .salario("7000")
                                .dataExpiracao(LocalDate.parse("2023-05-05"))
                                .build();
        }

        private AnuncioModel getMockAnuncioIdThree() {
                return AnuncioModel.builder()
                                .id(3)
                                .titulo("Vaga de Emprego na Loud")
                                .descricao("Entre agora para a maior ORG do VCT America")
                                .areaEmprego(programacao)
                                .dataExpiracao(LocalDate.parse("2023-06-08"))
                                .salario("10000")
                                .build();
        }

        @AfterAll
        void tearDown() {
                anuncioRepository.deleteAll();
        }
}
