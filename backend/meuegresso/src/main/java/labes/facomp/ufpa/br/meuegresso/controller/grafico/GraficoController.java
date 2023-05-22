package labes.facomp.ufpa.br.meuegresso.controller.grafico;

import java.time.LocalDate;
import java.time.Period;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import labes.facomp.ufpa.br.meuegresso.dto.grafico.AreaAtuacaoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.BolsistasGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.CotaGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.CursosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.GenerosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.GraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.IdadesGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.InteresseEmPosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.LocalPosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.PosGraduacaoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.SetorAtuacaoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.TipoAlunoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grafico.TipoBolsaGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.model.AreaAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.CotaModel;
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.TipoBolsaModel;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.service.areaatuacao.AreaAtuacaoService;
import labes.facomp.ufpa.br.meuegresso.service.cota.CotaService;
import labes.facomp.ufpa.br.meuegresso.service.curso.CursoService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoTitulacaoService;
import labes.facomp.ufpa.br.meuegresso.service.genero.GeneroService;
import labes.facomp.ufpa.br.meuegresso.service.setoratuacao.SetorAtuacaoService;
import labes.facomp.ufpa.br.meuegresso.service.tipobolsa.TipoBolsaService;
import labes.facomp.ufpa.br.meuegresso.service.titulacao.TitulacaoService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer end-points para os graficos.
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

    private final TipoBolsaService tipoBolsaService;

    private final EgressoTitulacaoService egressoTitulacaoService;

    private final TitulacaoService titulacaoService;

    private final CotaService cotaService;

    private final CursoService cursoService;

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
        List<EgressoModel> lista = egressoService.findAll();

        List<Integer> idades = egressoService.findAllIdades();
        
        HashMap<Integer, Integer> idadesContagens = new HashMap<>();

        int count = 0;
        for(int i =0; i< idades.size(); i++){
            final Integer idadeFinal = idades.get(i);
            count = (int) lista.stream().filter(a -> Period.between(a.getNascimento(), LocalDate.now()).getYears() == idadeFinal).count();

            idadesContagens.put(idadeFinal, count);
            
        }

        return new IdadesGraficoDTO(egressoService.findAllIdades().stream().mapToDouble(a -> a).average(), idadesContagens);
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

        List<GeneroModel> generos = generoService.findAll();

        HashMap<String, Integer> generosContagens = new HashMap<>();

        int count = 0;
        for(int i =0; i< generos.size(); i++){
            final String nomeFinal = generos.get(i).getNome();
            count = (int) lista.stream().filter(a -> a.getGenero().getNome().equalsIgnoreCase(nomeFinal)).count();

            generosContagens.put(nomeFinal, count);
            
        }
        
        return new GenerosGraficoDTO(generosContagens);
    }

    //TODO grafico de salario

    /**
     * Endpoint responsavel por buscar todos os tipo de alunos dos egressos no banco.
     *
     * @return {@link TipoAlunoGraficoDTO} Retorna a contagem de cada tipo de aluno.
     * @author Pedro Inácio
     * @since 21/05/2023
     */
    @GetMapping(value = "/tipoAlunos")
    @ResponseStatus(code = HttpStatus.OK)
    public TipoAlunoGraficoDTO getTipoAlunos() {

        List<EgressoTitulacaoModel > egressoTitulacao = egressoTitulacaoService.findAll();

        List<TitulacaoModel > titulacoes = titulacaoService.findAll();

        HashMap<String, Integer> tipoAluno = new HashMap<>();
        
        int count = 0;
        for(int i =0; i< titulacoes.size(); i++){
            
            final String nomeFinal = titulacoes.get(i).getNome();
            count = (int) egressoTitulacao.stream().filter(a -> a.getCurso().getNome().equalsIgnoreCase(nomeFinal)).count();
            tipoAluno.put(nomeFinal, count);         

        }
        
        return new TipoAlunoGraficoDTO(tipoAluno);
    }

    /**
     * Endpoint responsavel por contabilizar egressos com e sem bolsa
     *
     * @return {@link BolsistasGraficoDTO} Retorna a quantidade de egressos com e sem bolsa 
     * @author Pedro Inácio
     * @since 21/05/2023
     */
    @GetMapping(value = "/bolsistas")
    @ResponseStatus(code = HttpStatus.OK)
    public BolsistasGraficoDTO getBolsistas() {
        List<EgressoModel> lista = egressoService.findAll();

        return new BolsistasGraficoDTO(
                (int) lista.stream().filter(e -> e.getBolsista().equals(true)).count(),
                (int) lista.stream().filter(e -> e.getBolsista().equals(false)).count());
    }

    /**
     * Endpoint responsavel por buscar todos os Tipo de Bolsa dos egressos no banco.
     *
     * @return {@link TipoBolsaGraficoDTO} Retorna a contagem de cada tipo de Bolsa.
     * @author Pedro Inácio
     * @since 21/05/2023
     */
    @GetMapping(value = "/tipoBolsa")
    @ResponseStatus(code = HttpStatus.OK)
    public TipoBolsaGraficoDTO getTipoBolsa() {
        List<EgressoModel> lista = egressoService.findAll();

        List<TipoBolsaModel > tipoBolsa = tipoBolsaService.findAll();

        HashMap<String, Integer> tipoBolsaContagens = new HashMap<>();

        int count = 0;
        for(int i =0; i< tipoBolsa.size(); i++){
            final String nomeFinal = tipoBolsa.get(i).getNome();
            count = (int) lista.stream().filter(a -> a.getBolsa().getNome().equalsIgnoreCase(nomeFinal)).count();

            tipoBolsaContagens.put(nomeFinal, count);
            
        }
        
        return new TipoBolsaGraficoDTO((int) lista.stream().filter(a -> a.getBolsista().equals(true)).count(), tipoBolsaContagens);
    }

    //TODO remuneracao grafico

    /**
     * Endpoint responsavel por buscar todos os Locais da Pos dos egressos no banco.
     *
     * @return {@link LocalPosGraficoDTO} Retorna o endereco do local da pos.
     * @author Pedro Inácio
     * @since 21/05/2023
     */
    @GetMapping(value = "/localPos")
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
     * Endpoint responsavel por buscar todos os cursos dos egressos no banco.
     *
     * @return {@link CursosGraficoDTO} Retorna a contagem de cada tipo de curso.
     * @author Pedro Inácio
     * @since 21/05/2023
     */
    @GetMapping(value = "/cursos")
    @ResponseStatus(code = HttpStatus.OK)
    public CursosGraficoDTO getCursos() {
        List<EgressoModel> lista = egressoService.findAll();

        List<CursoModel> curso = cursoService.findAll();

        HashMap<String, Integer> cursoContagens = new HashMap<>();

        int count = 0;
        for(int i =0; i< curso.size(); i++){
            final String nomeFinal = curso.get(i).getNome();
            count = (int) lista.stream().filter(a -> a.getPosGraduacao().equals(true) && a.getTitulacao().getCurso().getNome().equalsIgnoreCase(nomeFinal)).count();
            cursoContagens.put(nomeFinal, count);         
        }
        
        return new CursosGraficoDTO(cursoContagens);
    }

    /**
     * Endpoint responsavel por contabilizar egressos com interesse em pós graduação
     *
     * @return {@link SetorAtuacaoGraficoDTO} Retorna a quantidade de egressos interesse em pós graduação
     * @author Pedro Inácio
     * @since 22/05/2023
     */
    @GetMapping(value = "/interesseEmPos")
    @ResponseStatus(code = HttpStatus.OK)
    public InteresseEmPosGraficoDTO getInteresseEmPos() {
        List<EgressoModel> lista = egressoService.findAll();

        return new InteresseEmPosGraficoDTO((int) lista.stream().filter(e -> e.getInteresseEmPos().equals(true)).count());
    }

    //TODO grafico com nome de empresas onde o egresso trabalha
    
    /**
     * Endpoint responsavel por contar todos os egressos cotistas e não cotistas.
     *
     * @return {@link CotaGraficoDTO} Retorna a contagem de cotistas e não cotistas, usernames separados por grupo.
     * @author Camilo Santos
     * @since 20/05/2023
     */
    @GetMapping(value = "/cotas")
    @ResponseStatus(code = HttpStatus.OK)
    public CotaGraficoDTO getCotas() { // TODO verificar complexidade no tempo kkkk
        List<EgressoModel> lista = egressoService.findAll();

        List<CotaModel> cotas = cotaService.findAll();

        HashMap<String, Integer> cotasContagens = new HashMap<>();

        
        for (int i = 0; i < cotas.size(); i++) { 
            final CotaModel cotaFinal = cotas.get(i);

            int count = 0;
            for (int j = 0; j < lista.size(); j++) {
                EgressoModel egresso = lista.get(j);

                Set<CotaModel> cotaEgresso = egresso.getCotas();

                if (cotaEgresso.contains(cotaFinal)) {count += 1;}  
            }
            cotasContagens.put(cotaFinal.getNome(), count);
        }
        return new CotaGraficoDTO(cotasContagens);
    }

    /**
     * Endpoint responsavel por retornar a contagem de egresso por área de atuação.
     *
     * @return {@link AreaAtuacaoGraficoDTO} Retorna a contagem de egresso por área de atuação.
     * @author Camilo Santos
     * @since 20/05/2023
     */
    @GetMapping(value = "/atuacao")
    @ResponseStatus(code = HttpStatus.OK)
    public AreaAtuacaoGraficoDTO getAtuacao() {
        List<EgressoModel> lista = egressoService.findAll();

        List<AreaAtuacaoModel> areaAtuacao = areaAtuacaoService.findAll();

        HashMap<String, Integer> areaAtuacaoContagens = new HashMap<>();

        int count = 0;
        for (int i = 0; i < areaAtuacao.size(); i++) {
            final String nomeFinal = areaAtuacao.get(i).getNome();
            count = (int) lista.stream().filter(a -> a.getEmprego().getAreaAtuacao().getNome().equalsIgnoreCase(nomeFinal)).count();

            areaAtuacaoContagens.put(nomeFinal, count);
        }

        return new AreaAtuacaoGraficoDTO(areaAtuacaoContagens);
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

        List<SetorAtuacaoModel> setorAtuacao = setorAtuacaoService.findAll();

        HashMap<String, Integer> setorAtuacaoContagens = new HashMap<>();

        int count = 0;
        for (int i = 0; i < setorAtuacao.size(); i++) {
            final String nomeFinal = setorAtuacao.get(i).getNome();
            count = (int) lista.stream()
                    .filter(a -> a.getEmprego().getSetorAtuacao().getNome().equalsIgnoreCase(nomeFinal)).count();

            setorAtuacaoContagens.put(nomeFinal, count);
        }

        return new SetorAtuacaoGraficoDTO(setorAtuacaoContagens);
    }
    
    /**
     * Endpoint responsavel por contabilizar egressos com e sem pós graduação
     *
     * @return {@link SetorAtuacaoGraficoDTO} Retorna a quantidade de egressos com e
     *         sem pós
     * @author Camilo Santos
     * @since 20/05/2023
     */
    @GetMapping(value = "/pos")
    @ResponseStatus(code = HttpStatus.OK)
    public PosGraduacaoGraficoDTO getPos() {
        List<EgressoModel> lista = egressoService.findAll();

        HashMap<String, Long> posGradContagens = new HashMap<>();

        posGradContagens.put("Fez Pós-graduação", lista.stream().filter(e -> e.getPosGraduacao().equals(true)).count());
        posGradContagens.put("Não fez Pós-graduação", lista.stream().filter(e -> e.getPosGraduacao().equals(false)).count());

        return new PosGraduacaoGraficoDTO(posGradContagens);
    }
}
