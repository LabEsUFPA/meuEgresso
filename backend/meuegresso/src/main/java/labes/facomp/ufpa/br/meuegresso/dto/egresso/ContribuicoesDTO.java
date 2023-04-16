package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import java.util.Set;

import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import lombok.Data;

@Data
public class ContribuicoesDTO {
    private Integer id;

    private String descricao;

    private Set<EgressoModel> egressos;
}
