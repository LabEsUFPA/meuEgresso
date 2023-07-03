package labes.facomp.ufpa.br.meuegresso.dto.areaemprego;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AreaEmpregoDTO {

    private Integer id;

    @NotBlank
    private String nome;

}