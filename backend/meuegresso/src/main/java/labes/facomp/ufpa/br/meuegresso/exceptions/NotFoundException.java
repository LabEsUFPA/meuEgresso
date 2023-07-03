package labes.facomp.ufpa.br.meuegresso.exceptions;

import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import lombok.Getter;

@Getter
public class NotFoundException extends Exception {

    private final String internalCode;

    public NotFoundException(String message, String internalCode) {
        super(message);
        this.internalCode = internalCode;
    }

    public NotFoundException() {
        super(ErrorType.REPORT_004.getMessage());
        this.internalCode = ErrorType.REPORT_004.getInternalCode();
    }
}
