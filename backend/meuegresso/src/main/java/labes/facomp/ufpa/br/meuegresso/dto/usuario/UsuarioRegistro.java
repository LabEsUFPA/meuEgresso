package labes.facomp.ufpa.br.meuegresso.dto.usuario;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsuarioRegistro {

    @NotBlank(message = "Informe um usuário.")
    private String username;

    @NotBlank(message = "Informe uma senha.")
    private String password;

    @Email(message = "Informe um e-mail valido.")
    @NotBlank(message = "Informe um email.")
    private String email;

    @NotBlank(message = "Informe um nome.")
    private String nome;

    @Pattern(regexp = "[0-9]{12}|$", message = "Informe uma matrícula válida.")
    private String registration;
}
