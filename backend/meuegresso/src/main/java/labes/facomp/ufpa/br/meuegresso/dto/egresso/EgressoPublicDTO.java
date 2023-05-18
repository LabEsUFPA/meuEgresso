package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import java.time.LocalDate;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import labes.facomp.ufpa.br.meuegresso.dto.endereco.EnderecoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.genero.GeneroDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 *
 * @author João Paulo, Pedro Inácio
 * @since 16/04/2023
 * @version 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EgressoPublicDTO {

    private Integer id;

    private String matricula;

    private LocalDate nascimento;

    @Email
    @NotBlank(message = "Infome um email.")
    private String email;

    private GeneroDTO genero;

    @Builder.Default
    private Boolean cotista = false;

    @Builder.Default
    private Boolean bolsista = false;

    @Builder.Default
    private Boolean interesseEmPos = false;

    private String lattes;

    private String linkedin;

    private EnderecoDTO endereco;

}
