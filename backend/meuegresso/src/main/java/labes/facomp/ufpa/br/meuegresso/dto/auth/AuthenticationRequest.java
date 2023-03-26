package labes.facomp.ufpa.br.meuegresso.dto.auth;

import lombok.Data;

/**
 * Encapsulamento da solicitação de autenticação.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Data
public class AuthenticationRequest {

    private String username;

    private String password;
}
