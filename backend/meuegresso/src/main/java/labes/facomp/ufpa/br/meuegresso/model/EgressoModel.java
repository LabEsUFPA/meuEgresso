package labes.facomp.ufpa.br.meuegresso.model;

import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
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
    @Column(name = "id_egresso", nullable = false, unique = true)
    private Integer idEgresso;
    
    @Column(name = "etnia_egresso", nullable = false, unique = false)
    private String etnia;
    
    @Column(name = "genero_egresso", nullable = false, unique = false)
    private String genero;
    
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

    @OneToOne
    @JoinColumn(name = "usuario_id", nullable = false, unique = true, referencedColumnName = "id_usuario")
    private UsuarioModel usuario;

    @OneToMany(mappedBy = "egresso")
    private Set<DepoimentoModel> depoimentos;

    @OneToMany(mappedBy = "egresso")
    private Set<TrabalhoPublicadoModel> trabalhosPublicados;
    
}