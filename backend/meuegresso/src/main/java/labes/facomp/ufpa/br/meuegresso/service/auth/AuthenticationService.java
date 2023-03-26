package labes.facomp.ufpa.br.meuegresso.service.auth;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationRequest;
import labes.facomp.ufpa.br.meuegresso.dto.auth.AuthenticationResponse;
import labes.facomp.ufpa.br.meuegresso.service.token.TokenService;
import lombok.RequiredArgsConstructor;

/**
 * Serviço responsável por autenticar o usuário criando sua autorização no contexto de segurança.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Service
@RequiredArgsConstructor
public class AuthenticationService {

    private final TokenService tokenService;

    private final AuthenticationManager authenticationManager;


    /**
     * Metodo responsável por autenticar e gerar o token de acesso.
     *
     * @param authenticationRequest Username e senha do usuário.
     * @return Token de autenticação
     * @author Alfredo Gabriel
     * @since 26/03/2023
     */
    public AuthenticationResponse authenticate(AuthenticationRequest authenticationRequest) {
        Authentication auth = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        authenticationRequest.getUsername(), authenticationRequest.getPassword()));
        return AuthenticationResponse.builder().token(tokenService.generateToken(auth)).build();
    }

}
