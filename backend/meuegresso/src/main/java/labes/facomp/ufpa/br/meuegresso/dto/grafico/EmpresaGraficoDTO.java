package labes.facomp.ufpa.br.meuegresso.dto.grafico;

import java.util.Set;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dto para retorno de informacoes de Empresas dos egressos para o grafico
 *
 * @author Pedro Inácio
 * @since 22/05/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmpresaGraficoDTO {
    
    private Set<String> nomeEmpresas;

}
