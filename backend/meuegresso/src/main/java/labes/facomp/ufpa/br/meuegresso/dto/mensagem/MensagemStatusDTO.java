package labes.facomp.ufpa.br.meuegresso.dto.mensagem;

import java.time.LocalDateTime;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento dos dados de uma mensagem a ser retornada a aplicação
 *
 * @author Pedro Inácio
 * @since 17/06/2023
 * @version 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MensagemStatusDTO {

    private Map<String, Map<LocalDateTime, String>> mensagensStatus;
    
}
