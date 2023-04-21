package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import lombok.Data;

/**
 * 
 *
 * @author João Paulo
 * @since 16/04/2023
 * @version 1.0
 */
@Data
public class DepoimentoDTO {

    private Integer id;

    private String descricao;

    private EgressoPublicDTO egresso;
}
