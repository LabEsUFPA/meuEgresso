package labes.facomp.ufpa.br.meuegresso.exceptions;

import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import lombok.Getter;

@Getter
public class UnauthorizedRequestException extends Exception {

    private final String internalCode;

    public UnauthorizedRequestException(String message, String internalCode) {
        super(message);
        this.internalCode = internalCode;
    }

    public UnauthorizedRequestException() {
        super(ErrorType.UNAUTHORIZED_TRANSACTION.getMessage());
        this.internalCode = ErrorType.UNAUTHORIZED_TRANSACTION.getInternalCode();
    }
}
