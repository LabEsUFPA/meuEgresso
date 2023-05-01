package labes.facomp.ufpa.br.meuegresso.model;

import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.UniqueConstraint;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "area_atuacao")
@ToString(exclude = "egressos")
@EqualsAndHashCode(callSuper = false, exclude = "egressos")
public class AreaAtuacaoModel extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id_area_atuacao", unique = true, nullable = false)
    private Integer id;

    @Column(name = "nome_area_atuacao", unique = true, nullable = false, length = 60)
    private String nome;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "egresso_area_atuacao", joinColumns = {
            @JoinColumn(name = "id_area_atuacao") }, inverseJoinColumns = {
                    @JoinColumn(name = "id_egresso") }, uniqueConstraints = @UniqueConstraint(columnNames = {
                            "id_area_atuacao",
                            "id_egresso" }))
    private Set<EgressoModel> egressos;
}
