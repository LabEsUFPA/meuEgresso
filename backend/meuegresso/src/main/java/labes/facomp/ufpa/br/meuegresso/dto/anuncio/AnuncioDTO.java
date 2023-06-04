package labes.facomp.ufpa.br.meuegresso.dto.anuncio;

import java.time.LocalDate;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import labes.facomp.ufpa.br.meuegresso.dto.areaemprego.AreaEmpregoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.usuario.UsuarioDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Anuncio a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Pedro Inácio, Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AnuncioDTO {

    private Integer id;

    @NotBlank
    @NotNull
    private String titulo;

    @NotNull
    private AreaEmpregoDTO areaEmprego;

    @NotBlank
    @NotNull
    private String descricao;

    private LocalDate dataExpiracao;

    @NotBlank
    @NotNull
    private String link;

    @NotBlank
    @NotNull
    private String salario;

    private UsuarioDTO createdBy;
}
