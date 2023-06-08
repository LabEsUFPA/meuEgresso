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

    private String nomeEmpresa; // usuários sem egresso terão valor "Pendente"

    private LocalDateTime createdDate;

    private Boolean ativo; // equivalente a aprovado ou pendente

    // Equivalente a usuário com egresso, ou a usuários admin/secretario
    // Falso caso contrário
    private Boolean completo;

}
