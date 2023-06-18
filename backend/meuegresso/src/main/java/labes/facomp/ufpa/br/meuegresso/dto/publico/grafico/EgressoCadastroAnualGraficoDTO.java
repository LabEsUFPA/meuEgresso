package labes.facomp.ufpa.br.meuegresso.dto.publico.grafico;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EgressoCadastroAnualGraficoDTO {
    private Map<Integer, Long> egressosCadastradosPorAno;

}
