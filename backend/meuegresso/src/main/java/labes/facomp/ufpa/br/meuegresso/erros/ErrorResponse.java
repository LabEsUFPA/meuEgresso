package labes.facomp.ufpa.br.meuegresso.erros;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class ErrorResponse {

    private String message;

    private String technicalMessage;

    private String internalCode;
}
