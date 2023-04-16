package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import java.util.Set;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class PublicacoesDTO {
    private Integer id;

    @NotBlank(message = "Infome um nome.")
    private String nome;

    @NotBlank(message = "Infome o link do trabalho informado.")
    private String linkTrabalho;

    @Valid
    private Set<EgressoPublicDTO> egressos;

}
