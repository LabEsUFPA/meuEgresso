package labes.facomp.ufpa.br.meuegresso.dto.areaatuacao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AreaAtuacaoDTO {

    private Integer id;

    private String nome;

}