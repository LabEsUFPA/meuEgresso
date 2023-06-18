package labes.facomp.ufpa.br.meuegresso.exceptions;

import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import lombok.Getter;

@Getter
public class ExpireRequestException extends Exception {

    private final String internalCode;

    public ExpireRequestException(String message, String internalCode) {
        super(message);
        this.internalCode = internalCode;
    }

    public ExpireRequestException() {
        super(ErrorType.SOLICITACAO_EXPIRADA.getMessage());
        this.internalCode = ErrorType.SOLICITACAO_EXPIRADA.getInternalCode();
    }
}
