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
public class EgressoPublicDTO {

    private Integer id;

    private EtniaDTO etnia;

    private GeneroDTO genero;

    private Boolean cotista;

    private Boolean pcd = false;

    private Boolean interesseEmPos = false;

    private String lattes;

    private String linkedin;

    private EnderecoDTO endereco;

}
