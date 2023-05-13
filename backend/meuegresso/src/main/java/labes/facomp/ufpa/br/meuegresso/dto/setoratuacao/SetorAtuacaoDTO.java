package labes.facomp.ufpa.br.meuegresso.dto.setoratuacao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento referentes ao setor de atuação de uma empresa (reduzido).
 *
 * @author Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SetorAtuacaoDTO {

        private Integer id;

        private String nome;

}
