package labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.cota.CotaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.genero.GeneroDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Egresso a fim de representar os dados de auditoria.
 *
 * @author Alfredo Gabriel
 * @since 22/04/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class EgressoDTO {

    private Integer id;

    @Pattern(regexp = "[0-9]{12}|$", message = "Informe uma matrícula válida.")
    private String matricula;

    @Valid
    @NotNull(message = "Informe o gênero.")
    private GeneroDTO genero;

    @Valid
    @NotNull(message = "Informe a cota.")
    private CotaDTO cota;

    private Boolean interesseEmPos = false;

    @Pattern(regexp = "^(https?:\\/\\/)?(www\\.)?lattes\\.cnpq\\.br\\/(\\d+)$", message = "Informe um lattes válido. Ex: http://lattes.cnpq.br/0893154395471579")
    private String lattes;

    @Pattern(regexp = "^https?://(www\\.)?linkedin\\.com/in/([a-zA-Z0-9_-]+)$", message = "Informe um linkedin válido. Ex: https://www.linkedin.com/in/alfredo-gabriel-de-sousa-oliveia/")
    private String linkedin;

    @Valid
    @NotNull(message = "Informe um depoimento.")
    private DepoimentoDTO depoimento;

    private Integer usuarioId;

}
