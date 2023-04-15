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
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "etnia_id", nullable = false, unique = false)
    private EtniaModel etnia;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "genero_id", nullable = false, unique = false)
    private SexoModel sexo;

    @Column(name = "cotista_egresso", nullable = false, unique = false)
    private Boolean cotista;

    @Column(name = "pcd_egresso", nullable = false, unique = false)
    private Boolean pcd = false;

    @Column(name = "interesse_em_pos_egresso", nullable = false, unique = false)
    private Boolean interesseEmPos = false;

    @Column(name = "lattes_egresso", nullable = false, unique = false)
    private String lattes;

    @Column(name = "linkedin_egresso", nullable = false, unique = false)
    private String linkedin;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
    @JoinColumn(name = "endereco_id", unique = false, nullable = false)
    private EnderecoModel endereco;

    @OneToOne
    @JoinColumn(name = "usuario_id", unique = true, nullable = false)
    private UsuarioModel usuario;

    @OneToMany(mappedBy = "egresso", fetch = FetchType.LAZY)
    private Set<DepoimentoModel> depoimentos;

    @ManyToMany(mappedBy = "egressos", fetch = FetchType.LAZY)
    private Set<TrabalhoPublicadoModel> trabalhoPublicados = new HashSet<>();

}