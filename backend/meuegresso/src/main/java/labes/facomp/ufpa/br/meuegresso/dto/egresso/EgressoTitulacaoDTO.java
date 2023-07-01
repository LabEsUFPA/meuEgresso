package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import labes.facomp.ufpa.br.meuegresso.dto.curso.CursoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.titulacao.TitulacaoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Dados que representam o relacionamento do egresso com a titulação.
 *
 * @author João Paulo, Alfredo Gabriel
 * @since 13/05/2023
 * @version 1.1
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EgressoTitulacaoDTO {

    @Valid
    private EgressoTitulacaoModelId id;

    @Valid
    @NotNull(message = "Informe o curso.")
    private CursoDTO curso;

    @Valid
    @NotNull(message = "Informe a titulação.")
    private TitulacaoDTO titulacao;

    @Valid
    @NotNull(message = "informe a instituição.")
    private EmpresaDTO empresa;

}
