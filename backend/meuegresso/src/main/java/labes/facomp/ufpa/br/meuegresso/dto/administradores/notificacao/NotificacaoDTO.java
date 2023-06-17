package labes.facomp.ufpa.br.meuegresso.dto.administradores.notificacao;

import java.time.LocalDate;

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
    
    private LocalDate dataModificacao;
}
