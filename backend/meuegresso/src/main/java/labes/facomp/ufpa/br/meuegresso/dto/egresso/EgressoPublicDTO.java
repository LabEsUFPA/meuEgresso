package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;
import labes.facomp.ufpa.br.meuegresso.model.EtniaModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import lombok.Data;

/**
 * 
 *
 * @author João Paulo
 * @since 16/04/2023
 * @version 1.0
 */
@Data
public class EgressoPublicDTO {

    private Integer id;

    private EtniaModel etnia;

    private GeneroModel genero;

    private Boolean cotista;

    private Boolean pcd = false;

    private Boolean interesseEmPos = false;

    private String lattes;

    private String linkedin;

    private EnderecoModel endereco;

}
