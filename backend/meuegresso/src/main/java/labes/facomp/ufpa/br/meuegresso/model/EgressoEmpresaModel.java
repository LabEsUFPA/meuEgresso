package labes.facomp.ufpa.br.meuegresso.model;

import jakarta.persistence.CascadeType;
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
@Entity(name = "egresso_empresa")
@EqualsAndHashCode(callSuper = false, exclude = "egresso")
public class EgressoEmpresaModel extends Auditable {

    @EmbeddedId
    @Builder.Default
    private EgressoEmpresaModelId id = new EgressoEmpresaModelId();

    @MapsId(value = "egressoId")
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.REFRESH)
    private EgressoModel egresso;

    @MapsId(value = "empresaId")
    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    private EmpresaModel empresa;

    @MapsId(value = "enderecoId")
    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    private EnderecoModel endereco;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "faixa_salarial_id", unique = false, nullable = false)
    private FaixaSalarialModel faixaSalarial;

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinColumn(name = "area_atuacao_id", unique = false, nullable = false)
    private AreaAtuacaoModel areaAtuacao;

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinColumn(name = "setor_atuacao_id", unique = false, nullable = false)
    private SetorAtuacaoModel setorAtuacao;
}