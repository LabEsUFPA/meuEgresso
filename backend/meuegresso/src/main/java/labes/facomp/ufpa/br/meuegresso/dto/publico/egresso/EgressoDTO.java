package labes.facomp.ufpa.br.meuegresso.dto.publico.egresso;

import java.time.LocalDate;
import java.util.Set;

import labes.facomp.ufpa.br.meuegresso.dto.contribuicao.ContribuicaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.cota.CotaDTO;
import labes.facomp.ufpa.br.meuegresso.dto.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoEmpresaBasicDTO;
import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoTitulacaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.genero.GeneroDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.usuario.UsuarioDTO;
import labes.facomp.ufpa.br.meuegresso.dto.tipobolsa.TipoBolsaDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)

public class EgressoDTO {
        private Integer id; //ok

        private GeneroDTO genero; //ok

        private LocalDate nascimento; 
        
        private EgressoEmpresaBasicDTO emprego;

        private EgressoTitulacaoDTO titulacao;

        private String matricula;

        private Set<CotaDTO> cotas;

        private TipoBolsaDTO bolsa;

        private DepoimentoDTO depoimento;

        private ContribuicaoDTO contribuicao;

        private UsuarioDTO usuario;
}