package labes.facomp.ufpa.br.meuegresso.dto.publico.egresso;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Egresso a fim de representar os dados publicos
 * representados pelo Egresso
 *
 * @author Marcus Maciel Oliveira
 * @since 13/05/2023
 * @version 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EgressoAnuncioDTO {

        private Integer id;

}