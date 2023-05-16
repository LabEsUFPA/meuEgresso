package labes.facomp.ufpa.br.meuegresso.dto.empresa;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import labes.facomp.ufpa.br.meuegresso.dto.endereco.EnderecoDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento dos dados da empresa ao cadastrar o emprego do egresso.
 *
 * @author Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EmpresaCadastroEgressoDTO {

    private Integer id;

    @NotBlank(message = "Insira o nome da empresa.")
    private String nome;

    @NotBlank(message = "Insira o setor de atuação da empresa.")
    private String setorAtuacao;

    @NotBlank(message = "Insira a área de atuação da empresa.")
    private String areaAtuacao;

    @NotNull(message = "Informe a faixa salarial.")
    private Integer faixaSalarialId;

    @Valid
    @NotNull(message = "Informe o endereço.")
    private EnderecoDTO endereco;

}
