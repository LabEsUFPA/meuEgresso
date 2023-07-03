package labes.facomp.ufpa.br.meuegresso.dto.empresa;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EmpresaMapaDTO {

    private Integer id;

    private String nome;

}
