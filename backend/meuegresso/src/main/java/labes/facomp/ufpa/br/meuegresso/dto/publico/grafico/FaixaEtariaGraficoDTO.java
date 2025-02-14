package labes.facomp.ufpa.br.meuegresso.dto.publico.grafico;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO para retorno de informacoes de Faixa Etaria dos egressos para o gráfico
 *
 * @author Bruno Eiki
 * @since 12/02/2025
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FaixaEtariaGraficoDTO {

    private String faixa;
    private Integer quantidade;

    public void adicionarQuantidade(int quantidade) {
        this.quantidade += quantidade;
    }
}
