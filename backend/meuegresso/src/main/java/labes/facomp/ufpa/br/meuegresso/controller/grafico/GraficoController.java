package labes.facomp.ufpa.br.meuegresso.controller.grafico;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import labes.facomp.ufpa.br.meuegresso.dto.grafico.GenerosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.GraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.IdadesGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import labes.facomp.ufpa.br.meuegresso.service.genero.GeneroService;
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
    @GetMapping
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
    @GetMapping
    @ResponseStatus(code = HttpStatus.OK)
    public GenerosGraficoDTO getGeneros(){
        List<GeneroModel> lista =generoService.findAll();
        return new GenerosGraficoDTO((int) lista.stream().filter(a-> a.getNome().equalsIgnoreCase("masculino")).count(), 
            (int) lista.stream().filter(a-> a.getNome().equalsIgnoreCase("feminino")).count(), 
            (int) lista.stream().filter(a-> a.getNome().equalsIgnoreCase("transsexual")).count(), 
            (int) lista.stream().filter(a-> a.getNome().equalsIgnoreCase("outros")).count());
    }
}
