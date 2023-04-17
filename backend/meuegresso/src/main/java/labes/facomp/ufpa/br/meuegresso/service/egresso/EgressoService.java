package labes.facomp.ufpa.br.meuegresso.service.egresso;

import org.springframework.http.ResponseEntity;

import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.TrabalhoPublicadoModel;


public interface EgressoService {

    public EgressoModel adicionarEgresso(EgressoModel egresso);

    public ContribuicaoModel adicionarContribuicao(ContribuicaoModel contribuicao);

    public EgressoEmpresaModel adicionarEmprego(EgressoEmpresaModel emprego);

    public TrabalhoPublicadoModel adicionarPesquisa(TrabalhoPublicadoModel pesquisa);

    public DepoimentoModel adicionarDepoimento(DepoimentoModel depoimento);


    public ResponseEntity<String> deletarEgresso(EgressoModel egresso);

    public ResponseEntity<String> deletarContribuicao(ContribuicaoModel contribuicao);

    public ResponseEntity<String> deletarEmprego(EgressoEmpresaModel emprego);

    public ResponseEntity<String> deletarPesquisa(TrabalhoPublicadoModel pesquisa);

    public ResponseEntity<String> deletarDepoimento(DepoimentoModel depoimento);


    public Boolean existsById(Integer id);

    public void deleteById(Integer id);


}
