package labes.facomp.ufpa.br.meuegresso.exceptions;

import lombok.Getter;

@Getter
public class UnalthorizedRegisterException extends Exception {
    private final String internalCode;

    public UnalthorizedRegisterException(String message, String internalCode) {
        super(message);
        this.internalCode = internalCode;
    }
}
