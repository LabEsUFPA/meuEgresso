package labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Representa os dados do egresso a serem representados no
 * dashboard do administrador
 *
 * @author Bruno Eiki
 * @since 06/06/2023
 * @version 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EgressoDashDTO {

    private Integer id;

    private String nome;

    private String nomeEmpresa; // usuários sem egresso terão valor "Pendente"

    private String email; // linha pra retornar email no pdf

    private LocalDate createdDate;

    private String foto;

    private String status;

}