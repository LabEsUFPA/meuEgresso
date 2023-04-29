package labes.facomp.ufpa.br.meuegresso.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity(name = "setor_atuacao")
public class SetorAtuacaoModel {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id_setor_atuacao", unique = true, nullable = false)
    private Integer id;

    @Column(name = "nome_setor_atuacao", unique = true, nullable = false)
    private String nome;
}
