package labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.cota.CotaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.endereco.EnderecoDTO;
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

    private String matricula;

    @Valid
    @NotNull(message = "Informe o genêro.")
    private GeneroDTO genero;

    @Valid
    @NotNull(message = "Informe a cota.")
    private CotaDTO cota;

    private Boolean interesseEmPos = false;

    private String lattes;

    private String linkedin;

    @Valid
    private EnderecoDTO endereco;

    @Valid
    @NotNull(message = "Informe um depoimento.")
    private DepoimentoDTO depoimento;

    private Integer usuarioId;

}
