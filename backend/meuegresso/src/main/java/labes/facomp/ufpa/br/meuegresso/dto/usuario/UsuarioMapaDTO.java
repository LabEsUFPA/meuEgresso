package labes.facomp.ufpa.br.meuegresso.dto.usuario;

import java.util.HashSet;
import java.util.Set;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoBasicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grupo.GrupoDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Grupo a fim de representar somente os dados não
 * sensiveis.
 * Nota: Use este DTO somente para persistir o usuário, não retorne o mesmo.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 26/03/2023
 * @version 1.0.1
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UsuarioMapaDTO {

	private Integer id;

	@NotBlank(message = "Infome um nome.")
	private String nome;

	@Valid
	private EgressoBasicDTO egresso;

	@Builder.Default
	private Set<GrupoDTO> grupos = new HashSet<>();

}
