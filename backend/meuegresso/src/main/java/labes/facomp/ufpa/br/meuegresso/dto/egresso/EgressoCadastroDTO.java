package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import java.time.LocalDate;
import java.util.Set;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import labes.facomp.ufpa.br.meuegresso.dto.contribuicao.ContribuicaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.cota.CotaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaCadastroEgressoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.palestra.PalestraDTO;
import labes.facomp.ufpa.br.meuegresso.dto.titulacao.TitulacaoEgressoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento dos dados do egresso ao cadastrar pela primeira vez.
 *
 * @author Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EgressoCadastroDTO {

    private Integer id;

    @NotBlank(message = "Informe o nome do egresso.")
    private String nome;

    @Email
    private String email;

    @NotNull(message = "Informe a data de nascimento do egresso.")
    private LocalDate nascimento;

    @NotNull(message = "Informe o genero do egresso.")
    private Integer generoId;

    @Pattern(regexp = "[0-9]{12}|$", message = "Informe uma matricula valida.")
    private String matricula;

    private Boolean cotista = false;

    private Boolean bolsista = false;

    private Boolean interesseEmPos = false;

    @Pattern(regexp = "^(https?:\\/\\/)?(www\\.)?lattes\\.cnpq\\.br\\/(\\d+)$", message = "Informe um lattes valido. Ex: http://lattes.cnpq.br/0893154395471579")
    private String lattes;

    @Pattern(regexp = "\\bhttps?:\\/\\/(?:www\\.)?(?:br\\.)?linkedin\\.com\\/in\\/[\\w-]+\\/?", message = "Informe um linkedin valido. Ex: https://www.linkedin.com/in/alfredo-gabriel-de-sousa-oliveia/")
    private String linkedin;

    private Boolean posGraduacao = false;

    private Set<CotaDTO> cotas;

    @Valid
    private UsuarioDTO usuario;

    @Valid
    private PalestraDTO palestras;

    @Valid
    @NotNull(message = "Informe a contribuição do egresso.")
    private ContribuicaoDTO contribuicao;

    @Valid
    @NotNull(message = "Informe a depoimento do egresso.")
    private DepoimentoDTO depoimento;

    private Integer bolsaId;

    private Double remuneracaoBolsa;

    @Valid
    private EmpresaCadastroEgressoDTO emprego;

    @Valid
    private TitulacaoEgressoDTO titulacao;
}
