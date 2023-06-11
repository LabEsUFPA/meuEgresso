package labes.facomp.ufpa.br.meuegresso.repository.anuncio;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
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
import org.springframework.core.annotation.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;
import labes.facomp.ufpa.br.meuegresso.model.AreaEmpregoModel;
import labes.facomp.ufpa.br.meuegresso.repository.areaemprego.AreaEmpregoRepository;

@SpringBootTest
@DirtiesContext
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })

public class AnuncioRepositoryTest 
{
        private AreaEmpregoModel engenharia = AreaEmpregoModel.builder()
                        .id(1)
                        .nome("Engenharia de Software")
                        .build();

        private AreaEmpregoModel programacao = AreaEmpregoModel.builder()
                        .id(2)
                        .nome("Programacao")
                        .build();

        @MockBean
        private AreaEmpregoRepository areaEmpregoRepository;

        @Autowired
        private AnuncioRepository anuncioRepository;

        @BeforeAll
        void setUp() {
                BDDMockito.given(areaEmpregoRepository.findAll())
                        .willReturn(getMockAreaEmprego());
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

                List<AnuncioModel> lista = List.of(getMockAnuncioIdOne(),
                                    getMockAnuncioIdTwo(), getMockAnuncioIdThree());

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

                Boolean response = anuncioRepository.existsByIdAndCreatedById(1, 1);
                assertTrue(response);
        }

        @Test
        @Order(4)
        void TestFindBySearchTitulo() {

                Integer[] areas = { };

                Page<AnuncioModel> response = anuncioRepository.findBySearch("Google", areas, PageRequest.of(0, 20));

                assertEquals(1, response.getContent().size());

        }

        @Test
        @Order(5)
        void TestFindBySearchArea() {

                List<AnuncioModel> lista = List.of(getMockAnuncioIdOne(), getMockAnuncioIdTwo());

                Page<AnuncioModel> page = new PageImpl<>(lista, PageRequest.of(0, 20), lista.size());

                BDDMockito.given(anuncioRepository.findBySearch(Mockito.anyString(),
                                Mockito.any(), Mockito.any(Pageable.class)))
                                .willReturn(page);

                Integer[] areas = { 1, 2 };

                Page<AnuncioModel> response = anuncioRepository.findBySearch(null, areas, PageRequest.of(0, 20));

                assertEquals(2, response.getContent().size());
                assertEquals(getMockAnuncioIdOne(), response.getContent().get(0));
                assertEquals(getMockAnuncioIdTwo(), response.getContent().get(1));

        }
        
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
