package labes.facomp.ufpa.br.meuegresso.exceptions;

import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import lombok.Getter;

@Getter
public class MatriculaAlreadyExistsException extends Exception {
    private final String internalCode;

    public MatriculaAlreadyExistsException(String message, String internalCode) {
        super(message);
        this.internalCode = internalCode;
    }

    public MatriculaAlreadyExistsException() {
        super(ErrorType.REPORT_007.getMessage());
        this.internalCode = ErrorType.REPORT_007.getInternalCode();
    }
}
