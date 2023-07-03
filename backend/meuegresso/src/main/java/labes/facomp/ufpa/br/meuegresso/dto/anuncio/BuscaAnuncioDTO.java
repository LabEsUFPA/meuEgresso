package labes.facomp.ufpa.br.meuegresso.dto.anuncio;

import java.util.Arrays;
import java.util.List;

import lombok.Builder;
import lombok.Data;

/**
 * Objeto para receber os filtros da busca de anúncio
 *
 * @author João Paulo, Lucas Cantão
 * @since 18/05/2023
 * @version 1.0
 */
@Data
@Builder
public class BuscaAnuncioDTO {

    @Builder.Default
    private String titulo = "";

    @Builder.Default
    private List<Integer> areaEmprego = Arrays.asList();

}
