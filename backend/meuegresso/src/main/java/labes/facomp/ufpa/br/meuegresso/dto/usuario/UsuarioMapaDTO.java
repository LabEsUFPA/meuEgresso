package labes.facomp.ufpa.br.meuegresso.dto.usuario;

import java.util.HashSet;
import java.util.Set;

import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.dto.grupo.GrupoDTO;
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

	@NotBlank(message = "Infome um nome.")
	private String nome;

	// TODO Pode tirar o egresso aqui?
	// @Valid
	// private EgressoBasicDTO egresso;

	// TODO tirar grupo?
	//@Builder.Default
	//private Set<GrupoDTO> grupos = new HashSet<>();

}
