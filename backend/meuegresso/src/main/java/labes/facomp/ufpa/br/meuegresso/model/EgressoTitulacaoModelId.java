package labes.facomp.ufpa.br.meuegresso.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@Embeddable
@NoArgsConstructor
@AllArgsConstructor
public class EgressoTitulacaoModelId {

    @Column(name = "id_egresso", unique = true, nullable = false)
    private Integer egressoId;

    @Column(name = "id_titulacao", unique = true, nullable = false)
    private Integer titulacaoId;

}