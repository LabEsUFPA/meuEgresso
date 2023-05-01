package labes.facomp.ufpa.br.meuegresso.model;

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
import jakarta.persistence.UniqueConstraint;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "setor_atuacao")
@ToString(exclude = "empresas")
@EqualsAndHashCode(callSuper = false, exclude = "empresas")
public class SetorAtuacaoModel extends Auditable {

        @Id
        @GeneratedValue(strategy = GenerationType.AUTO)
        @Column(name = "id_setor_atuacao", unique = true, nullable = false)
        private Integer id;

        @Column(name = "nome_setor_atuacao", unique = true, nullable = false, length = 60)
        private String nome;

        @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
        @JoinTable(name = "setor_atuacao_empresa", joinColumns = {
                        @JoinColumn(name = "id_setor_atuacao") }, inverseJoinColumns = {
                                        @JoinColumn(name = "id_empresa") }, uniqueConstraints = @UniqueConstraint(columnNames = {
                                                        "id_setor_atuacao",
                                                        "id_empresa" }))
        private Set<EmpresaModel> empresas;
}
