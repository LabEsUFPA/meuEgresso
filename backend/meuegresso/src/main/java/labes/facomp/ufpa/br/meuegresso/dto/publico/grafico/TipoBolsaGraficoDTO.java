package labes.facomp.ufpa.br.meuegresso.dto.publico.grafico;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dto para retorno de informacoes de Tipos de Bolsa dos egressos para o grafico
 *
 * @author Pedro Inácio, Alfredo Gabriel
 * @since 08/06/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TipoBolsaGraficoDTO {

    private Map<String, Integer> tipoBolsas;

}
