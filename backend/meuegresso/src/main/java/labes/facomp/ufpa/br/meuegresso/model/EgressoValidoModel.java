package labes.facomp.ufpa.br.meuegresso.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Data
@Entity(name = "egresso_valido")
public class EgressoValidoModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_egresso_valido", unique = true, nullable = false)
    private Integer id;

    @Column(name = "nome_egresso_valido", unique = false, nullable = false, length = 100)
    private String nome;

    @Column(name = "matricula_egresso_valido", unique = true, nullable = true, length = 12)
    private String matricula;

    @Column(name = "email_egresso_valido", unique = true, nullable = true)
    private String email;

}
