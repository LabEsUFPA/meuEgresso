package labes.facomp.ufpa.br.meuegresso.model;

import java.time.LocalDateTime;

import org.hibernate.annotations.ColumnDefault;
import org.springframework.data.annotation.CreatedDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import labes.facomp.ufpa.br.meuegresso.enumeration.UsuarioStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "status_usuario")
public class StatusUsuarioModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_status_usuario", unique = true, nullable = false)
    private Integer id;

    @Column(name = "nome_status_usuario", unique = false, nullable = false, length = 50)
    private String nome;

    @Column(name = "usuario_id_status_usuario", unique = false, nullable = false)
    private Integer usuarioId;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", unique = false, nullable = false, length = 10)
    private UsuarioStatus status;

    @CreatedDate
    @Builder.Default
    @ColumnDefault(value = "now()")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "mudanca", unique = false, nullable = false)
    private LocalDateTime dataModificacao = LocalDateTime.now();
}
