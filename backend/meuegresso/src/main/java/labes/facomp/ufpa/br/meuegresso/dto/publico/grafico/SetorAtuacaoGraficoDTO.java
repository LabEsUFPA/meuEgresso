package labes.facomp.ufpa.br.meuegresso.dto.publico.grafico;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dto para retorno de informacoes da área de atuação dos egressos para o
 * grafico
 *
 * @author Camilo Santos, Alfredo Gabriel
 * @since 08/06/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SetorAtuacaoGraficoDTO {

    private Map<String, Integer> setorAtuacao;

}