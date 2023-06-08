package labes.facomp.ufpa.br.meuegresso.dto.grafico;


import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dto para retorno de informacoes de remuneração de egressos bolsistas
 *
 * @author Camilo Santos, Alfredo Gabriel
 * @since 08/06/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RemuneracaoGraficoDTO {

    private Map<Double, Integer> remuneracaoContagem;

}