package labes.facomp.ufpa.br.meuegresso.dto.usuario;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Representa os dados de nome e id do egresso para o mapa
 *
 *
 * @author Bruno Eiki, Pedro Inácio
 * @since 08/05/2023
 * @version 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UsuarioMapaDTO {

	private Integer id;

	private String nome;

}
