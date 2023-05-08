package labes.facomp.ufpa.br.meuegresso.model;

import java.time.LocalDate;
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
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.UniqueConstraint;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "egresso")
@EqualsAndHashCode(callSuper = false)
public class EgressoModel extends Auditable {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "id_egresso", unique = true, nullable = false)
        private Integer id;

        @Temporal(TemporalType.DATE)
        @Column(name = "nascimento_egresso", unique = false, nullable = false)
        private LocalDate nascimento;

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "genero_id", unique = false, nullable = false)
        private GeneroModel genero;

        @Column(name = "matricula_egresso", unique = true, nullable = true, length = 12)
        private String matricula;

        @Builder.Default
        @Column(name = "cotista_egresso", unique = false, nullable = false)
        private Boolean cotista = false;

        @Builder.Default
        @Column(name = "bolsista_egresso", unique = false, nullable = false)
        private Boolean bolsista = false;

        @Builder.Default
        @Column(name = "interesse_em_pos_egresso", unique = false, nullable = false)
        private Boolean interesseEmPos = false;

        @Column(name = "lattes_egresso", unique = true, nullable = true)
        private String lattes;

        @Column(name = "linkedin_egresso", unique = true, nullable = true)
        private String linkedin;

        @Column(name = "foto_egresso", unique = false, nullable = true) // adicionar b64 de foto padrão caso nulo?
        private String fotoNome;

        @Builder.Default
        @Column(name = "pos_graducao_egresso", unique = false, nullable = true)
        private Boolean posGraduacao = false;

        @ManyToMany(fetch = FetchType.LAZY)
        @JoinTable(name = "egresso_cota", joinColumns = { @JoinColumn(name = "id_egresso") }, inverseJoinColumns = {
                        @JoinColumn(name = "id_cota") }, uniqueConstraints = @UniqueConstraint(columnNames = {
                                        "id_egresso",
                                        "id_cota" }))
        private Set<CotaModel> cotas;

        @OneToOne(cascade = { CascadeType.MERGE })
        @JoinColumn(name = "usuario_id", unique = true, nullable = true)
        private UsuarioModel usuario;

        @OneToOne(mappedBy = "egresso", fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST,
                        CascadeType.REMOVE }, orphanRemoval = true)
        private PalestraModel palestras;

        @OneToOne(mappedBy = "egresso", fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST,
                        CascadeType.REMOVE }, orphanRemoval = true)
        private ContribuicaoModel contribuicao;

        @OneToOne(mappedBy = "egresso", fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST,
                        CascadeType.REMOVE }, orphanRemoval = true)
        private EgressoTitulacaoModel titulacao;

        @OneToOne(mappedBy = "egresso", fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST,
                        CascadeType.REMOVE }, orphanRemoval = true)
        private EgressoEmpresaModel emprego;

        @OneToOne(mappedBy = "egresso", fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST,
                        CascadeType.REMOVE }, orphanRemoval = true)
        private DepoimentoModel depoimento;

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "tipo_bolsa_id", unique = false, nullable = true)
        private TipoBolsaModel bolsa;

        @Column(name = "remuneracao_bolsa_egresso", unique = false, nullable = true)
        private Double remuneracaoBolsa;

}