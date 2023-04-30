package labes.facomp.ufpa.br.meuegresso.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity(name = "area_atuacao")
public class AreaAtuacaoModel {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id_area_atuacao", unique = true, nullable = false)
    private Integer id;

    @Column(name = "nome_area_atuacao", unique = true, nullable = false)
    private String nome;

    // TODO fazer relacionamento com egresso
}
