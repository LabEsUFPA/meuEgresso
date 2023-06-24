package labes.facomp.ufpa.br.meuegresso.dto.auth;

import java.util.Optional;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * Encapsulamento da solicitação de autenticação.
 *
 * @author Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
public class AuthRecoveryPasswordRequest {

	@NotBlank(message = "Informe o email")
	private String email;

	private Optional<String> redirect;

}
