package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import java.time.LocalDate;
import java.util.Set;

import jakarta.persistence.Convert;
import labes.facomp.ufpa.br.meuegresso.dto.contribuicao.ContribuicaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.cota.CotaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.palestras.PalestrasDTO;
import labes.facomp.ufpa.br.meuegresso.dto.titulacao.TitulacaoEgressoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioDTO;
import labes.facomp.ufpa.br.meuegresso.util.ParseString;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EgressoCadastroDTO {

    private Integer id;

    private String nome;

    private LocalDate nascimento;

    private Integer generoId;

    private String matricula;

    private Boolean cotista = false;

    private Boolean bolsista = false;

    private Boolean interesseEmPos = false;

    @Convert(converter = ParseString.class)
    private String lattes;

    @Convert(converter = ParseString.class)
    private String linkedin;

    private Boolean posGraduacao = false;

    private Set<CotaDTO> cotas;

    private UsuarioDTO usuario;

    private PalestrasDTO palestras;

    private ContribuicaoDTO contribuicao;

    private DepoimentoDTO depoimento;

    private Integer bolsaId;

    private Double remuneracaoBolsa;

    private EmpresaDTO empresa;

    private TitulacaoEgressoDTO titulacao;
}
