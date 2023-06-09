package labes.facomp.ufpa.br.meuegresso.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@Builder
@Embeddable
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class EgressoEmpresaModelId {

    @Column(name = "egresso_id", unique = false, nullable = false)
    private Integer egressoId;

    @Column(name = "empresa_id", unique = false, nullable = false)
    private Integer empresaId;

    @Column(name = "endereco_id", unique = false, nullable = false)
    private Integer enderecoId;


}