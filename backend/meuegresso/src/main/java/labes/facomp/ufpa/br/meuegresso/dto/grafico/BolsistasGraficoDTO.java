package labes.facomp.ufpa.br.meuegresso.dto.grafico;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dto para retorno de bolsistas
 *
 * @author Pedro Inácio
 * @since 21/05/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BolsistasGraficoDTO {

    private Map<String, Integer> bolsistasContagem;

}
