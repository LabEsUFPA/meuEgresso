package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;
import labes.facomp.ufpa.br.meuegresso.model.EtniaModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import lombok.Data;

@Data
public class EgressoPublicDTO {

    private Integer id;

    private EtniaModel etnia; // TODO Criar EtniaPublicDTO

    private GeneroModel genero; // TODO Criar GeneroPublicDTO

    private Boolean cotista;

    private Boolean pcd = false;

    private Boolean interesseEmPos = false;

    private String lattes;

    private String linkedin;

    private EnderecoModel endereco; // TODO Criar EnderecoPublicDTO

}
