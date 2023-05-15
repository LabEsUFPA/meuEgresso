package labes.facomp.ufpa.br.meuegresso.dto.administradores.trabalhopublicado;

import java.util.Set;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso.EgressoDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Trabalho Publicado a fim de representar os dados de
 * auditoria.
 *
 * @author Alfredo Gabriel
 * @since 22/04/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class TrabalhoPublicadoDTO {
    private Integer id;

    @NotBlank(message = "Infome um nome.")
    private String nome;

    @NotBlank(message = "Infome o link do trabalho informado.")
    private String linkTrabalho;

    @Valid
    private Set<EgressoDTO> egressos;

}
