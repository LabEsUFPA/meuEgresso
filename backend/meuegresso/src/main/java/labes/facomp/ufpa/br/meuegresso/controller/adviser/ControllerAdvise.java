package labes.facomp.ufpa.br.meuegresso.controller.adviser;

import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.mail.MailException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import jakarta.mail.MessagingException;
import labes.facomp.ufpa.br.meuegresso.enumeration.ErrorType;
import labes.facomp.ufpa.br.meuegresso.erros.ErrorResponse;
import labes.facomp.ufpa.br.meuegresso.exceptions.DataNotDeletedException;
import labes.facomp.ufpa.br.meuegresso.exceptions.DataNotSaveException;
import labes.facomp.ufpa.br.meuegresso.exceptions.EmptyBodyRequestListException;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.MatriculaAlreadyExistsException;
import labes.facomp.ufpa.br.meuegresso.exceptions.NameAlreadyExistsException;
import labes.facomp.ufpa.br.meuegresso.exceptions.NotFoundException;
import labes.facomp.ufpa.br.meuegresso.exceptions.NotFoundFotoEgressoException;
import labes.facomp.ufpa.br.meuegresso.exceptions.NotValidEgressoException;
import labes.facomp.ufpa.br.meuegresso.exceptions.UnauthorizedRequestException;

/**
 * Responsável por tratar as exceções gerais da aplicação.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@RestControllerAdvice
public class ControllerAdvise {

	/**
	 * Caso algum recurso não seja encontrado no banco de dados será retornado uma
	 * mensagem padronizada.
	 *
	 * @param ex Exceção capturada.
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
	 * Caso alguma entidade não seja válida (dados diferentes do esperado), será
	 * retornado o atributo e a mensagem pré-definida.
	 *
	 * @param ex Exceção capturada.
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
	 * pré-estabelecida.
	 *
	 * @param ex Exceção capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 26/03/2023
	 */
	@ResponseStatus(code = HttpStatus.UNAUTHORIZED)
	@ExceptionHandler(BadCredentialsException.class)
	public ErrorResponse handleBadCredentialsException(BadCredentialsException ex) {
		return ErrorResponse.builder()
				.message(ErrorType.USER_002.getMessage())
				.technicalMessage(ex.getLocalizedMessage())
				.internalCode(ErrorType.USER_002.getInternalCode())
				.build();
	}

	/**
	 * Caso a autenticação faça uma requisição que diz respeito
	 * a um egresso inválido.
	 * 
	 * @param ex Exceção capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 29/04/2023
	 * @see {@link NotValidEgressoException}
	 */
	@ExceptionHandler(NotValidEgressoException.class)
	@ResponseStatus(code = HttpStatus.EXPECTATION_FAILED)
	public ErrorResponse handleNotValidEgressoException(NotValidEgressoException ex) {
		return ErrorResponse.builder()
				.message(ex.getMessage())
				.technicalMessage(ex.getLocalizedMessage())
				.internalCode(ex.getInternalCode())
				.build();
	}

	/**
	 * Caso a autenticação não seja bem sucedida, será retornado a mensagem
	 * pré-estabelecida.
	 *
	 * @param ex Exceção capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 26/03/2023
	 */
	@ResponseStatus(code = HttpStatus.UNAUTHORIZED)
	@ExceptionHandler(AuthenticationException.class)
	public ErrorResponse handleAuthenticationException(AuthenticationException ex) {
		return ErrorResponse.builder()
				.message(ErrorType.USER_002.getMessage())
				.technicalMessage(ex.getLocalizedMessage())
				.internalCode(ErrorType.USER_002.getInternalCode())
				.build();
	}

	/**
	 * Caso a autenticação faça uma requisição que diz respeito
	 * a um usuário desabilitado.
	 * 
	 * @param ex Exceção capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 11/06/2023
	 */
	@ResponseStatus(code = HttpStatus.UNAUTHORIZED)
	@ExceptionHandler(DisabledException.class)
	public ErrorResponse handleDisabledException(DisabledException ex) {
		return ErrorResponse.builder()
				.message(ErrorType.USER_003.getMessage())
				.technicalMessage(ex.getLocalizedMessage())
				.internalCode(ErrorType.USER_003.getInternalCode())
				.build();
	}

	/**
	 * Caso seja realizada uma requisição não autorizada.
	 *
	 * @param ex Exceção capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 26/03/2023
	 */
	@ResponseStatus(code = HttpStatus.UNAUTHORIZED)
	@ExceptionHandler(UnauthorizedRequestException.class)
	public ErrorResponse handleUnauthorizedRequestException(UnauthorizedRequestException ex) {
		return new ErrorResponse(
				ex.getMessage(),
				ex.getLocalizedMessage(),
				ex.getInternalCode());
	}

	/**
	 * Caso seja realizada uma requisição inválida.
	 *
	 * @param ex Exceção capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 26/03/2023
	 */
	@ResponseStatus(code = HttpStatus.UNAUTHORIZED)
	@ExceptionHandler(InvalidRequestException.class)
	public ErrorResponse handleInvalidRequestException(InvalidRequestException ex) {
		return new ErrorResponse(
				ex.getMessage(),
				ex.getMessage(),
				ex.getInternalCode());
	}

	/**
	 * Caso seja solicitado o delete de uma entidade não existente.
	 *
	 * @param ex Exceção capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 26/03/2023
	 * @see {@link DataNotDeletedException}
	 */
	@ExceptionHandler(DataNotDeletedException.class)
	@ResponseStatus(code = HttpStatus.UNPROCESSABLE_ENTITY)
	public ErrorResponse handleDataNotDeletedException(DataNotDeletedException ex) {
		return new ErrorResponse(
				ex.getMessage(),
				ex.getMessage(),
				ex.getInternalCode());
	}

	/**
	 * Caso a autenticação não encontre nenhum elemento correspondente.
	 *
	 * @param ex Exceção capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@ResponseStatus(code = HttpStatus.NOT_FOUND)
	@ExceptionHandler(NoSuchElementException.class)
	public ErrorResponse handleNoSuchElementException(NoSuchElementException ex) {
		return new ErrorResponse(
				ErrorType.REPORT_004.getMessage(),
				ex.getLocalizedMessage(),
				ErrorType.REPORT_004.getInternalCode());
	}

	/**
	 * Caso o JSON gerado pela requisição apresente problemas de leitura.
	 *
	 * @param ex Exceção capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@ResponseStatus(code = HttpStatus.BAD_REQUEST)
	@ExceptionHandler(HttpMessageNotReadableException.class)
	public ErrorResponse handleNotFound(HttpMessageNotReadableException ex) {
		return new ErrorResponse(
				ErrorType.REPORT_005.getMessage(),
				ex.getLocalizedMessage(),
				ErrorType.REPORT_005.getInternalCode());
	}

	/**
	 * Caso seja feita uma requisição sem dados na lista esperada.
	 *
	 * @param ex Exceção capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 * @see {@link EmptyBodyRequestListException}
	 */
	@ExceptionHandler(EmptyBodyRequestListException.class)
	@ResponseStatus(code = HttpStatus.BAD_REQUEST)
	public ErrorResponse handleEmptyBodyRequestListException(
			EmptyBodyRequestListException ex) {
		return new ErrorResponse(
				ex.getMessage(),
				ex.getLocalizedMessage(),
				ex.getInternalCode());

	}

	/**
	 * Caso já exista cadastrado um determinado nome marcado como
	 * unique.
	 *
	 * @param ex Exceção capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 * @see {@link NameAlreadyExistsException}
	 */
	@ExceptionHandler({ NameAlreadyExistsException.class })
	@ResponseStatus(code = HttpStatus.BAD_REQUEST)
	public ErrorResponse handleNameAlreadyExistsException(
			NameAlreadyExistsException ex) {
		return new ErrorResponse(
				ex.getMessage(),
				ex.getLocalizedMessage(),
				ex.getInternalCode());
	}

	/**
	 * Caso haja problemas no envio do e-mail.
	 *
	 * @param ex Exceção capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@ResponseStatus(code = HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler({ MailException.class, MessagingException.class })
	public ErrorResponse handleMailException(MailException ex) {
		return new ErrorResponse(
				ErrorType.REPORT_006.getMessage(),
				ex.getLocalizedMessage(),
				ErrorType.REPORT_006.getInternalCode());
	}

	/**
	 * Caso haja algum problema ao salvar o dado.
	 *
	 * @param ex Exceção capturada.
	 * @return Mensagem
	 * @author Alfredo Gabriel
	 * @since 21/04/2023
	 */
	@ExceptionHandler(DataNotSaveException.class)
	@ResponseStatus(code = HttpStatus.INTERNAL_SERVER_ERROR)
	public ErrorResponse handleDataNotSaveException(DataNotSaveException ex) {
		return new ErrorResponse(
				ex.getMessage(),
				ex.getLocalizedMessage(),
				ex.getInternalCode());
	}

	/**
	 * Caso a requisição não encontre um arquivo de foto
	 * do egresso.
	 * 
	 * @param ex Exceção capturada.
	 * @return Mensagem
	 * @author Camilo Santos
	 * @since 20/05/2023
	 */
	@ExceptionHandler(NotFoundFotoEgressoException.class)
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public ErrorResponse handleNotFoundFotoEgressoException(NotFoundFotoEgressoException ex) {
		return new ErrorResponse(
				ex.getMessage(),
				ex.getLocalizedMessage(),
				ex.getInternalCode());
	}

	/**
	 * Caso a matrícula já seja associada a um egresso cadastrado
	 *
	 * @param ex Exceção capturada.
	 * @return Mensagem
	 * @author Bruno Eiki
	 * @since 21/06/2023
	 */
	@ResponseStatus(code = HttpStatus.CONFLICT)
	@ExceptionHandler(MatriculaAlreadyExistsException.class)
	public ErrorResponse handleMatriculaAlreadyExists(MatriculaAlreadyExistsException ex) {
		return new ErrorResponse(
				ErrorType.REPORT_007.getMessage(),
				ex.getLocalizedMessage(),
				ErrorType.REPORT_007.getInternalCode());
	}

}
