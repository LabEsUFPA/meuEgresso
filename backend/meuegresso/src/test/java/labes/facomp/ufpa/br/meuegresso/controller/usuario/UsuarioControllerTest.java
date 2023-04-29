package labes.facomp.ufpa.br.meuegresso.controller.usuario;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.HashSet;
import java.util.Set;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.ContentResultMatchers;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;

import com.fasterxml.jackson.databind.ObjectMapper;

import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationRequest;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationResponse;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.grupo.GrupoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;
import labes.facomp.ufpa.br.meuegresso.service.auth.AuthService;
import labes.facomp.ufpa.br.meuegresso.service.auth.JwtService;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestMethodOrder(OrderAnnotation.class)
public class UsuarioControllerTest {

    @InjectMocks
    private UsuarioModel usuarioModel; //= new UsuarioModel();

    @InjectMocks
    private GrupoModel grupoModel; //= new GrupoModel();

    private ContentResultMatchers contentResultMatchers;

    @Mock
    private AuthService authService;

    @Mock
    private GrupoRepository grupoRepository;

    @Mock
    private ModelMapper mapper;

    @Autowired
    private MockMvc mockMvc;

    private String token;

    @BeforeEach
    void setUp() throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        grupoModel = new GrupoModel();
        grupoModel.setNomeGrupo("ADMIN");
        
        grupoModel = grupoRepository.save(grupoModel);

        Set<GrupoModel> grupos = new HashSet<>();
        grupos.add(grupoModel);
        
        usuarioModel = new UsuarioModel();
        usuarioModel.setUsername("username_test");
        usuarioModel.setNome("nome_test");
        usuarioModel.setEmail("teste@gmail.com");
        usuarioModel.setPassword("teste123");
        usuarioModel.setGrupos(grupos);

        mockMvc.perform(MockMvcRequestBuilders.post("/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(usuarioModel)))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isCreated())
                .andReturn();

        AuthenticationRequest authenticationRequest = new AuthenticationRequest();
        authenticationRequest.setUsername(usuarioModel.getUsername());
        authenticationRequest.setPassword(usuarioModel.getPassword());
        String objectJson = objectMapper.writeValueAsString(authenticationRequest);

        MvcResult resultado =  mockMvc.perform(MockMvcRequestBuilders.post("/auth/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectJson))
                .andDo(MockMvcResultHandlers.print())
                .andExpect(status().isOk())
                .andReturn();
        String token = resultado.getResponse().getContentAsString();

        AuthenticationResponse authenticationResponse = objectMapper.readValue(token, AuthenticationResponse.class);
        this.token = authenticationResponse.getToken();
    }


@Test
@Order(1)
    void testFindById() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/usuario")
                .contentType(MediaType.APPLICATION_JSON)
                .header("Authorization ", "Bearer " + this.token))
                .andExpect(status().isOk());
}

    @Test
    @Order(2)
    void testAtualizarUsuario() {
        //UsuarioModel usuarioModel = usuarioRepository.findById(1).get();
        //UsuarioDTO usuarioDTO = mapper.map(usuarioModel, UsuarioDTO.class);
        //String Token = authService.authenticate(usuarioModel);
        //usuarioController.atualizarUsuario(usuarioDTO, Token);

        mockMvc.perform(MockMvcRequestBuilders.put("/usuario")
                .contentType(MediaType.APPLICATION_JSON)
                .header("Authorization ", "Bearer " + this.token)
                .andExpect(status().isOk()));
    }
    
    @Test
    @Order(3)
    void testDeleteById() {
        // UsuarioModel usuarioModel = usuarioRepository.findById(1);
        //Mockito.when(usuarioRepository.findById(1)).thenReturn(Optional.of(usuarioModel));
        //Integer id = usuarioModel.getId();
        //boolean bool = usuarioController.deleteById(id);
        //assertEquals(true, bool);

        mockMvc.perform(MockMvcRequestBuilders.delete("/usuario")
                .contentType(MediaType.APPLICATION_JSON)
                .header("Authorization ", "Bearer " + this.token)
                .andExpect(contentResultMatchers.contentType(true)));
    }
}