package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import labes.facomp.ufpa.br.meuegresso.dto.cota.CotaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.endereco.EnderecoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.genero.GeneroDTO;
import lombok.Data;

@Data
public class EgressoDTO {

    private Integer id;

    private String matricula;

    private GeneroDTO genero;

    private CotaDTO cota;

    private Boolean interesseEmPos = false;

    private String lattes;

    private String linkedin;

    private EnderecoDTO endereco;

    private DepoimentoDTO depoimento;

    private Integer usuarioId;

}
