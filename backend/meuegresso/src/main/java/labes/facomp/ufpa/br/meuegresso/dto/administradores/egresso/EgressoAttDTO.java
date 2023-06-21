package labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.PositiveOrZero;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.contribuicao.ContribuicaoAttDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.cota.CotaAttDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.depoimento.DepoimentoAttDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.genero.GeneroAttDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.palestra.PalestraAttDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.tipobolsa.TipoBolsaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoEmpresaBasicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoTitulacaoDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento dos dados do egresso ao realizar a busca e a atualização.
 *
 * @author Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EgressoAttDTO {

    private LocalDate nascimento;

    @Valid
    @NotNull(message = "Informe o gênero do usuário.")
    private GeneroAttDTO genero;

    @Pattern(regexp = "[0-9]{12}|$", message = "Informe uma matrícula válida.")
    private String matricula;

    @Builder.Default
    private Boolean cotista = false;

    @Builder.Default
    private Boolean bolsista = false;

    @Builder.Default
    private Boolean interesseEmPos = false;

    @Pattern(regexp = "^(https?:\\/\\/)?(www\\.)?lattes\\.cnpq\\.br\\/(\\d+)$", message = "Informe um lattes válido. Ex: http://lattes.cnpq.br/0893154395471579")
    private String lattes;

    @Pattern(regexp = "^https?://(www\\.)?linkedin\\.com/in/([a-zA-Z0-9_-]+)$", message = "Informe um linkedin válido. Ex: https://www.linkedin.com/in/alfredo-gabriel-de-sousa-oliveia/")
    private String linkedin;

    @Builder.Default
    private Boolean posGraduacao = false;

    @Valid
    @Builder.Default
    private List<CotaAttDTO> cotas = new ArrayList<>(0);

    private Integer usuarioId;

    @Valid
    private PalestraAttDTO palestras;

    @Valid
    @NotNull(message = "Informe a contribuição do egresso.")
    private ContribuicaoAttDTO contribuicao;

    @Valid
    private EgressoTitulacaoDTO titulacao;

    @Valid
    private EgressoEmpresaBasicDTO emprego;

    @Valid
    @NotNull(message = "Informe a depoimento do egresso.")
    private DepoimentoAttDTO depoimento;

    @Valid
    private TipoBolsaDTO bolsa;

    @PositiveOrZero(message = "Informe a remuneração da bolsa.")
    private Double remuneracaoBolsa;

    private String fotoNome;
}
