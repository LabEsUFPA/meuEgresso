package labes.facomp.ufpa.br.meuegresso.dto.administradores.notificacao;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NotificacaoDTO {

    private String nome;

    private Integer usuarioId;

    private String status;

    private LocalDateTime dataModificacao;
}
