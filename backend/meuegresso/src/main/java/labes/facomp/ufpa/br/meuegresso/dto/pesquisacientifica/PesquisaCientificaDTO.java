package labes.facomp.ufpa.br.meuegresso.dto.pesquisacientifica;

import java.time.LocalDate;

import labes.facomp.ufpa.br.meuegresso.dto.empresa.EmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.tipobolsa.TipoBolsaDTO;
import lombok.Data;

/**
 * Encapsulamento da tabela PesquisaCientifica a fim de representar somente os
 * dados não
 * sensiveis.
 *
 * @author Pedro Inácio
 * @since 16/04/2023
 * @version 1.0
 */
@Data
public class PesquisaCientificaDTO {

    private Integer id;

    private String nome;

    private TipoBolsaDTO tipoBolsa;

    private EmpresaDTO empresa;

    private LocalDate inicio;

    private LocalDate fim;
}
