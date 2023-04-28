// package labes.facomp.ufpa.br.meuegresso.service.egresso;

// import static org.junit.jupiter.api.Assertions.assertEquals;
// import static org.junit.jupiter.api.Assertions.assertNotNull;
// import static org.junit.jupiter.api.Assertions.assertTrue;

// import java.util.ArrayList;
// import java.util.Date;
// import java.util.List;

// import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
// import org.junit.jupiter.api.Order;
// import org.junit.jupiter.api.Test;
// import org.junit.jupiter.api.TestInstance;
// import org.junit.jupiter.api.TestInstance.Lifecycle;
// import org.junit.jupiter.api.TestMethodOrder;
// import org.mockito.BDDMockito;
// import org.mockito.Mockito;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.boot.test.context.SpringBootTest;
// import org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener;
// import org.springframework.test.context.ActiveProfiles;
// import org.springframework.test.context.TestExecutionListeners;
// import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

// import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;

// /**
//  * Class que implementa testes para o EgressoService.
//  * 
//  * @author
//  * @since
//  */
// @SpringBootTest
// @ActiveProfiles("test")
// @TestInstance(Lifecycle.PER_CLASS)
// @TestMethodOrder(OrderAnnotation.class)
// @TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
// public class EgressoServiceTest {

//     private static final Integer ID = 1;
//     private static final Date NASCIMENTO = "1997-05-05";
//     private static final Boolean INTERESSEEMPOS = true;
//     private static final String LATTES = "https://lattes.cnpq.br/";
//     private static final String LINKEDIN = "https://linkedin.com/";

//     @Autowired
//     private EgressoService egressoService;

//     EgressoModel testEgresso;

//     /**
//      * Metodo para testar a criacao de um EgressoModel com adicionar Egresso.
//      * 
//      * @author Bruno Eiki
//      * @since 27/04/2023
//      */

//     @Test
//     @Order(1)
//     public void adicionarEgresso() {

//         BDDMockito.given(egressoService.adicionarEgresso(Mockito.any(EgressoModel.class)))
//                 .willReturn(getMockEgresso());

//         EgressoModel response = egressoService.adicionarEgresso(new EgressoModel());

//         assertNotNull(response);
//         assertEquals(ID, response.getId());
//         assertEquals(NASCIMENTO, response.getNascimento());
//         assertEquals(INTERESSEEMPOS, response.getInteresseEmPos());
//         assertEquals(LATTES, response.getLattes());
//         assertEquals(LINKEDIN, response.getLinkedin());
//     }

//     /**
//      * Metodo para testar o metodo findAll.
//      * 
//      * @author Bruno Eiki
//      * @since 27/04/2023
//      */
//     @Test
//     @Order(2)
//     public void testFindAll() {
//         BDDMockito.given(egressoService.findAll())
//                 .willReturn(getMockEgressoLista());
//         // .willReturn(List.of(getMockEgresso()));

//         List<EgressoModel> response = egressoService.findAll();
//         assertNotNull(response);
//     }

//     /**
//      * Metodo para testar o findById.
//      * 
//      * @author Bruno Eiki
//      * @since 27/04/2023
//      */
//     @Test
//     @Order(3)
//     public void testFindByUsuarioId() {
//         BDDMockito.given(egressoService.findByUsuarioId(Mockito.anyInt()))
//                 .willReturn(getMockEgresso());

//         EgressoModel response = egressoService.findByUsuarioId(ID);
//         assertNotNull(response);
//     }

//     /**
//      * Metodo para testar o update.
//      * 
//      * @author Bruno Eiki
//      * @since 27/04/2023
//      */
//     @Test
//     @Order(4)
//     public void testUpdate() {
//         BDDMockito.given(egressoService.updateEgresso(Mockito.any(EgressoModel.class)))
//                 .willReturn(getMockEgresso());

//         EgressoModel response = egressoService.updateEgresso();
//         assertNotNull(response);
//     }

//     /**
//      * Metodo para testar o deleteById.
//      * 
//      * @author Bruno Eiki
//      * @since 27/04/2023
//      */
//     @Test
//     @Order(4)

//     public void testDeletarEgresso() {

//         BDDMockito.given(egressoService.deleteById(Mockito.anyInt()))
//                 .willReturn(true);

//         Boolean response = egressoService.deleteById(ID);
//         assertTrue(response);
//     }

//     /**
//      * Metodo para testar o existsByIdAndCreatedById.
//      * 
//      * @author Bruno Eiki
//      * @since 27/04/2023
//      */
//     @Test
//     @Order(5)
//     public void testExistsByIdAndCreatedById() {

//         BDDMockito.given(egressoService.existsByIdAndCreatedById(Mockito.anyInt(), Mockito.anyInt()))
//                 .willReturn(true);

//         Boolean response = egressoService.existsByIdAndCreatedById(ID, ID);
//         assertTrue(response);
//     }

//     /**
//      * Metodo que preenche um mock de um EgressoModel para retorno dos testes
//      * 
//      * @author Bruno Eiki
//      * @since 27/04/2023
//      * 
//      * @return <code>egressoTeste</code> object
//      */
//     private EgressoModel getMockEgresso() {
//         EgressoModel egressoTest = EgressoModel.builder()
//                 .id(ID)
//                 .nascimento(NASCIMENTO)
//                 .interesseEmPos(INTERESSEEMPOS)
//                 .lattes(LATTES)
//                 .linkedin(LINKEDIN)
//                 .build();
//         return egressoTest;
//     }

//     private List<EgressoModel> getMockEgressoLista() {
//         List<EgressoModel> egressoLista = new ArrayList<>();
//         EgressoModel egressoTest = EgressoModel.builder()
//                 .id(ID)
//                 .nascimento(NASCIMENTO)
//                 .interesseEmPos(INTERESSEEMPOS)
//                 .lattes(LATTES)
//                 .linkedin(LINKEDIN)
//                 .build();

//         EgressoModel egressoTest2 = EgressoModel.builder()
//                 .id(ID2)
//                 .nome(NOME2)
//                 .build();

//         egressoLista.add(egressoTest);
//         egressoLista.add(egressoTest2);

//         return egressoLista;
//     }

//     // @AfterAll
//     // private void tearDown() {
//     // //
//     // }
// }
