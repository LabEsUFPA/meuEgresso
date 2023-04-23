package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.dto.endereco.EnderecoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.etnia.EtniaDTO;
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
public class EgressoPublicDTO {

    private Integer id;

    private Integer matricula;

    private EtniaDTO etnia;

    @Email
    @NotBlank(message = "Infome um email.")
    private String email;

    private GeneroDTO genero;

    private Boolean cotista;

    private Boolean pcd = false;

    private Boolean interesseEmPos = false;

    private String lattes;

    private String linkedin;

    private EnderecoDTO endereco;

}
