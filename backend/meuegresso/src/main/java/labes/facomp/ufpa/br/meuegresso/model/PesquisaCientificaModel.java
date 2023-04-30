package labes.facomp.ufpa.br.meuegresso.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@Entity(name = "pesquisa_cientifica")
@EqualsAndHashCode(callSuper = false)
public class PesquisaCientificaModel extends Auditable {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id_pesquisa_cientifica", unique = true, nullable = false)
    private Integer id;

    @Column(name = "nome_pesquisa_cientifica", unique = true, nullable = false, length = 100)
    private String nome;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tipo_bolsa_id", unique = true, nullable = false)
    private TipoBolsaModel tipoBolsa;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "empresa_id", unique = true, nullable = false)
    private EmpresaModel empresa;

    @Temporal(TemporalType.DATE)
    @Column(name = "inicio", unique = true, nullable = false)
    private LocalDate inicio;

    @Temporal(TemporalType.DATE)
    @Column(name = "fim", unique = true, nullable = false)
    private LocalDate fim;

}
