package labes.facomp.ufpa.br.meuegresso.service.anuncio;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.dto.anuncio.BuscaAnuncioDTO;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;
import labes.facomp.ufpa.br.meuegresso.model.AreaEmpregoModel;
import labes.facomp.ufpa.br.meuegresso.repository.anuncio.AnuncioRepository;

/**
 * Class que implementa testes para o AnuncioService.
 *
 * @author
 * @since
 */
@SpringBootTest
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

        @Autowired
        private AnuncioService anuncioService;

        AnuncioModel testAnuncio;


        @BeforeAll
        void setUp() {
                BDDMockito.given(anuncioRepository.save(Mockito.any(AnuncioModel.class)))
                                .willReturn(getMockAnuncio());

                BDDMockito.given(anuncioRepository.findById(Mockito.anyInt()))
                                .willReturn(Optional.of(getMockAnuncio()));
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
                                .willReturn(getMockAnuncio());

                AnuncioModel response = anuncioService.save(new AnuncioModel());

                assertNotNull(response);
                assertEquals(getMockAnuncio(), response);
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
                BDDMockito.given(anuncioRepository.findAll())
                                .willReturn(getMockAnuncioLista());

                List<AnuncioModel> response = anuncioService.findAll();

                assertNotNull(response);
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
                assertEquals(getMockAnuncio(), response);

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

                var anuncioUpdate = getMockAnuncio();
                anuncioUpdate.setDescricao("Teste");

                BDDMockito.given(anuncioRepository.save(Mockito.any(AnuncioModel.class)))
                                .willReturn(anuncioUpdate);

                AnuncioModel response = anuncioService.update(anuncioUpdate);
                assertEquals(1, response.getId());
                assertEquals("Teste", response.getDescricao());
        }

        /**
         * Metodo para testar o existsByIdAndCreatedById.
         *
         * @author Bruno Eiki
         * @since 27/04/2023
         */
        @Test
        @Order(5)
        void testExistsByIdAndCreatedById() {

                BDDMockito.given(anuncioService.existsByIdAndCreatedById(Mockito.anyInt(), Mockito.anyInt()))
                                .willReturn(true);

                                Boolean response = anuncioService.existsByIdAndCreatedById(1, 1);
                assertTrue(response);
        }
        
        /*
         * @Test
         * 
         * @Order(6)
         * void TestFindBySearchSalary() {
         * BuscaAnuncioDTO filtro = BuscaAnuncioDTO.builder()
         * .minValorSalario(2000.0)
         * .maxValorSalario(6000.0)
         * .build();
         * 
         * BDDMockito.given(anuncioRepository.findAll())
         * .willReturn(getMockAnuncioLista());
         * 
         * List<AnuncioModel> response = anuncioService.findBySearch(filtro);
         * assertEquals(1, response.size());
         * }
         * 
         * @Test
         * 
         * @Order(7)
         * void TestFindBySearchTitulo() {
         * BuscaAnuncioDTO filtro = BuscaAnuncioDTO.builder()
         * .titulo("Google")
         * .build();
         * 
         * BDDMockito.given(anuncioRepository.findAll())
         * .willReturn(getMockAnuncioLista());
         * 
         * List<AnuncioModel> response = anuncioService.findBySearch(filtro);
         * assertEquals(1, response.size());
         * }
         */
        @Test
        @Order(8)
        void TestFindBySearchArea() {
                BuscaAnuncioDTO filtro = BuscaAnuncioDTO.builder()
                .areaEmprego(Arrays.asList(1, 2))
                .build();

                BDDMockito.given(anuncioRepository.findAll())
                                .willReturn(getMockAnuncioLista());

                List<AnuncioModel> response = anuncioService.findBySearch(filtro);
                assertEquals(2, response.size());
        }

        @Test
        @Order(9)
        void TestFindBySearchArea2() {
                BuscaAnuncioDTO filtro = BuscaAnuncioDTO.builder()
                                .areaEmprego(Arrays.asList(2))
                                .build();

                BDDMockito.given(anuncioRepository.findAll())
                                .willReturn(getMockAnuncioLista());

                List<AnuncioModel> response = anuncioService.findBySearch(filtro);
                assertEquals(1, response.size());
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
                                .thenReturn(Optional.of(getMockAnuncio()));
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
        
        private AnuncioModel getMockAnuncio() {
                AnuncioModel anuncioTest = AnuncioModel.builder()
                .id(1)
                .titulo("Vaga de Emprego no Google")
                                .descricao("Entre agora para a maior empresa de tecnologia do mundo")
                                .areaEmprego(engenharia)
                                .salario(5000)
                                .dataExpiracao(LocalDate.parse("2023-06-20"))
                                .build();
                return anuncioTest;
        }

        private List<AnuncioModel> getMockAnuncioLista() {
                List<AnuncioModel> anuncioLista = new ArrayList<>();

                AnuncioModel anuncioTest = AnuncioModel.builder()
                                .id(2)
                                .titulo("Vaga de Emprego na Amazon")
                                .descricao("Entre agora para a maior empresa de vendas do mundo")
                                .areaEmprego(engenharia)
                                .salario(7000)
                                .dataExpiracao(LocalDate.parse("2023-05-05"))
                                .build();

                AnuncioModel anuncioTest2 = AnuncioModel.builder()
                                .id(3)
                                .titulo("Vaga de Emprego na Loud")
                                .descricao("Entre agora para a maior ORG do VCT America")
                                .areaEmprego(programacao)
                                .dataExpiracao(LocalDate.parse("2023-06-08"))
                                .salario(10000)
                                .build();

                anuncioLista.add(getMockAnuncio());
                anuncioLista.add(anuncioTest);
                anuncioLista.add(anuncioTest2);

                return anuncioLista;
        }

        @AfterAll
        void tearDown() {
                anuncioRepository.deleteAll();
        }
}
