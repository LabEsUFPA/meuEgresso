package labes.facomp.ufpa.br.meuegresso.controller.adviser;

import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.mail.MailException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import jakarta.mail.MessagingException;
import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import labes.facomp.ufpa.br.meuegresso.erros.ErrorResponse;
import labes.facomp.ufpa.br.meuegresso.exceptions.DataNotDeletedException;
import labes.facomp.ufpa.br.meuegresso.exceptions.DataNotSaveException;
import labes.facomp.ufpa.br.meuegresso.exceptions.EmptyBodyRequestListException;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.NameAlreadyExistsException;
import labes.facomp.ufpa.br.meuegresso.exceptions.NotFoundException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;

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
	 * Caso algum recurso não seja encontrado no banco de dados sera retornado uma
	 * mensagem padronizada.
	 *
	 * @param ex Excessão capturada.
	 * @return Menssagem.
	 * @author Alfredo Gabriel
	 * @since 26/03/2023
	 */
	@ExceptionHandler(NotFoundException.class)
	@ResponseStatus(code = HttpStatus.BAD_REQUEST)
	public ErrorResponse handleNotfoundException(NotFoundException ex) {
		return ErrorResponse.builder()
				.message(ex.getMessage())
				.internalCode(ex.getInternalCode())
				.build();
	}

	/**
	 * Caso alguma entidade não seja valida (dados diferentes do esperado), será
	 * retornado o atributo e a menssagem pre definida.
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
		errors.put(ErrorType.REPORT_001.getMessage(), ErrorType.REPORT_001.getInternalCode());
		ex.getBindingResult().getAllErrors().forEach(error -> {
			String fieldName = ((FieldError) error).getField();
			String errorMessage = error.getDefaultMessage();
			errors.put(fieldName, errorMessage);
		});
		return new ResponseEntity<>(errors, HttpStatus.UNPROCESSABLE_ENTITY);
	}

	/**
	 * Caso a autenticação não seja bem sucedida, será retornado a mensagem
	 * pre-estabelicida.
	 *
	 * @param ex Excessão capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 26/03/2023
	 */
	@ExceptionHandler(BadCredentialsException.class)
	@ResponseStatus(code = HttpStatus.UNAUTHORIZED)
	public ErrorResponse handleBadCredentialsException(BadCredentialsException ex) {
		return ErrorResponse.builder()
				.message(ErrorType.REPORT_003.getMessage())
				.technicalMessage(ex.getLocalizedMessage())
				.internalCode(ErrorType.REPORT_003.getInternalCode())
				.build();
	}

	/**
	 * Caso seja realizado uma requisição invalida.
	 *
	 * @param ex Excessão capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 26/03/2023
	 */
	@ExceptionHandler(UnauthorizedRequestException.class)
	public ResponseEntity<ErrorResponse> handleUnauthorizedRequestException(UnauthorizedRequestException ex) {
		ErrorResponse error = new ErrorResponse(
				ex.getMessage(),
				ex.getLocalizedMessage(),
				ex.getInternalCode());
		return new ResponseEntity<>(error, HttpStatus.UNAUTHORIZED);
	}

	/**
	 * Caso seja realizado uma requisição invalida.
	 *
	 * @param ex Excessão capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 26/03/2023
	 */
	@ExceptionHandler(InvalidRequestException.class)
	public ResponseEntity<ErrorResponse> handleInvalidRequestException(InvalidRequestException ex) {
		ErrorResponse error = new ErrorResponse(
				ex.getMessage(),
				null,
				ex.getInternalCode());
		return new ResponseEntity<>(error, HttpStatus.UNAUTHORIZED);
	}

	/**
	 * Caso seja solicitado o delete de uma entidade não existente.
	 *
	 * @param ex Excessão capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 26/03/2023
	 */
	@ExceptionHandler(DataNotDeletedException.class)
	public ResponseEntity<ErrorResponse> handleDataNotDeletedException(DataNotDeletedException ex) {
		ErrorResponse error = new ErrorResponse(
				ex.getMessage(),
				null,
				ex.getInternalCode());
		return new ResponseEntity<>(error, HttpStatus.UNPROCESSABLE_ENTITY);
	}

	/**
	 * Caso a autenticação não seja encontrado nenhum elemento correspondente.
	 *
	 * @param ex Excessão capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@ExceptionHandler(NoSuchElementException.class)
	public ResponseEntity<ErrorResponse> handleNotFound(NoSuchElementException ex) {
		ErrorResponse error = new ErrorResponse(
				ErrorType.REPORT_004.getMessage(),
				ex.getLocalizedMessage(),
				ErrorType.REPORT_004.getInternalCode());
		return new ResponseEntity<>(error, HttpStatus.NOT_FOUND);
	}

	/**
	 * Caso a autenticação não seja encontrado nenum exemplo de e-mail
	 *
	 * @param ex Excessão capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@ExceptionHandler(HttpMessageNotReadableException.class)
	public ResponseEntity<ErrorResponse> handleNotFound(HttpMessageNotReadableException ex) {
		ErrorResponse error = new ErrorResponse(
				ErrorType.REPORT_005.getMessage(),
				ex.getLocalizedMessage(),
				ErrorType.REPORT_005.getInternalCode());
		return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
	}

	/**
	 * Caso a autenticação seja ja exista cadastrado um determinado marcado como
	 * unique.
	 *
	 * @param ex Excessão capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 * @see {@link EmptyBodyRequestListException}
	 */
	@ExceptionHandler({ EmptyBodyRequestListException.class })
	@ResponseStatus(code = HttpStatus.BAD_REQUEST)
	public ErrorResponse handleEmptyBodyRequestListException(
			EmptyBodyRequestListException ex) {

		ErrorResponse error = new ErrorResponse(
				ex.getMessage(),
				ex.getLocalizedMessage(),
				ex.getInternalCode());

		return error;
	}

	/**
	 * Caso seja feito uma requição sem dados na lista esperada.
	 *
	 * @param ex Excessão capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 * @see {@link NameAlreadyExistsException}
	 */
	@ExceptionHandler({ NameAlreadyExistsException.class })
	@ResponseStatus(code = HttpStatus.BAD_REQUEST)
	public ErrorResponse handleEmptyBodyRequestListException(
			NameAlreadyExistsException ex) {

		ErrorResponse error = new ErrorResponse(
				ex.getMessage(),
				ex.getLocalizedMessage(),
				ex.getInternalCode());

		return error;
	}

	/**
	 * Caso a haja problemas no envio do e-mail.
	 *
	 * @param ex Excessão capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@ExceptionHandler({ MailException.class, MessagingException.class })
	@ResponseStatus(code = HttpStatus.INTERNAL_SERVER_ERROR)
	public ResponseEntity<ErrorResponse> handleMailException(MailException ex) {
		ErrorResponse error = new ErrorResponse(
				ErrorType.REPORT_006.getMessage(),
				ex.getLocalizedMessage(),
				ErrorType.REPORT_006.getInternalCode());
		return new ResponseEntity<>(error, HttpStatus.INTERNAL_SERVER_ERROR);
	}

	/**
	 * Caso haja algum problema ao salvar o dado.
	 *
	 * @param ex Excessão capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@ExceptionHandler(DataNotSaveException.class)
	@ResponseStatus(code = HttpStatus.INTERNAL_SERVER_ERROR)
	public ErrorResponse handleDataNotSaveException(DataNotSaveException ex) {
		ErrorResponse error = new ErrorResponse(
				ex.getMessage(),
				ex.getLocalizedMessage(),
				ex.getInternalCode());
		return error;
	}

}
