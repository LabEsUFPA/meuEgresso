package labes.facomp.ufpa.br.meuegresso.exceptions;

import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import lombok.Getter;

@Getter
public class EmailAlreadyExistsException extends Exception {
    private final String internalCode;

    public EmailAlreadyExistsException() {
        super(ErrorType.USER_004.getMessage());
        this.internalCode = ErrorType.USER_004.getInternalCode();
    }
}