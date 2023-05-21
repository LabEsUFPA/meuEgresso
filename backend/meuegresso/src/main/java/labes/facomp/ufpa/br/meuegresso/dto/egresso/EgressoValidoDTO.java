package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

/**
 * Encapsulamento dos dados do egresso valido fornecido pela Marcele.
 *
 * @author Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
public class EgressoValidoDTO {

    private Integer id;

    @NotNull(message = "Insira seu nome.")
    private String nome;

    @Pattern(regexp = "[0-9]{12}|$", message = "Informe uma matricula valida.")
    private String matricula;

    private String email;

}
