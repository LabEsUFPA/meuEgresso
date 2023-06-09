package labes.facomp.ufpa.br.meuegresso.model.audit;

import java.time.LocalDateTime;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.envers.Audited;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import jakarta.persistence.Column;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

/**
 * Encapsulamento dos atributos comuns a todas as classes a fim de rastrar
 * alterações no banco de dados.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Data
@Audited
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public class Auditable {

	@CreatedBy
	@Column(name = "created_by", updatable = false)
	protected Integer createdBy;

	@CreatedDate
	@Temporal(TemporalType.TIMESTAMP)
	@ColumnDefault(value = "now()")
	@Column(name = "created_date", updatable = false)
	protected LocalDateTime createdDate;

	@LastModifiedBy
	@Column(name = "last_modified_by")
	protected Integer lastModifiedBy;

	@LastModifiedDate
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_modified_date")
	protected LocalDateTime lastModifiedDate;

	@ColumnDefault(value = "TRUE")
	@Column(name = "ativo", nullable = false)
	protected Boolean ativo = true;
}
