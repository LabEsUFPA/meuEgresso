package labes.facomp.ufpa.br.meuegresso.dto.administradores.anuncio;

import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.AuditableDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Comentario a fim de representar os dados de
 * auditoria.
 *
 * @author Alfredo Gabriel
 * @since 22/04/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class ComentarioDTO extends AuditableDTO {

    private Integer id;

    @NotBlank(message = "Insira um comentário não vazio.")
    private String descricao;

}