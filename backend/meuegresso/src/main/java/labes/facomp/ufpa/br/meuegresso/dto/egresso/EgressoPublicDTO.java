package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import labes.facomp.ufpa.br.meuegresso.dto.endereco.EnderecoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.genero.GeneroDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento dos dados do egresso ao realizar a busca do relacionamento
 * egresso empresa.
 *
 * @author João Paulo, Pedro Inácio, Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EgressoPublicDTO {

    private Integer id;

    @Pattern(regexp = "[0-9]{12}|$", message = "Informe uma matricula válida.")
    private String matricula;

    @Email
    @NotBlank(message = "Informe um email.")
    private String email;

    @Valid
    @NotNull(message = "Informe o gênero do usuário.")
    private GeneroDTO genero;

    @Builder.Default
    private Boolean cotista = false;

    @Builder.Default
    private Boolean interesseEmPos = false;

    @Pattern(regexp = "^(https?:\\/\\/)?(www\\.)?lattes\\.cnpq\\.br\\/(\\d+)$", message = "Informe um perfil Lattes válido. Ex: http://lattes.cnpq.br/0893154395471579")
    private String lattes;

    @Pattern(regexp = "^https?://(www\\.)?linkedin\\.com/in/([a-zA-Z0-9_-]+)$", message = "Informe um Linkedin válido. Ex: https://www.linkedin.com/in/alfredo-gabriel-de-sousa-oliveia/")
    private String linkedin;

    @Valid
    private EnderecoDTO endereco;
}
