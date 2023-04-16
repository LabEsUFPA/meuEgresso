package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import lombok.Data;

@Data
public class DepoimentoDTO {

    private Integer id;

    private String descricao;

    private EgressoModel egresso;
}
