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

@Entity(name = "setor_atuacao")
public class SetorAtuacaoModel {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id_setor_atuacao", unique = true, nullable = false)
    private Integer id;

    @Column(name = "nome_setor_atuacao", unique = true, nullable = false)
    private String nome;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "setor_atuacao_empresa", joinColumns = { @JoinColumn(name = "id_setor_atuacao") }, inverseJoinColumns = {
            @JoinColumn(name = "id_empresa") }, uniqueConstraints = @UniqueConstraint(columnNames = { "id_setor_atuacao",
                    "id_empresa" }))
    private Set<EmpresaModel> empresas;
}
