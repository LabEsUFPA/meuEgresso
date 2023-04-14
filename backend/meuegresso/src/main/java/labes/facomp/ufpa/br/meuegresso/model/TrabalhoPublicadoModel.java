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
@EqualsAndHashCode(callSuper = false)
@Entity(name = "trabalho_publicado")
public class TrabalhoPublicadoModel extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id_trabalho_publicado", unique = true, nullable = false)
    private Integer id;

    @Column(name = "nome_trabalho_publicado", unique = true, nullable = false)
    private String nome;

    @Column(name = "link_trabalho_publico", unique = false, nullable = false)
    private String linkTrabalho;

    @ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.MERGE })
	@JoinTable(name = "egresso_tabalho_publicado", joinColumns = { @JoinColumn(name = "id_trabalho_publicado") }, inverseJoinColumns = {
			@JoinColumn(name = "id_usuario") })
	private Set<EgressoModel> egressos = new HashSet<>();
}
