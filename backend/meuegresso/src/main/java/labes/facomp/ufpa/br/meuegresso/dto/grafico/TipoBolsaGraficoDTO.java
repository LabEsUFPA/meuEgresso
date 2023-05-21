package labes.facomp.ufpa.br.meuegresso.dto.grafico;

import java.util.HashMap;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dto para retorno de informacoes de Tipos de Bolsa dos egressos para o grafico
 *
 * @author Pedro Inácio
 * @since 21/05/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TipoBolsaGraficoDTO {

    private Integer QuantidadeBolsistas;
    
    private HashMap<String, Integer> TipoBolsas;
}
