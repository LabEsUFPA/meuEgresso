package labes.facomp.ufpa.br.meuegresso.service.auth;

import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final JwtService tokenService;

    private final UsuarioService userService;

    public String authenticate(UsuarioModel usuarioModel) {
        String scope = usuarioModel.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.joining(" "));
        return tokenService.generateToken(usuarioModel, scope);
    }

    public UserDetails register(UsuarioModel user) {
        return userService.save(user);
    }
}
