package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import lombok.Data;

@Data
public class EgressoDTO {

    private Integer id;

    private String matricula;

    private EtniaDTO etnia;

    private GeneroDTO genero;

    private CotaDTO cota;

    private Boolean pcd = false;

    private Boolean interesseEmPos = false;

    private String lattes;

    private String linkedin;

    private EnderecoDTO endereco;

    private DepoimentoDTO depoimento;

    private Integer usuarioId;

}
