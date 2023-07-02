package labes.facomp.ufpa.br.meuegresso.exceptions;

import lombok.Getter;

@Getter
public class UnauthorizedRegisterException extends Exception {
    private final String internalCode;

    public UnauthorizedRegisterException(String message, String internalCode) {
        super(message);
        this.internalCode = internalCode;
    }
}
