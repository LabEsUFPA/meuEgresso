package labes.facomp.ufpa.br.meuegresso.controller.usuario;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.usuario.UsuarioDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.grupo.GrupoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;
import labes.facomp.ufpa.br.meuegresso.service.auth.AuthService;

@SpringBootTest
@ActiveProfiles("test")
public class UsuarioControllerTest {

    @Autowired
    private UsuarioController usuarioController;

    @InjectMocks
    private UsuarioModel usuarioModel = new UsuarioModel();

    @InjectMocks
    private GrupoModel grupoModel = new GrupoModel();

    @InjectMocks
    private AuthService authService;

    @Mock
    private UsuarioRepository usuarioRepository;

    @Mock
    private GrupoRepository grupoRepository;

    private ModelMapper mapper;

    private UsuarioDTO usuarioDTO;

    private JwtAuthenticationToken authToken;

    @BeforeEach
    public void setUp() {
        grupoModel.setNomeGrupo("ADMIN");
        grupoModel.setIdGrupo(1);

        grupoRepository.save(grupoModel);

        Set<GrupoModel> grupos = new HashSet<GrupoModel>();
        grupos.add(grupoModel);

        usuarioModel.setUsername("username_test");
        usuarioModel.setNome("nome_test");
        usuarioModel.setEmail("teste@gmail.com");
        usuarioModel.setPassword("teste123");
        usuarioModel.setId(1);
        usuarioModel.setGrupos(grupos);
        usuarioRepository.save(usuarioModel);

    }

    /*
     * @Test
     * void testAtualizarUsuario() {
     * UsuarioModel usuarioModel = usuarioRepository.findById(1).get();
     * UsuarioDTO usuarioDTO = mapper.map(usuarioModel, UsuarioDTO.class);
     * String Token = authService.authenticate(usuarioModel);
     * usuarioController.atualizarUsuario(usuarioDTO, Token);
     * 
     * 
     * }
     */
    @Test
    void testDeleteById() {
        // UsuarioModel usuarioModel = usuarioRepository.findById(1);
        Mockito.when(usuarioRepository.findById(1)).thenReturn(Optional.of(usuarioModel));
        Integer id = usuarioModel.getId();
        boolean bool = usuarioController.deleteById(id);
        assertEquals(true, bool);
    }

    @Test
    void testFindById() {
        UsuarioModel usuarioModel = usuarioRepository.findById(1).get();
        UsuarioAuthDTO usuarioAuthDTO = mapper.map(usuarioModel, UsuarioAuthDTO.class);
        String Token = authService.authenticate(usuarioModel);
        JwtAuthenticationToken jwtToken = mapper.map(Token, JwtAuthenticationToken.class);
        UsuarioAuthDTO usuarioAuthDTO2 = usuarioController.findById(jwtToken);
        assertEquals(usuarioAuthDTO, usuarioAuthDTO2);
    }
}
