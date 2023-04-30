package labes.facomp.ufpa.br.meuegresso.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "egresso_titulacao")
@EqualsAndHashCode(callSuper = false)
public class EgressoTitulacaoModel extends Auditable {

    @EmbeddedId
    private EgressoTitulacaoModelId id;

    @MapsId(value = "egressoId")
    @ManyToOne(fetch = FetchType.LAZY)
    private EgressoModel egresso;

    @MapsId(value = "titulacaoId")
    @ManyToOne(fetch = FetchType.LAZY)
    private TitulacaoModel titulacao;

    @Temporal(TemporalType.DATE)
    @Column(name = "data_ingresso", unique = false, nullable = false)
    private LocalDate ingresso;

    @Temporal(TemporalType.DATE)
    @Column(name = "data_conclusao", unique = false, nullable = true)
    private LocalDate conclusao;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "empresa_id", unique = false, nullable = false)
    private EmpresaModel empresa;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "curso_id", unique = false, nullable = false)
    private CursoModel curso;
}
