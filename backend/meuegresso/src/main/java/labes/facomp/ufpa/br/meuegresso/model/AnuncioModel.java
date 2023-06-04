package labes.facomp.ufpa.br.meuegresso.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "anuncio")
@EqualsAndHashCode(callSuper = false)
@Builder
public class AnuncioModel extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_anuncio", unique = true, nullable = false)
    private Integer id;

    @Column(name = "titulo_anuncio", unique = false, nullable = false)
    private String titulo;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "area_emprego_anuncio_id", unique = false, nullable = false)
    private AreaEmpregoModel areaEmprego;

    @Lob
    @Column(name = "descricao_anuncio", unique = false, nullable = false)
    private String descricao;

    @Column(name = "data_expiracao_anuncio", unique = false, nullable = false)
    private LocalDate dataExpiracao;

    @Column(name = "link_anuncio", unique = false, nullable = false)
    private String link;

    @Column(name = "salario_anuncio", unique = false, nullable = true)
    private String salario;

}
