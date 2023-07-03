package labes.facomp.ufpa.br.meuegresso.dto.administradores.genero;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Genero a fim de representar os dados de auditoria.
 *
 * @author Alfredo Gabriel
 * @since 22/04/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class GeneroAttDTO {

    private Integer id;

    @Valid
    @NotNull(message = "Informe o gênero do usuário.")
    private String nome;

}
