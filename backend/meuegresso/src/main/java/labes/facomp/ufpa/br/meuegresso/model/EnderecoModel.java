package labes.facomp.ufpa.br.meuegresso.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "endereco")
@EqualsAndHashCode(callSuper = false)
@Builder
public class EnderecoModel extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_endereco", unique = true, nullable = false)
    private Integer id;

    @Column(name = "cidade_endereco", unique = false, nullable = false)
    private String cidade;

    @Column(name = "estado_endereco", unique = false, nullable = false)
    private String estado;

    @Column(name = "pais_endereco", unique = false, nullable = false)
    private String pais;

}
