package labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso;

import java.time.LocalDateTime;

import lombok.Data;

/**
 * Representa os dados do egresso a serem representados no
 * dashboard do administrador
 *
 * @author Bruno Eiki
 * @since 06/06/2023
 * @version 1.0
 */
@Data
public class EgressoDashDTO {

    private Integer id;

    private String nome;

    private String email; // linha pra retornar email no pdf

    private String nomeEmpresa;

    private LocalDateTime createdDate;

    private String status;

}
