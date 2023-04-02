package labes.facomp.ufpa.br.meuegresso.dto.usuario;

import java.util.HashSet;
import java.util.Set;

import labes.facomp.ufpa.br.meuegresso.dto.grupo.GrupoDTO;
import lombok.Data;

/**
 * Encapsulamento da tabela Grupo a fim de representar somente os dados não sensiveis.
 * Nota: Use este DTO somente para persistir o usuário, não retorne o mesmo.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Data
public class UsuarioDTO {

	private Integer idUsuario;

	private String username;

	private String password;

	private Set<GrupoDTO> grupos = new HashSet<>();

}
