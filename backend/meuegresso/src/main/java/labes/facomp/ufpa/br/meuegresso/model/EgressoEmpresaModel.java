package labes.facomp.ufpa.br.meuegresso.model;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "egresso_empresa")
@EqualsAndHashCode(callSuper = false)
public class EgressoEmpresaModel extends Auditable {

    @EmbeddedId
    private EgressoEmpresaModelId id;

    @MapsId(value = "egressoId")
    @ManyToOne(fetch = FetchType.LAZY)
    private EgressoModel egresso;

    @MapsId(value = "empresaId")
    @ManyToOne(fetch = FetchType.LAZY)
    private EmpresaModel empresa;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "faixa_salarial_id", unique = false, nullable = false)
    private FaixaSalarialModel faixaSalarial;

}