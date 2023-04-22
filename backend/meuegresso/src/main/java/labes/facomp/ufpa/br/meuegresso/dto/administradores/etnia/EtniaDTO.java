package labes.facomp.ufpa.br.meuegresso.dto.administradores.etnia;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.AuditableDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class EtniaDTO extends AuditableDTO {

    private Integer id;

    private String nome;

}
