package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import java.time.LocalDate;

import labes.facomp.ufpa.br.meuegresso.dto.curso.CursoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.titulacao.TitulacaoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModelId;
import lombok.Data;

/**
 *
 *
 * @author João Paulo
 * @since 16/04/2023
 * @version 1.0
 */
@Data
public class EgressoColacaoDTO {

    private EgressoColacaoModelId id;

    private LocalDate ingresso;

    private LocalDate conclusao;

    private CursoDTO curso;

    private TitulacaoDTO titulacao;
}
