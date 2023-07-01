package labes.facomp.ufpa.br.meuegresso.exceptions;

import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import lombok.Getter;

@Getter
public class EmailMensagemNotFoundException extends Exception {
    
    private final String internalCode;

    public EmailMensagemNotFoundException(String message, String internalCode) {
        super(message);
        this.internalCode = internalCode;
    }

    public EmailMensagemNotFoundException() {
        super(ErrorType.DATABASE_003.getMessage());
        this.internalCode = ErrorType.DATABASE_003.getInternalCode();
    }
}
