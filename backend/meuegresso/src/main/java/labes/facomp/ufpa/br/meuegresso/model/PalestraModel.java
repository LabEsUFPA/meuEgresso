package labes.facomp.ufpa.br.meuegresso.model;

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
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@Entity(name = "palestra")
@ToString(exclude = "egresso")
@EqualsAndHashCode(callSuper = false, exclude = "egresso")
public class PalestraModel extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_palestra", unique = true, nullable = false)
    private Integer id;

    @Lob
    @Column(name = "descricao_palestra", unique = true, nullable = false)
    private String descricao;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "egresso_id", unique = true, nullable = false)
    private EgressoModel egresso;
}
