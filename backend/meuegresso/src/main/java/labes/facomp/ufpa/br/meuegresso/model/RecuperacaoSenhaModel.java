package labes.facomp.ufpa.br.meuegresso.model;

import java.time.LocalDateTime;
import java.util.UUID;

import org.hibernate.annotations.ColumnDefault;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@Entity(name = "recuperacao_senha")
@ToString(exclude = "usuario")
@EqualsAndHashCode(callSuper = false, exclude = "usuario")
public class RecuperacaoSenhaModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_recuperacao_senha", unique = true, nullable = false)
    private Integer id;

    @Column(name = "prazo_final_recuperacao_senha", unique = false, nullable = false)
    private LocalDateTime prazoFinal;

    @Column(name = "token_recuperacao_senha", unique = true, nullable = false, length = 36)
    private UUID token;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "usuario", unique = false, nullable = false)
    private UsuarioModel usuario;

    @ColumnDefault(value = "TRUE")
    @Column(name = "password_change_recuperacao_senha", unique = false, nullable = false, length = 36)
    private Boolean passwordChange;

}
