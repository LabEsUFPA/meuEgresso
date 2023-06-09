package labes.facomp.ufpa.br.meuegresso.dto.publico.grafico;

import java.util.HashMap;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dto para retorno de informacoes de remuneração de egressos bolsistas
 *
 * @author Camilo Santos
 * @since 22/05/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RemuneracaoGraficoDTO {

    private HashMap<Double, Integer> remuneracaoContagem;

}