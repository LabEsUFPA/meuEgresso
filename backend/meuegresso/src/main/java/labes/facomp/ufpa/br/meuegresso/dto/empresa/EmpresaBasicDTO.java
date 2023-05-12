package labes.facomp.ufpa.br.meuegresso.dto.empresa;

import java.util.Set;

import labes.facomp.ufpa.br.meuegresso.dto.endereco.EnderecoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.setoratuacao.SetorAtuacaoDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EmpresaBasicDTO {

    private Integer id;

    private String nome;

    private Set<SetorAtuacaoDTO> setorAtuacoes;

}
