package labes.facomp.ufpa.br.meuegresso.dto.egresso;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.contribuicao.ContribuicaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.usuario.UsuarioDTO;
import labes.facomp.ufpa.br.meuegresso.dto.pesquisacientifica.PesquisaCientificaDTO;

public class EgressoCadastroDTO {
    
    public UsuarioDTO egresso;

    public EgressoColacaoDTO acdemico;

    public EgressoEmpresaDTO carreira;

    public PesquisaCientificaDTO pesquisa;

    public ContribuicaoDTO contribuicao;
}
