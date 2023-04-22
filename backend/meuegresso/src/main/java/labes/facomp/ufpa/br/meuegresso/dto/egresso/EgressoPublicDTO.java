package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import labes.facomp.ufpa.br.meuegresso.dto.endereco.EnderecoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.etnia.EtniaDTO;
import lombok.Data;

/**
 * 
 *
 * @author João Paulo, Pedro Inácio
 * @since 16/04/2023
 * @version 1.0
 */
@Data
public class EgressoPublicDTO {

    private Integer id;

    private Integer matricula;

    private EtniaDTO etnia;

    private GeneroDTO genero;

    private Boolean cotista;

    private Boolean pcd = false;

    private Boolean interesseEmPos = false;

    private String lattes;

    private String linkedin;

    private EnderecoDTO endereco;

}
