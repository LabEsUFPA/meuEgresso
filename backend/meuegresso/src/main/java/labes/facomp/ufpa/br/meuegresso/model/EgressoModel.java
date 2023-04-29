package labes.facomp.ufpa.br.meuegresso.model;

import java.time.LocalDate;
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
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "egresso")
@EqualsAndHashCode(callSuper = false)
public class EgressoModel extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
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

    @Column(name = "pcd_egresso", unique = false, nullable = false)
    private Boolean pcd = false;

    @Column(name = "interesse_em_pos_egresso", unique = false, nullable = false)
    private Boolean interesseEmPos = false;

    @Column(name = "lattes_egresso", unique = true, nullable = true)
    private String lattes;

    @Column(name = "linkedin_egresso", unique = true, nullable = true)
    private String linkedin;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
    @JoinColumn(name = "endereco_id", unique = false, nullable = false)
    private EnderecoModel endereco;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
    @JoinColumn(name = "cota_id", unique = false, nullable = false)
    private CotaModel cota;

    @OneToOne(cascade = { CascadeType.REMOVE, CascadeType.MERGE })
    @JoinColumn(name = "usuario_id", unique = true, nullable = true)
    private UsuarioModel usuario;

    @OneToMany(mappedBy = "egresso", fetch = FetchType.LAZY, cascade = { CascadeType.REMOVE })
    private Set<DepoimentoModel> depoimentos;

}