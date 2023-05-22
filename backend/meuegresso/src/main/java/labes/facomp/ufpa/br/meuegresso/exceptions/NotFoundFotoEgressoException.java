package labes.facomp.ufpa.br.meuegresso.exceptions;

import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import lombok.Getter;

@Getter
public class NotFoundFotoEgressoException extends Exception {

    private final String internalCode;

    public NotFoundFotoEgressoException(String message, String internalCode) {
        super(message);
        this.internalCode = internalCode;
    }

    public NotFoundFotoEgressoException() {
        super(ErrorType.FOTO_NAO_ENCONTRADA.getMessage());
        this.internalCode = ErrorType.FOTO_NAO_ENCONTRADA.getInternalCode();
    }
}
