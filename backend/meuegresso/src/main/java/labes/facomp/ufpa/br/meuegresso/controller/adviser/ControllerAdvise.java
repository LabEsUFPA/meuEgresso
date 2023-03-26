package labes.facomp.ufpa.br.meuegresso.controller.adviser;

import java.util.HashMap;
import java.util.Map;

import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Responsável por tratar as exceções gerais da aplicação.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@ControllerAdvice
public class ControllerAdvise {

    /**
     *  Caso algum recurso não seja encontrado no banco de dados sera retornado uma mensagem padronizada.
     *
     * @param ex Excessão capturada.
     * @return Menssagem.
     * @author Alfredo Gabriel
     * @since 26/03/2023
     */
    @ExceptionHandler(NotFoundException.class)
    public ResponseEntity<String> handleNotfoundException(NotFoundException ex) {
        return new ResponseEntity<>("Recurso não encontrado.", HttpStatus.BAD_REQUEST);
    }

    /**
     *  Caso alguma entidade não seja valida (dados diferentes do esperado), será retornado o atributo e a menssagem pre definida.
     *
     * @param ex Excessão capturada.
     * @return Mapa contendo atributo e mensagem de erro.
     * @author Alfredo Gabriel
     * @since 26/03/2023
     */
    @ResponseStatus(HttpStatus.UNPROCESSABLE_ENTITY)
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<Map<String, String>> handleArgumentNotValid(MethodArgumentNotValidException ex) {
        Map<String, String> errors = new HashMap<>();
        ex.getBindingResult().getAllErrors().forEach(error -> {
            String fieldName = ((FieldError) error).getField();
            String errorMessage = error.getDefaultMessage();
            errors.put(fieldName, errorMessage);
        });
        return new ResponseEntity<>(errors, HttpStatus.UNPROCESSABLE_ENTITY);
    }

    /**
     * Caso a autenticação não seja bem sucedida, será retornado a mensagem pre-estabelicida.
     *
     * @param ex Excessão capturada.
     * @return Mensagem
     * @author Alfredo Gabriel
     * @since 26/03/2023
     */
    @ExceptionHandler(BadCredentialsException.class)
    public ResponseEntity<String> handleBadCredentialsException(BadCredentialsException ex) {
        return new ResponseEntity<>("Usuario ou senha incorretos.", HttpStatus.UNAUTHORIZED);
    }

}
