package labes.facomp.ufpa.br.meuegresso.dto.auth;

import lombok.Builder;
import lombok.Data;

/**
 * Encapsulamento de uma autenticação bem sucedida.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Data
@Builder
public class AuthenticationResponse {

	private String token;

}
