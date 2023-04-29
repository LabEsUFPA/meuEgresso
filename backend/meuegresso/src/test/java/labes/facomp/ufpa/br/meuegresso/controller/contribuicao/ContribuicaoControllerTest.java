// package labes.facomp.ufpa.br.meuegresso.controller.contribuicao;

// import static org.mockito.Mockito.when;

// import java.util.List;

// import org.junit.jupiter.api.Test;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
// import org.springframework.boot.test.mock.mockito.MockBean;
// import org.springframework.test.web.servlet.MockMvc;

// import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
// import
// labes.facomp.ufpa.br.meuegresso.repository.contribuicao.ContribuicaoRepository;
// import
// labes.facomp.ufpa.br.meuegresso.service.contribuicao.ContribuicaoService;

// @WebMvcTest(controllers = ContribuicaoController.class)
// public class ContribuicaoControllerTest {
// @Autowired
// private MockMvc mockMvc;

// @MockBean
// private ContribuicaoRepository contribuicaoRepository;

// @Autowired
// private ContribuicaoService contribuicaoService;

// private static final Integer ID = 1;
// private static final String DESCRICAO = "Contribui";

// @Test
// public void consultarContribuicoesTest() throws Exception {
// List<ContribuicaoModel> contribuicaoList = List.of(getMockContribuicao());
// when(contribuicaoService.findAll()).thenReturn(contribuicaoList);
// this.mockMvc.perform(get("/contribuicao"))
// .andExpect(status().isOk())
// .andExpect(content().string(containsString(""));
// }

// private ContribuicaoModel getMockContribuicao() {
// ContribuicaoModel contribuicaoTeste = new ContribuicaoModel(
// 1,
// "contribui",
// null);
// return contribuicaoTeste;
// }
// }

// // package labes.facomp.ufpa.br.meuegresso.controller.cota;

// // import java.net.http.HttpHeaders;

// // import org.junit.jupiter.api.BeforeAll;
// // import org.junit.jupiter.api.Order;
// // import org.junit.jupiter.api.Test;
// // import org.junit.jupiter.api.TestInstance;
// // import org.junit.jupiter.api.TestMethodOrder;
// // import org.mockito.BDDMockito;
// // import org.mockito.Mockito;
// // import org.springframework.beans.factory.annotation.Autowired;
// // import
// //
// org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
// // import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
// // import org.springframework.boot.test.context.SpringBootTest;
// // import org.springframework.boot.test.mock.mockito.MockBean;
// // import
// // org.springframework.boot.test.mock.mockito.MockitoTestExecutionListener;
// // import org.springframework.test.context.ActiveProfiles;
// // import org.springframework.test.context.TestExecutionListeners;
// // import org.springframework.test.context.junit4.SpringRunner;
// // import
// //
// org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
// // import org.springframework.test.web.servlet.MockMvc;
// // import
// org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
// // import org.springframework.test.web.servlet.result.MockMvcResultHandlers;

// // import com.fasterxml.jackson.core.JsonProcessingException;
// // import com.fasterxml.jackson.databind.ObjectMapper;

// // import labes.facomp.ufpa.br.meuegresso.controller.cota.CotaController;
// // import labes.facomp.ufpa.br.meuegresso.service.cota.CotaService;

// // @SpringBootTest
// // @AutoConfigureMockMvc
// // @ActiveProfiles("test")
// // @RunWith(SpringRunner.class)
// // @WebMvcTest(CotaController.class)
// // @TestInstance(Lifecycle.PER_CLASS)
// // @TestMethodOrder(OrderAnnotation.class)
// // @TestExecutionListeners({ DependencyInjectionTestExecutionListener.class,
// // MockitoTestExecutionListener.class })
// // public class CotaTest {

// // private static final Integer ID = 1;
// // private static final String NAME = "Pardo";
// // private static final String URL = "/api-travels/v1/cota";

// // HttpHeaders headers;

// // @Autowired
// // MockMvc mockMvc;

// // @MockBean
// // CotaService cotaService;

// // @BeforeAll
// // private void setUp() {
// // headers = new HttpHeaders();
// // headers.set("X-api-key", "FX001-ZBSY6YSLP");
// // }

// // @Test
// // @Order(1)
// // public void testSave() throws Exception {

// //
// BDDMockito.given(cotaService.save(Mockito.any(Cota.class))).willReturn(getMockCota());

// // mockMvc.perform(
// // MockMvcRequestBuilders.post(URL).content(getJsonPayload(ID, NAME,
// // RoleEnum.ROLE_ADMIN))
// //
// .contentType(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
// // .headers(headers))
// // .andDo(MockMvcResultHandlers.print())
// // .andExpect(status().isCreated())
// // .andExpect(jsonPath("$.data.id").value(ID))
// // .andExpect(jsonPath("$.data.name").value(NAME));

// // }
// // }

// // /**
// // * Method that fill a mock User object to use as return in the tests.
// // *
// // * @author
// // * @since 13/12/2020
// // *
// // * @return <code>User</code> object
// // * @throws ParseException
// // */
// // private User getMockUser() throws ParseException {
// // return new User(1, NAME);
// // }

// // /**
// // * Method that fill a mock UserDTO object to use as return in the tests.
// // *
// // * @author
// // * @since 13/12/2020
// // *
// // * @param id
// // * @param accountNumber
// // * @param accountType
// // * @return <code>String</code> with the UserDTO payload
// // *
// // * @throws JsonProcessingException
// // */
// // private String getJsonPayload(Long id, String name) throws
// // JsonProcessingException {

// // CotaDTO dto = new CotaDTO(id, name);
// // return new ObjectMapper().writeValueAsString(dto);
// // }
// // }
