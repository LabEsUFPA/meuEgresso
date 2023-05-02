package labes.facomp.ufpa.br.meuegresso.model;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
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
@Entity(name = "egresso_titulacao")
@EqualsAndHashCode(callSuper = false)
public class EgressoTitulacaoModel extends Auditable {

    @EmbeddedId
    @Builder.Default
    private EgressoTitulacaoModelId id = new EgressoTitulacaoModelId();

    @MapsId(value = "egressoId")
    @OneToOne(fetch = FetchType.LAZY)
    private EgressoModel egresso;

    @MapsId(value = "titulacaoId")
    @ManyToOne(fetch = FetchType.LAZY)
    private TitulacaoModel titulacao;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "empresa_id", unique = false, nullable = false)
    private EmpresaModel empresa;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "curso_id", unique = false, nullable = false)
    private CursoModel curso;
}
