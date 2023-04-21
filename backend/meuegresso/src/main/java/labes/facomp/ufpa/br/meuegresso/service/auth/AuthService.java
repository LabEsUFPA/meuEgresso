package labes.facomp.ufpa.br.meuegresso.service.auth;

import java.util.stream.Collectors;

import org.springframework.security.core.Authentication;
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

    public String authenticate(Authentication auth) {
        String scope = auth.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.joining(" "));
        UsuarioModel user = userService.loadUserByUsername(auth.getName());
        return tokenService.generateToken(user, scope);
    }

    public UserDetails register(UsuarioModel user) {
        return userService.save(user);
    }
}
