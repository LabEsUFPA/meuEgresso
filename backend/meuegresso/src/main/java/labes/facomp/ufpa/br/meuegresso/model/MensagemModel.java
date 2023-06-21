package labes.facomp.ufpa.br.meuegresso.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "mensagem")
public class MensagemModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_mensagem", unique = true, nullable = false)
    private Integer id;

    @Column(name = "corpo_mensagem", unique = false, nullable = false, length = 1000)
    private String corpo;

    @Column(name = "escopo_mensagem", unique = false, nullable = false)
    private String escopo;

    @Column(name = "email_mensagem", unique = false, nullable = true, length = 50)
    private String email;

    @Column(name = "data_mensagem", unique = false, nullable = false)
    private LocalDateTime dataEnvio;

    @Column(name = "data_enviada_mensagem", unique = false, nullable = true)
    private LocalDateTime dataEnviada;

    @Builder.Default
    @Column(name = "frequente_mensagem", unique = false, nullable = true)
    private Boolean frequente = false;

    @Builder.Default
    @Column(name = "anual_mensagem", unique = false, nullable = true)
    private Boolean anual = true;

}