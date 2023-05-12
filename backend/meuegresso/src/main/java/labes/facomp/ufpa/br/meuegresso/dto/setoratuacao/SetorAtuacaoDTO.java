package labes.facomp.ufpa.br.meuegresso.dto.setoratuacao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SetorAtuacaoDTO {

        private Integer id;

        private String nome;

}
