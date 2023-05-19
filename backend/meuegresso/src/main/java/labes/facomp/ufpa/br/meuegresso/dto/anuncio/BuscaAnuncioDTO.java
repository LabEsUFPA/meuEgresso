package labes.facomp.ufpa.br.meuegresso.dto.anuncio;

import java.util.Arrays;
import java.util.List;

import lombok.Data;

/**
 * Objeto para receber os filtros da busca de anúncio
 *
 * @author João Paulo, Lucas Cantão
 * @since 18/05/2023
 * @version 1.0
 */
@Data
public class BuscaAnuncioDTO {

    private String titulo = "";

    private List<Integer> areaEmprego = Arrays.asList(1,2,3,4,5,6);

    private double minValorSalario = 0;
    private double maxValorSalario = 100000;
    
}
