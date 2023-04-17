package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import java.util.Set;

import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import lombok.Data;

/**
 * 
 *
 * @author João Paulo
 * @since 16/04/2023
 * @version 1.0
 */
@Data
public class ContribuicaoDTO {
    
    private Integer id;

    private String descricao;

    private Set<EgressoModel> egressos;
}
