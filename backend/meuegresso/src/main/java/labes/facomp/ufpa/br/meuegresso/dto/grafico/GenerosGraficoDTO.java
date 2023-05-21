package labes.facomp.ufpa.br.meuegresso.dto.grafico;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dto para retorno de informacoes de idades dos egressos para o grafico
 *
 * @author Pedro Inácio
 * @since 19/05/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class GenerosGraficoDTO {
    private Integer quantidadeMasculino;

    private Integer quantidadeFeminino;

    private Integer quantidadeTranssexual;

    private Integer quantidadeNaoBinario;

    private Integer quantidadeNaoQueroDeclarar;

    private Integer quantidadeOutros;
}
