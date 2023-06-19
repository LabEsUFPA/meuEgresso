package labes.facomp.ufpa.br.meuegresso.dto.publico.usuario;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Usuario a fim de representar os dados publicos
 * representados pelo Egresso
 *
 * @author Marcus Maciel Oliveira
 * @since 13/05/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class UsuarioDTO {

	private Integer id;

	private String nome;

	private String email;

}
