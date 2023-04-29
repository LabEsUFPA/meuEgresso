package labes.facomp.ufpa.br.meuegresso.dto.administradores.pesquisacientifica;

import java.time.LocalDate;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.empresa.EmpresaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.tipobolsa.TipoBolsaDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * Encapsulamento da tabela Pesquisa Cientifica a fim de representar os dados de
 * auditoria.
 *
 * @author Alfredo Gabriel
 * @since 22/04/2023
 * @version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class PesquisaCientificaDTO {

    private Integer id;

    private String nome;

    private TipoBolsaDTO tipoBolsa;

    private EmpresaDTO empresa;

    private LocalDate inicio;

    private LocalDate fim;
}
