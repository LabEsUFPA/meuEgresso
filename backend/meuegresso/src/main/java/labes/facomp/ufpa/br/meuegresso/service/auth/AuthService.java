package labes.facomp.ufpa.br.meuegresso.service.auth;

import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final JwtService tokenService;

    public String authenticate(UsuarioModel usuarioModel) {
        String scope = usuarioModel.getAuthorities().stream()
                .map(GrantedAuthority::toString)
                .collect(Collectors.joining(" "));
        return tokenService.generateToken(usuarioModel, scope);
    }
}
