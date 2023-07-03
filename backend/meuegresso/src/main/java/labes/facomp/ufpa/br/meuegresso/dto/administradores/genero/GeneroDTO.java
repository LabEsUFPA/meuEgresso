package labes.facomp.ufpa.br.meuegresso.dto.administradores.genero;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.AuditableDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
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
@EqualsAndHashCode(callSuper = false)
public class GeneroDTO extends AuditableDTO {

    private Integer id;

    @Valid
    @NotNull(message = "Informe o gênero do usuário.")
    private String nome;

}
