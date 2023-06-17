package labes.facomp.ufpa.br.meuegresso.dto.administradores;

import java.time.LocalDateTime;

import lombok.Data;

/**
 * Encapsulamento dos atributos comuns a todas as classes a fim de rastrar
 * alterações no banco de dados.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@Data
public class AuditableDTO {

	protected LocalDateTime createdDate;

	protected LocalDateTime lastModifiedDate;

	protected Boolean ativo;
}
