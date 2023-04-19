package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;
import labes.facomp.ufpa.br.meuegresso.model.EtniaModel;
import labes.facomp.ufpa.br.meuegresso.model.SexoModel;
import lombok.Data;

@Data
public class EgressoPublicDTO {

    private Integer id;

    private EtniaModel etnia;

    private SexoModel sexo;

    private Boolean cotista;

    private Boolean pcd = false;

    private Boolean interesseEmPos = false;

    private String lattes;

    private String linkedin;

    private EnderecoModel endereco;

}