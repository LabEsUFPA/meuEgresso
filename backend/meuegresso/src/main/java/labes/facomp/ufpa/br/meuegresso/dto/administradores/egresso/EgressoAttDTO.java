package labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.PositiveOrZero;
import labes.facomp.ufpa.br.meuegresso.dto.contribuicao.ContribuicaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.cota.CotaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoEmpresaBasicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoTitulacaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.genero.GeneroDTO;
import labes.facomp.ufpa.br.meuegresso.dto.palestra.PalestraDTO;
import labes.facomp.ufpa.br.meuegresso.dto.tipobolsa.TipoBolsaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioAuthDTO;
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
    private GeneroDTO genero;

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

    @Pattern(regexp = "\\bhttps?:\\/\\/(?:www\\.)?(?:br\\.)?linkedin\\.com\\/in\\/[\\w-]+\\/?", message = "Informe um linkedin válido. Ex: https://www.linkedin.com/in/alfredo-gabriel-de-sousa-oliveia/")
    private String linkedin;

    @Builder.Default
    private Boolean posGraduacao = false;

    @Valid
    @Builder.Default
    private List<CotaDTO> cotas = new ArrayList<>(0);

    @Valid
    @NotNull(message = "Informe o usuário")
    private UsuarioAuthDTO usuario;

    @Valid
    private PalestraDTO palestras;

    @Valid
    @NotNull(message = "Informe a contribuição do egresso.")
    private ContribuicaoDTO contribuicao;

    @Valid
    private EgressoTitulacaoDTO titulacao;

    @Valid
    private EgressoEmpresaBasicDTO emprego;

    @Valid
    @NotNull(message = "Informe a depoimento do egresso.")
    private DepoimentoDTO depoimento;

    @Valid
    private TipoBolsaDTO bolsa;

    @PositiveOrZero(message = "Informe a remuneração da bolsa.")
    private Double remuneracaoBolsa;

    private String fotoNome;
}
