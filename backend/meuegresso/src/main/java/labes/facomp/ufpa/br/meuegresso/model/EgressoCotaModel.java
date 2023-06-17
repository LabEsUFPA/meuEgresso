package labes.facomp.ufpa.br.meuegresso.model;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "egresso_cota")
public class EgressoCotaModel {

    @EmbeddedId
    private EgressoCotaModelId id;

}
