package labes.facomp.ufpa.br.meuegresso.controller.publico.grafico;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.AreaAtuacaoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.BolsistasGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.CotaGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.CotistaGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.CursosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.EmpresaGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.EnderecoEmpresasGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.GenerosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.IdadesGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.InteresseEmPosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.LocalPosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.PosGraduacaoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.RemuneracaoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.SalarioGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.SetorAtuacaoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.TipoAlunoGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.TipoBolsaGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.service.areaatuacao.AreaAtuacaoService;
import labes.facomp.ufpa.br.meuegresso.service.cota.CotaService;
import labes.facomp.ufpa.br.meuegresso.service.curso.CursoService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoEmpresaService;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import labes.facomp.ufpa.br.meuegresso.service.empresa.EmpresaService;
import labes.facomp.ufpa.br.meuegresso.service.faixasalarial.FaixaSalarialService;
import labes.facomp.ufpa.br.meuegresso.service.genero.GeneroService;
import labes.facomp.ufpa.br.meuegresso.service.setoratuacao.SetorAtuacaoService;
import labes.facomp.ufpa.br.meuegresso.service.tipobolsa.TipoBolsaService;
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
@RequestMapping("/publico/grafico")
public class GraficoPubController {

	private final EgressoService egressoService;

	private final EmpresaService empresaService;

	private final CursoService cursoService;

	private final GeneroService generoService;

	private final AreaAtuacaoService areaAtuacaoService;

	private final SetorAtuacaoService setorAtuacaoService;

	private final TipoBolsaService tipoBolsaService;

	private final CotaService cotaService;

	private final EgressoEmpresaService egressoEmpresaService;

	private final FaixaSalarialService faixaSalarialService;

	/**
	 * Endpoint responsavel por buscar as informacoes de endereco dos empregos dos
	 * egressos.
	 *
	 * @return {@link EnderecoEmpresasGraficoDTO} retorna endereco dos empregos.
	 * @author Pedro Inácio
	 * @since 22/05/2023
	 */
	@GetMapping(value = "/enderecoEmpresas")
	@ResponseStatus(code = HttpStatus.OK)
	public EnderecoEmpresasGraficoDTO getEnderecoEmpresas() {
		List<EgressoEmpresaModel> lista = egressoEmpresaService.findAll();

		List<List<String>> enderecos = new ArrayList<>();

		List<String> umEndereco;

		for (int i = 0; i < lista.size(); i++) {
			umEndereco = new ArrayList<>();
			umEndereco.add(lista.get(i).getEmpresa().getNome());
			umEndereco.add(lista.get(i).getEndereco().getPais());
			umEndereco.add(lista.get(i).getEndereco().getEstado());
			umEndereco.add(lista.get(i).getEndereco().getCidade());
			enderecos.add(umEndereco);
		}

		return new EnderecoEmpresasGraficoDTO(enderecos);
	}

	/**
	 * Endpoint responsavel por buscar todas as idades dos egressos no banco.
	 *
	 * @return {@link IdadesGraficoDTO} Retorna uma lista com todas as idades e a
	 *         media delas.
	 * @author Pedro Inácio, Alfredo Gabriel
	 * @since 08/06/2023
	 */
	@GetMapping(value = "/idades")
	@ResponseStatus(code = HttpStatus.OK)
	public IdadesGraficoDTO getIdades() {
		Map<Integer, Integer> idadesContagens = egressoService.countAgeFromEgressos();

		Double media = 0.0;
		Integer total = 0;
		for (Entry<Integer, Integer> entry : idadesContagens.entrySet()) {
			media += entry.getKey() * entry.getValue();
			total += entry.getValue();
		}
		final Integer totalTwo = total;
		idadesContagens.entrySet().removeIf(entry -> entry.getValue() <= totalTwo*0.05);

		return new IdadesGraficoDTO(media,idadesContagens);
	}

	/**
	 * Endpoint responsavel por buscar todos os generos dos egressos no banco.
	 *
	 * @return {@link GenerosGraficoDTO} Retorna a contagem de cada genero (masc,
	 *         fem, trans e outros).
	 * @author Pedro Inácio, Alfredo Gabriel
	 * @since 08/06/2023
	 */
	@GetMapping(value = "/generos")
	@ResponseStatus(code = HttpStatus.OK)
	public GenerosGraficoDTO getGeneros() {
		Map<String, Integer> generosContagens = generoService.countEgressoByGenero();

		generosContagens.entrySet().removeIf(entry -> entry.getValue() == 0);

		return new GenerosGraficoDTO(generosContagens);
	}

	/**
	 * Endpoint responsavel por buscar todos os salarios dos egressos no banco.
	 *
	 * @return {@link GenerosGraficoDTO} Retorna a contagem de cada egressos por
	 *         faixa salarial.
	 * @author Pedro Inácio, Alfredo Gabriel
	 * @since 08/06/2023
	 */
	@GetMapping(value = "/salarios")
	@ResponseStatus(code = HttpStatus.OK)
	public SalarioGraficoDTO getSalarios() {
		Map<String, Integer> salariosContagens = faixaSalarialService.countEgressoInFaixa();

		salariosContagens.entrySet().removeIf(entry -> entry.getValue() == 0);

		return new SalarioGraficoDTO(salariosContagens);
	}

	/**
	 * Endpoint responsavel por buscar todos os tipo de alunos dos egressos no
	 * banco.
	 *
	 * @return {@link TipoAlunoGraficoDTO} Retorna a contagem de cada tipo de aluno.
	 * @author Pedro Inácio, Alfredo Gabriel
	 * @since 08/06/2023
	 */
	@GetMapping(value = "/tipoAlunos")
	@ResponseStatus(code = HttpStatus.OK)
	public TipoAlunoGraficoDTO getTipoAlunos() {

		Map<String, Integer> tipoAluno = egressoService.countTipoAluno();

		tipoAluno.entrySet().removeIf(entry -> entry.getValue() == 0);

		return new TipoAlunoGraficoDTO(tipoAluno);
	}

	/**
	 * Endpoint responsavel por contabilizar egressos com e sem bolsa
	 *
	 * @return {@link BolsistasGraficoDTO} Retorna a quantidade de egressos com e
	 *         sem bolsa
	 * @author Pedro Inácio, Alfredo Gabriel
	 * @since 08/06/2023
	 */
	@GetMapping(value = "/bolsistas")
	@ResponseStatus(code = HttpStatus.OK)
	public BolsistasGraficoDTO getBolsistas() {
		Map<String, Integer> bolsistasContagens = egressoService.countBolsista();

		bolsistasContagens.entrySet().removeIf(entry -> entry.getValue() == 0);

		return new BolsistasGraficoDTO(bolsistasContagens);
	}

	/**
	 * Endpoint responsavel por buscar todos os Tipo de Bolsa dos egressos no banco.
	 *
	 * @return {@link TipoBolsaGraficoDTO} Retorna a contagem de cada tipo de Bolsa.
	 * @author Pedro Inácio, Alfredo Gabriel
	 * @since 08/06/2023
	 */
	@GetMapping(value = "/tipoBolsa")
	@ResponseStatus(code = HttpStatus.OK)
	public TipoBolsaGraficoDTO getTipoBolsa() {
		Map<String, Integer> tipoBolsaContagens = tipoBolsaService.countEgressoForBolsa();

		tipoBolsaContagens.entrySet().removeIf(entry -> entry.getValue() == 0);

		return new TipoBolsaGraficoDTO(tipoBolsaContagens);
	}

	/**
	 * EndPoint responsável por enumerar a quantidade de egressos em cada
	 * remuneração.
	 *
	 * @return {@link RemuneracaoGraficoDTO} retorna a quantidade de egressos por
	 *         cada tipo de remuneração.
	 * @author Camilo Santos, Alfredo Gabriel
	 * @since 08/06/2023
	 */
	@GetMapping(value = "/remuneracao")
	@ResponseStatus(code = HttpStatus.OK)
	public RemuneracaoGraficoDTO getRemuneracao() {
		Map<Double, Integer> remuneracaoContagem = egressoService.countRemuneracaoBolsa();

		
		long total = 0;
		for (Entry<Double, Integer> entry : remuneracaoContagem.entrySet()) {
			total += entry.getValue();
		}
		Double mediaOutros = 0.0;
		long outros = 0;
		for(Iterator<Map.Entry<Double, Integer>> it = remuneracaoContagem.entrySet().iterator(); it.hasNext(); ) {
			Map.Entry<Double, Integer> entry = it.next();
			if(entry.getValue() <= total*0.05) {
				outros += entry.getValue();
				mediaOutros += entry.getKey() * entry.getValue();
				it.remove();
			}
			if(entry.getKey() == 0){
				it.remove();
			}
		}

		if(outros<0){
			remuneracaoContagem.put(mediaOutros, (int) outros);
		}

		return new RemuneracaoGraficoDTO(remuneracaoContagem);
	}

	/**
	 * EndPoint responsável por enumerar a quantidade de egressos cotistas e
	 * não-cotistas.
	 *
	 * @return {@link CotistaGraficoDTO} retorna cotistas e não-cotistas enumerados.
	 * @author Camilo Santos, Alfredo Gabriel
	 * @since 08/06/2023
	 */
	@GetMapping(value = "/cotista")
	@ResponseStatus(code = HttpStatus.OK)
	public CotistaGraficoDTO getCotista() {
		Map<String, Integer> cotistaContagem = egressoService.countCotista();

		cotistaContagem.entrySet().removeIf(entry -> entry.getValue() == 0);

		return new CotistaGraficoDTO(cotistaContagem);
	}

	/**
	 * Endpoint responsavel por buscar todos os Locais da Pos dos egressos no banco.
	 *
	 * @return {@link LocalPosGraficoDTO} Retorna o endereco do local da pos.
	 * @author Pedro Inácio
	 * @since 21/05/2023
	 */
	@GetMapping(value = "/localPos")
	@ResponseStatus(code = HttpStatus.OK)
	public List<LocalPosGraficoDTO> getLocalPos() {
		List<LocalPosGraficoDTO> locais = empresaService.countEgressoByPos();

		if(locais.size() >= 10){
			List<LocalPosGraficoDTO> locaisDez = locais.stream().limit(9).collect(Collectors.toList());
			long outros = 0;
			for(int i=9; i <= locais.size(); i++){
				outros += locais.get(i).getQuantidade();
			}
			if(outros > 0){
				LocalPosGraficoDTO outroslocais = new LocalPosGraficoDTO("Outros", outros);
				locaisDez.add(outroslocais);
			}
			return locaisDez;
		}
		else{
			return locais;
		}
	}

	/**
	 * Endpoint responsavel por buscar todos os cursos de pós dos egressos no banco.
	 *
	 * @return {@link CursosGraficoDTO} Retorna a lista de cursos de pós.
	 * @author Pedro Inácio
	 * @since 21/05/2023
	 */
	@GetMapping(value = "/cursos")
	@ResponseStatus(code = HttpStatus.OK)
	public List<CursosGraficoDTO> getCursos() {
		List<CursosGraficoDTO> cursos = cursoService.countEgressoByCurso();

		if(cursos.size() >= 10){
			List<CursosGraficoDTO> cursosDez = cursos.stream().limit(9).collect(Collectors.toList());
			long outros = 0;
			for(int i=9; i <= cursos.size(); i++){
				outros += cursos.get(i).getQuantidade();
			}
			if(outros > 0){
				CursosGraficoDTO outrosCursos = new CursosGraficoDTO("Outros", outros);
				cursosDez.add(outrosCursos);
			}
			return cursosDez;
		}
		else{
			return cursos;
		}
	}

	/**
	 * Endpoint responsavel por contabilizar egressos com interesse em pós graduação
	 *
	 * @return {@link SetorAtuacaoGraficoDTO} Retorna a quantidade de egressos
	 *         interesse em pós graduação
	 * @author Pedro Inácio, Alfredo Gabriel
	 * @since 08/06/2023
	 */
	@GetMapping(value = "/interesseEmPos")
	@ResponseStatus(code = HttpStatus.OK)
	public InteresseEmPosGraficoDTO getInteresseEmPos() {
		Map<String, Integer> interesseContagens = egressoService.countInteressePos();

		interesseContagens.entrySet().removeIf(entry -> entry.getValue() == 0);

		return new InteresseEmPosGraficoDTO(interesseContagens);
	}

	/**
	 * Endpoint responsavel por listar as empresas onde os egressos trabalham.
	 *
	 * @return {@link SetorAtuacaoGraficoDTO} Retorna a lista de nome de empresas
	 *         onde os egressos trabalham
	 * @author Pedro Inácio
	 * @since 22/05/2023
	 */
	@GetMapping(value = "/empresas")
	@ResponseStatus(code = HttpStatus.OK)
	public List<EmpresaGraficoDTO> getEmpresas() {
		List<EmpresaGraficoDTO> empresas = egressoEmpresaService.countEgressoByEmpresas();
		
		if(empresas.size() >= 10){
			List<EmpresaGraficoDTO> empresasDez = empresas.stream().limit(9).collect(Collectors.toList());
			long outros = 0;
			for(int i=9; i <= empresas.size(); i++){
				outros += empresas.get(i).getQuantidade();
			}
			if(outros > 0){
				EmpresaGraficoDTO outrasEmpresas = new EmpresaGraficoDTO("Outros", outros);
				empresasDez.add(outrasEmpresas);
			}
			return empresasDez;
		}
		else{
			return empresas;
		}

	}

	/**
	 * Endpoint responsavel por contar todos os egressos cotistas e não cotistas.
	 *
	 * @return {@link CotaGraficoDTO} Retorna a contagem de cotistas e não cotistas,
	 *         usernames separados por grupo.
	 * @author Camilo Santos, Alfredo Gabriel
	 * @since 08/06/2023
	 */
	@GetMapping(value = "/cotas")
	@ResponseStatus(code = HttpStatus.OK)
	public CotaGraficoDTO getCotas() {
		Map<String, Integer> cotasContagens = cotaService.countEgressoByCota();

		cotasContagens.entrySet().removeIf(entry -> entry.getValue() == 0);

		return new CotaGraficoDTO(cotasContagens);
	}

	/**
	 * Endpoint responsavel por retornar a contagem de egresso por área de atuação.
	 *
	 * @return {@link AreaAtuacaoGraficoDTO} Retorna a contagem de egresso por área
	 *         de atuação.
	 * @author Camilo Santos, Alfredo Gabriel
	 * @since 08/06/2023
	 */
	@GetMapping(value = "/atuacao")
	@ResponseStatus(code = HttpStatus.OK)
	public AreaAtuacaoGraficoDTO getAtuacao() {
		Map<String, Integer> areaAtuacao = areaAtuacaoService.countEgressoByAreaAtuacao();

		areaAtuacao.entrySet().removeIf(entry -> entry.getValue() == 0);

		return new AreaAtuacaoGraficoDTO(areaAtuacao);
	}

	/**
	 * Endpoint responsavel por retornar a contagem de egressos por setor de
	 * atuação.
	 *
	 * @return {@link SetorAtuacaoGraficoDTO} Retorna a contagem de egresso por
	 *         setor de atuação.
	 * @author Camilo Santos, Alfredo Gabriel
	 * @since 08/06/2023
	 */
	@GetMapping(value = "/setor")
	@ResponseStatus(code = HttpStatus.OK)
	public SetorAtuacaoGraficoDTO getSetor() {
		Map<String, Integer> setorAtuacaoContagens = setorAtuacaoService.countEgressoBySetorAtuacao();

		setorAtuacaoContagens.entrySet().removeIf(entry -> entry.getValue() == 0);

		return new SetorAtuacaoGraficoDTO(setorAtuacaoContagens);
	}

	/**
	 * Endpoint responsavel por contabilizar egressos com e sem pós graduação
	 *
	 * @return {@link SetorAtuacaoGraficoDTO} Retorna a quantidade de egressos com e
	 *         sem pós
	 * @author Camilo Santos, Alfredo Gabriel
	 * @since 08/06/2023
	 */
	@GetMapping(value = "/pos")
	@ResponseStatus(code = HttpStatus.OK)
	public PosGraduacaoGraficoDTO getPos() {
		Map<String, Integer> posGradContagens = egressoService.countFezPos();

		posGradContagens.entrySet().removeIf(entry -> entry.getValue() == 0);

		return new PosGraduacaoGraficoDTO(posGradContagens);
	}
}
