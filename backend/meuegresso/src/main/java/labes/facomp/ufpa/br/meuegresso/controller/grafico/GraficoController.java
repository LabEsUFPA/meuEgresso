package labes.facomp.ufpa.br.meuegresso.controller.grafico;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import labes.facomp.ufpa.br.meuegresso.dto.grafico.AreaAtuacaoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.CotaGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.GenerosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.GraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.IdadesGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.SetorAtuacaoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.model.AreaAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.service.areaatuacao.AreaAtuacaoService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import labes.facomp.ufpa.br.meuegresso.service.genero.GeneroService;
import labes.facomp.ufpa.br.meuegresso.service.setoratuacao.SetorAtuacaoService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer end-points para genero.
 *
 * @author Pedro Inácio, Bruno Eiki, Camilo Santos
 * @since 19/05/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/grafico")
public class GraficoController {
    
    private final EgressoService egressoService;

    private final GeneroService generoService;

    private final AreaAtuacaoService areaAtuacaoService;

    private final SetorAtuacaoService setorAtuacaoService;

    /**
     * Endpoint responsavel por buscar todas as informacoes de grafico.
     *
     * @return {@link GraficoDTO} retorna .
     * @author Pedro Inácio
     * @since 19/05/2023
     */
    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public GraficoDTO getGrafico(){
        return new GraficoDTO(getIdades(), getGeneros());
    }
    
    /**
     * Endpoint responsavel por buscar todas as idades dos egressos no banco.
     *
     * @return {@link IdadesGraficoDTO} Retorna uma lista com todas as idades e a media delas.
     * @author Pedro Inácio
     * @since 19/05/2023
     */
    @GetMapping(value = "/idades")
    @ResponseStatus(code = HttpStatus.OK)
    public IdadesGraficoDTO getIdades(){
        return new IdadesGraficoDTO(egressoService.findAllIdades(), egressoService.findAllIdades().stream().mapToDouble(a -> a).average());
    }

    /**
     * Endpoint responsavel por buscar todos os generos dos egressos no banco.
     *
     * @return {@link GenerosGraficoDTO} Retorna a contagem de cada genero (masc, fem, trans e outros).
     * @author Pedro Inácio
     * @since 19/05/2023
     */
    @GetMapping(value = "/generos")
    @ResponseStatus(code = HttpStatus.OK)
    public GenerosGraficoDTO getGeneros() {
        List<GeneroModel> lista = generoService.findAll();
        return new GenerosGraficoDTO(
                (int) lista.stream().filter(a -> a.getNome().equalsIgnoreCase("masculino")).count(),
                (int) lista.stream().filter(a -> a.getNome().equalsIgnoreCase("feminino")).count(),
                (int) lista.stream().filter(a -> a.getNome().equalsIgnoreCase("transsexual")).count(),
                (int) lista.stream().filter(a -> a.getNome().equalsIgnoreCase("outros")).count());
    }
    
    @GetMapping(value = "/cotas")
    @ResponseStatus(code = HttpStatus.OK)
    public CotaGraficoDTO getCotas() {
        List<EgressoModel> lista  = egressoService.findAll();

        Stream<EgressoModel> trueEgressoList =  lista.stream().filter(a -> a.getBolsista().equals(true));
        Stream<EgressoModel> falseEgressoList =  lista.stream().filter(a -> a.getBolsista().equals(false));

        return new CotaGraficoDTO(
            (int) trueEgressoList.count(),
            trueEgressoList.map(egresso -> egresso.getUsuario().getUsername()).collect(Collectors.toList()),
            (int) falseEgressoList.count(),
            falseEgressoList.map(egresso -> egresso.getUsuario().getUsername()).collect(Collectors.toList())
        );

    }

    @GetMapping(value = "/atuacao")
    @ResponseStatus(code = HttpStatus.OK)
    public AreaAtuacaoGraficoDTO getAtuacao() {
        List<EgressoModel> lista = egressoService.findAll();

        return new AreaAtuacaoGraficoDTO(
            (int) lista.stream().filter(a -> a.getEmprego().getAreaAtuacao().getNome().equals("Computação")).count(),
            (int) lista.stream().filter(a -> a.getEmprego().getAreaAtuacao().getNome().equals("Pesquisa")).count(),
            (int) lista.stream().filter(a -> a.getEmprego().getAreaAtuacao().getNome().equals("Desempregado")).count(),
            (int) lista.stream().filter(a -> a.getEmprego().getAreaAtuacao().getNome().equals("Programador")).count(),
            (int) lista.stream().filter(a -> a.getEmprego().getAreaAtuacao().getNome().equals("Analista")).count(),
            (int) lista.stream().filter(a -> a.getEmprego().getAreaAtuacao().getNome().equals("Outros")).count()
        );

    }

    @GetMapping(value = "/setor")
    @ResponseStatus(code = HttpStatus.OK)
    public SetorAtuacaoGraficoDTO getSetor() {
        List<EgressoModel> lista = egressoService.findAll();

        return new SetorAtuacaoGraficoDTO(
            (int) lista.stream().filter(a -> a.getEmprego().getSetorAtuacao().getNome().equals("Empresarial")).count(),
            (int) lista.stream().filter(a -> a.getEmprego().getSetorAtuacao().getNome().equals("Público")).count(),
            (int) lista.stream().filter(a -> a.getEmprego().getSetorAtuacao().getNome().equals("Terceiro setor")).count(),
            (int) lista.stream().filter(a -> a.getEmprego().getSetorAtuacao().getNome().equals("Magistério/Docência")).count(),
            (int) lista.stream().filter(a -> a.getEmprego().getSetorAtuacao().getNome().equals("Outros")).count()
        );

    }
}
