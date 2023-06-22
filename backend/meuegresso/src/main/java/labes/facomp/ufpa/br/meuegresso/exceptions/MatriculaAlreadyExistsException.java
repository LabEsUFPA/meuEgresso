package labes.facomp.ufpa.br.meuegresso.exceptions;

import lombok.Getter;

@Getter
public class MatriculaAlreadyExistsException extends Exception {
    private final String internalCode;

    public MatriculaAlreadyExistsException(String message, String internalCode) {
        super(message);
        this.internalCode = internalCode;
    }
}
