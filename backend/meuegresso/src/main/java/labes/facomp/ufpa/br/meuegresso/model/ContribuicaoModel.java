package labes.facomp.ufpa.br.meuegresso.model;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "contribuicao")
@EqualsAndHashCode(callSuper = false)
public class ContribuicaoModel extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id_contribuicao", unique = true, nullable = false)
    private Integer id;

    @Column(name = "descricao_contribuicao", unique = false, nullable = false, length = 255)
    private String descricao;

    @ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.MERGE })
	@JoinTable(name = "egresso_contribuicao", joinColumns = { @JoinColumn(name = "id_contribuicao") }, inverseJoinColumns = {
			@JoinColumn(name = "egresso_id") })
	private Set<EgressoModel> egressos = new HashSet<>();
}
