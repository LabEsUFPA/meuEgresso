// package labes.facomp.ufpa.br.meuegresso.controller.cota;

// @SpringBootTest
// @AutoConfigureMockMvc
// @ActiveProfiles("test")
// @TestInstance(Lifecycle.PER_CLASS)
// @TestMethodOrder(OrderAnnotation.class)
// @TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, MockitoTestExecutionListener.class })
// public class CotaTest {

//     private static final Integer ID = 1;
//     private static final String NAME = "Pardo";
//     private static final String URL = "/api-travels/v1/cota";

//     HttpHeaders headers;

//     @Autowired
//     MockMvc mockMvc;

//     @MockBean
//     CotaService cotaService;

//     @BeforeAll
//     private void setUp() {
//         headers = new HttpHeaders();
//         headers.set("X-api-key", "FX001-ZBSY6YSLP");
//     }

//     @Test
//     @Order(1)
//     public void testSave() throws Exception {

//         BDDMockito.given(cotaService.save(Mockito.any(Cota.class))).willReturn(getMockCota());

//         mockMvc.perform(
//                 MockMvcRequestBuilders.post(URL).content(getJsonPayload(ID, NAME, RoleEnum.ROLE_ADMIN))
//                         .contentType(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
//                         .headers(headers))
//                 .andDo(MockMvcResultHandlers.print())
//                 .andExpect(status().isCreated())
//                 .andExpect(jsonPath("$.data.id").value(ID))
//                 .andExpect(jsonPath("$.data.name").value(NAME));

//     }
// }

//     /**
//      * Method that fill a mock User object to use as return in the tests.
//      * 
//      * @author 
//      * @since 13/12/2020
//      * 
//      * @return <code>User</code> object
//      * @throws ParseException
//      */
//     private User getMockUser() throws ParseException {
//         return new User(1, NAME);
//     }

//     /**
//      * Method that fill a mock UserDTO object to use as return in the tests.
//      * 
//      * @author 
//      * @since 13/12/2020
//      * 
//      * @param id
//      * @param accountNumber
//      * @param accountType
//      * @return <code>String</code> with the UserDTO payload
//      * 
//      * @throws JsonProcessingException
//      */
//     private String getJsonPayload(Long id, String name) throws JsonProcessingException {

//         CotaDTO dto = new CotaDTO(id, name);
//         return new ObjectMapper().writeValueAsString(dto);
//     }
// }
