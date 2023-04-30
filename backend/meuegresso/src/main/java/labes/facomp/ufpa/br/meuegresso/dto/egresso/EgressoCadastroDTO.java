package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.trabalhopublicado.TrabalhoPublicadoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.cota.CotaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.endereco.EnderecoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.genero.GeneroDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EgressoCadastroDTO {

    private Integer id;

    private LocalDate nascimento;

    private GeneroDTO genero;

    private String matricula;

    private Boolean pcd = false;

    private Boolean interesseEmPos = false;

    private String lattes;

    private String linkedin;

    private EnderecoDTO endereco;

    private CotaDTO cota;

    private UsuarioDTO usuario;

    private Set<DepoimentoDTO> depoimentos;

    private Set<TrabalhoPublicadoDTO> trabalhoPublicados = new HashSet<>();

}
