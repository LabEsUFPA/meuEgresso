package labes.facomp.ufpa.br.meuegresso.dto.publico.grafico;

import java.util.HashMap;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO para retorno de egressos com e sem pós graduação contabilizado.
 *
 * @author Camilo Santos
 * @since 20/05/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PosGraduacaoGraficoDTO {

    private HashMap<String, Long> posGraduacaoContagem;

}