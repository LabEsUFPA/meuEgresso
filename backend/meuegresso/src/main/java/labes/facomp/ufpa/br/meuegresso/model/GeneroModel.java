package labes.facomp.ufpa.br.meuegresso.model;

import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "genero")
@EqualsAndHashCode(callSuper = false)
@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
public class GeneroModel extends Auditable {

    @Id
    @Column(name = "id_genero")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "nome_genero", unique = true, nullable = false, length = 60)
    private String nome;

}
