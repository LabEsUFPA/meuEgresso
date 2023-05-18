package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import labes.facomp.ufpa.br.meuegresso.dto.contribuicao.ContribuicaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.cota.CotaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.genero.GeneroDTO;
import labes.facomp.ufpa.br.meuegresso.dto.palestra.PalestraDTO;
import labes.facomp.ufpa.br.meuegresso.dto.tipobolsa.TipoBolsaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EgressoDTO {

    private Integer id;

    private LocalDate nascimento;

    private GeneroDTO genero;

    private String matricula;

    @Builder.Default
    private Boolean cotista = false;

    @Builder.Default
    private Boolean bolsista = false;

    @Builder.Default
    private Boolean interesseEmPos = false;

    private String lattes;

    private String linkedin;

    @Builder.Default
    private Boolean posGraduacao = false;

    @Builder.Default
    private List<CotaDTO> cotas = new ArrayList<>(0);

    private UsuarioAuthDTO usuario;

    private PalestraDTO palestras;

    private ContribuicaoDTO contribuicao;

    private EgressoTitulacaoDTO titulacao;

    private EgressoEmpresaBasicDTO emprego;

    private DepoimentoDTO depoimento;

    private TipoBolsaDTO bolsa;

    private Double remuneracaoBolsa;

}
