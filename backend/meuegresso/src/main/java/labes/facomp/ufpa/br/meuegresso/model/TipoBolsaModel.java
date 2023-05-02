package labes.facomp.ufpa.br.meuegresso.model;

import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "tipo_bolsa")
@EqualsAndHashCode(callSuper = false)
public class TipoBolsaModel extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_tipo_bolsa", unique = true, nullable = false)
    private Integer id;

    @Column(name = "nome_tipo_bolsa", unique = true, nullable = false, length = 100)
    private String nome;

    @OneToMany(mappedBy = "bolsa", fetch = FetchType.LAZY)
    private Set<EgressoModel> egressos;
}
