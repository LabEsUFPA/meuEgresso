package labes.facomp.ufpa.br.meuegresso.controller.usuario;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.time.Instant;
import java.util.Date;
import java.util.NoSuchElementException;
import java.util.Set;

import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.controller.grupo.GrupoController;
import labes.facomp.ufpa.br.meuegresso.dto.grupo.GrupoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioDTO;
import labes.facomp.ufpa.br.meuegresso.enumeration.ResponseType;


@SpringBootTest
@ActiveProfiles("test")
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class UsuarioControllerTest {

    @Autowired
    private UsuarioController usuarioController;

    @Autowired
    private GrupoController grupoController;

    @Autowired
    private ModelMapper mapper;

    private final String NOME_TESTE_USUARIO = "TESTE USUARIO";
    private final String EMAIL_TESTE_USUARIO = "teste@gmail.com";
    private final String USERNAME_TESTE_USUARIO = "TESTE USUARIO";
    private final String PASSWORD_TESTE_USUARIO = "TESTE USUARIO";

    @Test
    @Order(1)
    public void testCadastrarUsuario() throws Exception {
        UsuarioDTO usuarioDTO = UsuarioDTO.builder()
                .nome(NOME_TESTE_USUARIO)
                .email(EMAIL_TESTE_USUARIO)
                .username(
                        USERNAME_TESTE_USUARIO)
                .password(
                        PASSWORD_TESTE_USUARIO)
                .nascimento(Date.from(Instant.now()))
                .build();

        GrupoDTO grupoDTO;
        try {
            grupoDTO = grupoController.findByNomeGrupo("NOVO NOME");
            usuarioDTO.setGrupos(Set.of(grupoDTO));
        } catch (NoSuchElementException e) {
            grupoDTO = GrupoDTO.builder().nomeGrupo("NOVO NOME").build();
            grupoDTO = grupoController.cadastrarGrupo(grupoDTO);
            assertNotNull(grupoDTO.getIdGrupo());
            usuarioDTO.setGrupos(Set.of(grupoDTO));
        } finally {
            assertEquals(ResponseType.USUARIO_SUCESS_SAVE.getMessage(), usuarioController.cadastrarUsuario(usuarioDTO));
        }
    }

    @Test
    @Order(2)
    public void testFindById() throws Exception {
        assertNotNull(usuarioController.findById(1));
    }

    @Test
    @Order(3)
    public void testConsultarUsuarios() throws Exception {
        assertNotNull(usuarioController.consultarUsuarios());
    }

    @Test
    @Order(4)
    public void testAtualizarUsuario() throws Exception {
        final String NOVO_NOME = "NOVO NOME TESTE";
        final String NOVO_EMAIL = "novoteste@gmail.com";

        UsuarioAuthDTO usuarioAuthDTO = usuarioController.findById(1);

        UsuarioDTO usuarioDTO = mapper.map(usuarioAuthDTO, UsuarioDTO.class);
        
        usuarioDTO.setNome(NOVO_NOME);
        usuarioDTO.setEmail(NOVO_EMAIL);

        usuarioAuthDTO = usuarioController.atualizarUsuario(usuarioDTO);

        assertEquals(usuarioAuthDTO.getNome(), NOVO_NOME);
        assertEquals(usuarioAuthDTO.getEmail(), NOVO_EMAIL);

    }

    @Test
    @Order(5)
    public void testDeleteById() throws Exception {

        usuarioController.deleteById(1);
    }

}
