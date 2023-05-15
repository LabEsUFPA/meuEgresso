package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.empresa.EmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.curso.CursoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.titulacao.TitulacaoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;
import lombok.Data;

/**
 *
 *
 * @author João Paulo
 * @since 16/04/2023
 * @version 1.0
 */
@Data
public class EgressoTitulacaoDTO {

    private EgressoTitulacaoModelId id;

    private CursoDTO curso;

    private EmpresaDTO empresa;

    private TitulacaoDTO titulacao;
}
