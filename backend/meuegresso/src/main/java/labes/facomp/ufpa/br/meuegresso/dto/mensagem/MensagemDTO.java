package labes.facomp.ufpa.br.meuegresso.dto.mensagem;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento dos dados de uma mensagem a ser retornada a aplicação
 *
 * @author Camilo Santos
 * @since 16/06/2023
 * @version 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MensagemDTO {

    private Integer id;

    private String corpo;

    private String escopo;
    
}
