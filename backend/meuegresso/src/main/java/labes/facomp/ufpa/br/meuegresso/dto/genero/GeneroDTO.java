package labes.facomp.ufpa.br.meuegresso.dto.genero;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class GeneroDTO {

    private Integer id;

    private String nome;

}
