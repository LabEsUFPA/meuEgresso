package labes.facomp.ufpa.br.meuegresso.dto.grafico;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dto para retorno de informacoes de cota dos egressos para o grafico
 *
 * @author Camilo Santos
 * @since 20/05/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CotaGraficoDTO {
    private Integer cotaTrue;

    private List<String> usernameCotaTrue;

    private Integer cotaFalse;

    private List<String> usernameCotaFalse;
}
