package labes.facomp.ufpa.br.meuegresso.dto.trabalhopublicado;

import java.util.Set;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoPublicDTO;
import lombok.Data;

/**
 * Encapsulamento da tabela Trabalho Publicado a fim de representar somente os
 * dados não
 * sensiveis.
 *
 * @author João Paulo
 * @since 16/04/2023
 * @version 1.0
 */
@Data
public class TrabalhoPublicadoDTO {
    private Integer id;

    @NotBlank(message = "Infome um nome.")
    private String nome;

    @NotBlank(message = "Infome o link do trabalho informado.")
    private String linkTrabalho;

    @Valid
    private Set<EgressoPublicDTO> egressos;

}
