package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import labes.facomp.ufpa.br.meuegresso.dto.endereco.EnderecoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.genero.GeneroDTO;
import lombok.Data;

/**
 *
 *
 * @author João Paulo, Pedro Inácio
 * @since 16/04/2023
 * @version 1.0
 */
@Data
public class EgressoBasicDTO {

    private Integer id;

    private String matricula;

    private GeneroDTO genero;

    private String lattes;

    private String linkedin;

    private EnderecoDTO endereco;

}
