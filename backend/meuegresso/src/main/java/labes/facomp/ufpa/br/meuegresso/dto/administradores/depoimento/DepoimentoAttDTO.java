package labes.facomp.ufpa.br.meuegresso.dto.administradores.depoimento;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Curso a fim de representar os dados de auditoria.
 *
 * @author Alfredo Gabriel
 * @since 22/04/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DepoimentoAttDTO {

    private Integer id;

    @NotBlank(message = "Insira a descrição do depoimento.")
    private String descricao;

    private Integer egressoId;
}
