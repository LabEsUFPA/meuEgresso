package labes.facomp.ufpa.br.meuegresso.model;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import labes.facomp.ufpa.br.meuegresso.model.audit.Auditable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "etnia")
@EqualsAndHashCode(callSuper = false)
public class EtniaModel extends Auditable implements Serializable {

   private static final long serialVersionUID = -6470091144414208496L;

    @Id
    @Column(name = "id_etnia")
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Integer id;

    @Column(name = "nome_etnia", length = 100)
    private String nome;

}
