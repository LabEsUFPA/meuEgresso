package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class EgressoValidoDTO {

    private Integer id;

    @NotNull(message = "Insira seu nome.")
    private String nome;

    private String matricula;

    private String email;

}
