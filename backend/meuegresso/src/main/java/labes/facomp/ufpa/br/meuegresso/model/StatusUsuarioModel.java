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
import jakarta.persistence.JoinColumn;
import labes.facomp.ufpa.br.meuegresso.enumeration.UsuarioStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "status_usuario")
@ToString(exclude = "usuario")
@EqualsAndHashCode(callSuper = false, exclude = "usuario")
public class StatusUsuarioModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_status_usuario", unique = true, nullable = false)
    private Integer id;

    @JoinColumn(name = "usuario_status_usuario", unique = true, nullable = false)
    private UsuarioModel usuario;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", unique = false, nullable = false, length = 10)
    private UsuarioStatus status;

    @CreatedDate
    @ColumnDefault(value = "now()")
    @Column(name = "mudanca", unique = false, nullable = false)
    private LocalDateTime mudanca;
}
