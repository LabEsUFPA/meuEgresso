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
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.UniqueConstraint;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "contribuicao")
@EqualsAndHashCode(callSuper = false)
@Builder
public class ContribuicaoModel extends Auditable {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "id_contribuicao", unique = true, nullable = false)
	private Integer id;

	@Lob
	@Column(name = "descricao_contribuicao", unique = false, nullable = false)
	private String descricao;

	@Builder.Default
	@ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.MERGE })
	@JoinTable(name = "egresso_contribuicao", joinColumns = {
			@JoinColumn(name = "id_contribuicao") }, inverseJoinColumns = {
					@JoinColumn(name = "egresso_id") }, uniqueConstraints = @UniqueConstraint(columnNames = {
							"egresso_id", "id_contribuicao" }))
	private Set<EgressoModel> egressos = new HashSet<>();
}
