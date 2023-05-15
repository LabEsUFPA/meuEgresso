package labes.facomp.ufpa.br.meuegresso.dto.administradores;

import java.time.LocalDateTime;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.usuario.UsuarioAuditDTO;

/**
 * Encapsulamento dos atributos comuns a todas as classes a fim de rastrar
 * alterações no banco de dados.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
public class AuditableDTO {

	protected UsuarioAuditDTO createdBy;

	protected LocalDateTime createdDate;

	protected UsuarioAuditDTO lastModifiedBy;

	protected LocalDateTime lastModifiedDate;

	protected Boolean ativo;
}
