package labes.facomp.ufpa.br.meuegresso.model.audit;

import java.util.Date;

import org.hibernate.annotations.ColumnDefault;
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
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import lombok.Data;

/**
 * Encapsulamento dos atributos comuns a todas as classes a fim de rastrar alterações no banco de dados.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Data
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public class Auditable {

	@CreatedBy
	@Column(name = "created_by", updatable = false)
	protected UsuarioModel createdBy;

	@CreatedDate
	@Column(name = "created_date", updatable = false)
	@Temporal(TemporalType.TIMESTAMP)
	protected Date createdDate;

	@LastModifiedBy
	@Column(name = "last_modified_by")
	protected UsuarioModel lastModifiedBy;

	@LastModifiedDate
	@Column(name = "last_modified_date")
	@Temporal(TemporalType.TIMESTAMP)
	protected Date lastModifiedDate;

	@Column(name = "ativo", nullable = false)
	@ColumnDefault(value = "TRUE")
	protected Boolean ativo = true;
}
