package labes.facomp.ufpa.br.meuegresso.erros;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ErrorResponse {

    private String message;

    private String technicalMessage;

    private String internalCode;
}
