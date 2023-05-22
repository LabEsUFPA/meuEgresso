package labes.facomp.ufpa.br.meuegresso.dto.grafico;

import java.util.HashMap;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dto para retorno de informacoes de Tipos de graduacao e pos graduacao dos egressos para o grafico
 *
 * @author Pedro Inácio
 * @since 21/05/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TipoGraduacaoGraficoDTO {

    private Integer quantidadeGraduacao;

    private Integer quantidadePosGraduacao;
    
    private HashMap<String, Integer> graduacoes;

    private HashMap<String, Integer> posGraduacoes;
    
}
