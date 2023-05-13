package labes.facomp.ufpa.br.meuegresso.exceptions;

import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import lombok.Getter;

@Getter
public class EmptyBodyRequestListException extends Exception {

    private final String internalCode;

    public EmptyBodyRequestListException(){
        super(ErrorType.REPORT_009.getMessage());
        this.internalCode = ErrorType.REPORT_009.getInternalCode();
    }
}
