package labes.facomp.ufpa.br.meuegresso.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Embeddable
@NoArgsConstructor
@AllArgsConstructor
public class EgressoColocaoModelId {

    @Column(name = "id_egresso", unique = true, nullable = false)
    private Integer egressoId;

    @Column(name = "id_colacao", unique = true, nullable = false)
    private Integer colacaoId;

}