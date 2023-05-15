package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import java.time.LocalDate;
import java.util.Set;

import labes.facomp.ufpa.br.meuegresso.dto.contribuicao.ContribuicaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.cota.CotaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.palestra.PalestraDTO;
import labes.facomp.ufpa.br.meuegresso.dto.titulacao.TitulacaoEgressoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EgressoCadastroDTO {

    private Integer id;

    private String nome;

    private String email;

    private LocalDate nascimento;

    private Integer generoId;

    private String matricula;

    private Boolean cotista = false;

    private Boolean bolsista = false;

    private Boolean interesseEmPos = false;

    private String lattes;

    private String linkedin;

    private Boolean posGraduacao = false;

    private Set<CotaDTO> cotas;

    private UsuarioDTO usuario;

    private PalestraDTO palestras;

    private ContribuicaoDTO contribuicao;

    private DepoimentoDTO depoimento;

    private Integer bolsaId;

    private Double remuneracaoBolsa;

    private EmpresaDTO empresa;

    private TitulacaoEgressoDTO titulacao;
}
