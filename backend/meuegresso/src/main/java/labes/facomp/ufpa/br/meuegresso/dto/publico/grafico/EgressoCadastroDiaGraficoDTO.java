package labes.facomp.ufpa.br.meuegresso.dto.publico.grafico;

import java.sql.Date;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EgressoCadastroDiaGraficoDTO {
    private Map<Date, Integer> egressosCadastradosPorDia;
}
