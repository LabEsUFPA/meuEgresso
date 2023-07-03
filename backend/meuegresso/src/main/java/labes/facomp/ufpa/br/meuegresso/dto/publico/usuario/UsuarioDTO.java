package labes.facomp.ufpa.br.meuegresso.dto.publico.usuario;

import jakarta.validation.Valid;
import labes.facomp.ufpa.br.meuegresso.dto.publico.egresso.EgressoAnuncioDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
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
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UsuarioDTO {

	private Integer id;

	private String nome;

	@Valid
	private EgressoAnuncioDTO egresso;

	private String foto;

}
