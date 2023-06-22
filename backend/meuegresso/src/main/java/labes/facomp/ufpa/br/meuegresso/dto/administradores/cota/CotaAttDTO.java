package labes.facomp.ufpa.br.meuegresso.dto.administradores.cota;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Cota a fim de representar os dados de auditoria.
 *
 * @author Alfredo Gabriel
 * @since 22/04/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CotaAttDTO {

    private Integer id;

    @NotBlank(message = "Insira o nome da cota.")
    private String nome;
}
