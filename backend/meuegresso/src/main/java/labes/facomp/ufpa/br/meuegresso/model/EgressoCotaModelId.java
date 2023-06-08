package labes.facomp.ufpa.br.meuegresso.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class EgressoCotaModelId {

    @Column(name = "id_egresso", nullable = false)
	private Integer egressoId;

    @Column(name = "id_cota", nullable = false)
	private Integer cotaId;
}
