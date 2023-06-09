package labes.facomp.ufpa.br.meuegresso.dto.usuario;

import java.util.HashSet;
import java.util.Set;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.enumeration.Grupos;
import lombok.Data;

/**
 * Encapsulamento da tabela Grupo a fim de representar somente os dados não
 * sensiveis, removendo a senha.
 * Nota: Use este DTO somente para persistir o usuário, não retorne o mesmo.
 *
 * @author Camilo Santos
 * @since 16/04/2023
 * @version 1.0
 */
@Data
public class UsuarioAuthDTO {

    private Integer id;

    @NotBlank(message = "Informe um usuário.")
    private String username;

    @Email(message = "Informe um e-mail valido.")
    @NotBlank(message = "Informe um email.")
    private String email;

    @NotBlank(message = "Informe um nome.")
    private String nome;

    private Set<Grupos> grupos = new HashSet<>();
}
