package labes.facomp.ufpa.br.meuegresso.dto.grafico;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dto para retorno de todas as informacoes de graficos
 *
 * @author Pedro Inácio
 * @since 19/05/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class GraficoDTO {
    private IdadesGraficoDTO idades;
    
    private GenerosGraficoDTO generos;

}
