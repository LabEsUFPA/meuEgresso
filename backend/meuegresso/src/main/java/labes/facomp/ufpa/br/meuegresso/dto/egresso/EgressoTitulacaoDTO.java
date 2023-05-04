package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import labes.facomp.ufpa.br.meuegresso.dto.curso.CursoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.titulacao.TitulacaoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import lombok.Builder;
import lombok.Data;

/**
 *
 *
 * @author João Paulo
 * @since 16/04/2023
 * @version 1.0
 */
@Data
@Builder
public class EgressoTitulacaoDTO {

    private EgressoTitulacaoModelId id;

    private EgressoModel egresso;

    private EmpresaModel empresa;

    private CursoDTO curso;

    private TitulacaoDTO titulacao;
}
