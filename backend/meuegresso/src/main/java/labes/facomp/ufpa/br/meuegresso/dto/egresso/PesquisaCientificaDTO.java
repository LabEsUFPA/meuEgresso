package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import java.util.Date;

/**
 * Encapsulamento da tabela PesquisaCientifica a fim de representar somente os dados não
 * sensiveis.
 *
 * @author Pedro Inácio
 * @since 16/04/2023
 * @version 1.0
 */
public class PesquisaCientificaDTO {
    private Integer id;
    
    private String nome;
    
    private Date inicio;
    
    private Date fim;
}
