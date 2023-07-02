package labes.facomp.ufpa.br.meuegresso.model;

import org.hibernate.annotations.ColumnDefault;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.OneToOne;
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
@Entity(name = "depoimento")
@EqualsAndHashCode(callSuper = false, exclude = "egresso")
public class DepoimentoModel extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_depoimento", unique = true, nullable = false)
    private Integer id;

    @Lob
    @Column(name = "descricao_depoimento", unique = false, nullable = false)
    private String descricao;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "egresso_id", unique = true, nullable = false)
    private EgressoModel egresso;

    @ColumnDefault(value = "FALSE")
	@Column(name = "favorito", nullable = false)
	protected Boolean favorito = false;
}
