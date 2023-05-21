package labes.facomp.ufpa.br.meuegresso.dto.anuncio;

import java.time.LocalDate;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import labes.facomp.ufpa.br.meuegresso.dto.areaemprego.AreaEmpregoDTO;
import lombok.Data;

/**
 * Encapsulamento da tabela Anuncio a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Pedro Inácio, Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
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

    @Min(0)
    @Max(100000)
    private double salario;
}
