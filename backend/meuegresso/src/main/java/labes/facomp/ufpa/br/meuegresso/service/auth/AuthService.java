package labes.facomp.ufpa.br.meuegresso.service.auth;

import java.util.stream.Collectors;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import lombok.RequiredArgsConstructor;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 21/04/2023
 * @version 1.0
 */
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

    public String randomPassword() {
        return RandomStringUtils.randomAlphanumeric(8);
    }
}
