package labes.facomp.ufpa.br.meuegresso.dto.administradores.usuario;

import java.time.LocalDate;
import java.util.Map;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.AuditableDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * Representa um DTO para notificação acerca do status do cadastro do usuário.
 *
 * @author Eude Monteiro
 * @since 12/06/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class UsuarioNotificacaoDTO extends AuditableDTO {

	private Map<String, Map<String, LocalDate>> usuarioLista;

}

