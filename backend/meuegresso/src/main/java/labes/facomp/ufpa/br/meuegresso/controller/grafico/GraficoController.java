package labes.facomp.ufpa.br.meuegresso.controller.grafico;

import java.util.List;
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
import labes.facomp.ufpa.br.meuegresso.dto.grafico.LocalPosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.PosGraduacaoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.SetorAtuacaoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
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
        List<EgressoModel> lista = egressoService.findAll();

        return new GenerosGraficoDTO(
                (int) lista.stream().filter(a -> a.getGenero().getNome().equalsIgnoreCase("masculino")).count(),
                (int) lista.stream().filter(a -> a.getGenero().getNome().equalsIgnoreCase("feminino")).count(),
                (int) lista.stream().filter(a -> a.getGenero().getNome().equalsIgnoreCase("transsexual")).count(),
                (int) lista.stream().filter(a -> a.getGenero().getNome().equalsIgnoreCase("não-binário")).count(),
                (int) lista.stream().filter(a -> a.getGenero().getNome().equalsIgnoreCase("não quero declarar")).count(),
                (int) lista.stream().filter(a -> a.getGenero().getNome().equalsIgnoreCase("outros")).count());
    }

    /**
     * Endpoint responsavel por buscar todos os Locais da Pos dos egressos no banco.
     *
     * @return {@link LocalPosGraficoDTO} Retorna o endereco do local da pos.
     * @author Pedro Inácio
     * @since 21/05/2023
     */
    @GetMapping(value = "/LocalPos")
    @ResponseStatus(code = HttpStatus.OK)
    public LocalPosGraficoDTO getLocalPos() {
        List<EgressoModel> lista = egressoService.findAll();

        return new LocalPosGraficoDTO(
            lista.stream().map(a -> a.getTitulacao().getCurso().getNome()).findFirst(),
            lista.stream().map(a -> a.getTitulacao().getEmpresa().getEndereco().getCidade()).findFirst(),
            lista.stream().map(a -> a.getTitulacao().getEmpresa().getEndereco().getEstado()).findFirst(),
            lista.stream().map(a -> a.getTitulacao().getEmpresa().getEndereco().getPais()).findFirst());
    }
    
    /**
     * Endpoint responsavel por contar todos os egressos cotistas e não cotistas.
     *
     * @return {@link CotaGraficoDTO} Retorna a contagem de cotistas e não cotistas, usernames separados por grupo.
     * @author Camilo Santos
     * @since 20/05/2023
     */
    @GetMapping(value = "/cotas")
    @ResponseStatus(code = HttpStatus.OK)
    public CotaGraficoDTO getCotas() {
        List<EgressoModel> lista = egressoService.findAll();

        Stream<EgressoModel> trueEgressoList = lista.stream().filter(a -> a.getBolsista().equals(true));
        Stream<EgressoModel> falseEgressoList = lista.stream().filter(a -> a.getBolsista().equals(false));

        return new CotaGraficoDTO(
                (int) trueEgressoList.count(),
                (int) falseEgressoList.count());

    }

    /**
     * Endpoint responsavel por retornar a contagem de egresso por área de atuação.
     *
     * @return {@link AreaAtuacaoGraficoDTO} Retorna a contagem de egresso por área
     *         de atuação.
     * @author Camilo Santos
     * @since 20/05/2023
     */
    @GetMapping(value = "/atuacao")
    @ResponseStatus(code = HttpStatus.OK)
    public AreaAtuacaoGraficoDTO getAtuacao() {
        List<EgressoModel> lista = egressoService.findAll();

        return new AreaAtuacaoGraficoDTO(
                (int) lista.stream().filter(a -> a.getEmprego().getAreaAtuacao().getNome().equalsIgnoreCase("Computação")).count(),
                (int) lista.stream().filter(a -> a.getEmprego().getAreaAtuacao().getNome().equalsIgnoreCase("Pesquisa")).count(),
                (int) lista.stream().filter(a -> a.getEmprego().getAreaAtuacao().getNome().equalsIgnoreCase("Desempregado")).count(),
                (int) lista.stream().filter(a -> a.getEmprego().getAreaAtuacao().getNome().equalsIgnoreCase("Programador")).count(),
                (int) lista.stream().filter(a -> a.getEmprego().getAreaAtuacao().getNome().equalsIgnoreCase("Analista")).count(),
                (int) lista.stream().filter(a -> a.getEmprego().getAreaAtuacao().getNome().equalsIgnoreCase("Outros")).count());

    }

    /**
     * Endpoint responsavel por retornar a contagem de egressos por setor de atuação.
     *
     * @return {@link SetorAtuacaoGraficoDTO} Retorna a contagem de egresso por setor de atuação.
     * @author Camilo Santos
     * @since 20/05/2023
     */
    @GetMapping(value = "/setor")
    @ResponseStatus(code = HttpStatus.OK)
    public SetorAtuacaoGraficoDTO getSetor() {
        List<EgressoModel> lista = egressoService.findAll();

        return new SetorAtuacaoGraficoDTO(
                (int) lista.stream().filter(a -> a.getEmprego().getSetorAtuacao().getNome().equalsIgnoreCase("Empresarial")).count(),
                (int) lista.stream().filter(a -> a.getEmprego().getSetorAtuacao().getNome().equalsIgnoreCase("Público")).count(),
                (int) lista.stream().filter(a -> a.getEmprego().getSetorAtuacao().getNome().equalsIgnoreCase("Terceiro Setor")).count(),
                (int) lista.stream().filter(a -> a.getEmprego().getSetorAtuacao().getNome().equalsIgnoreCase("Magistério/Docencia")).count(),
                (int) lista.stream().filter(a -> a.getEmprego().getSetorAtuacao().getNome().equalsIgnoreCase("Outros")).count());
    }
    
    /**
     * Endpoint responsavel por contabilizar egressos com e sem pós graduação
     *
     * @return {@link SetorAtuacaoGraficoDTO} Retorna a quantidade de egressos com e sem pós 
     * @author Camilo Santos
     * @since 20/05/2023
     */
    @GetMapping(value = "/pos")
    @ResponseStatus(code = HttpStatus.OK)
    public PosGraduacaoGraficoDTO getPos() {
        List<EgressoModel> lista = egressoService.findAll();

        Stream<EgressoModel> trueEgressoList = lista.stream().filter(e -> e.getPosGraduacao().equals(true));
        Stream<EgressoModel> falseEgressoList = lista.stream().filter(e -> e.getPosGraduacao().equals(false));

        return new PosGraduacaoGraficoDTO(

                (int) trueEgressoList.count(),
                (int) falseEgressoList.count());
    }
}
