package labes.facomp.ufpa.br.meuegresso.dto.empresa;

import labes.facomp.ufpa.br.meuegresso.dto.endereco.EnderecoDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EmpresaBasicDTO {

    private Integer id;

    private String nome;

    private EnderecoDTO endereco;

}
