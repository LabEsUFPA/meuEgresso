package labes.facomp.ufpa.br.meuegresso.dto.administradores.anuncio;

import java.time.LocalDate;

import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.AuditableDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.areaemprego.AreaEmpregoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.usuario.UsuarioDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Anuncio a fim de representar os dados de auditoria.
 *
 * @author Alfredo Gabriel
 * @since 22/04/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class AnuncioDTO extends AuditableDTO {

    private Integer id;

    @NotBlank(message = "Informe um título.")
    private String titulo;

    @NotNull
    private AreaEmpregoDTO areaEmprego;

    @NotBlank(message = "Informe uma descrição.")
    private String descricao;

    @Future(message = "Informe uma data futura.")
    private LocalDate dataExpiracao;

    @NotBlank(message = "Informe um link que descreva sobre a vaga.")
    private String link;

    @Pattern(regexp = "\\b(?:[1-9]\\d*|0)(?:\\.\\d{2})?\\b", message = "Informe um salário válido.")
    private String salario;

    private UsuarioDTO createdBy;
}
