package labes.facomp.ufpa.br.meuegresso.exceptions;

import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import lombok.Getter;

@Getter
public class NotValidEgressoException extends Exception {

    private final String internalCode;

    public NotValidEgressoException(String message, String internalCode) {
        super(message);
        this.internalCode = internalCode;
    }

    public NotValidEgressoException() {
        super(ErrorType.EGRESSO_NAO_VALIDO.getMessage());
        this.internalCode = ErrorType.EGRESSO_NAO_VALIDO.getInternalCode();
    }
}