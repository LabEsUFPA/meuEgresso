package labes.facomp.ufpa.br.meuegresso.controller.publico.egresso;

import static org.mockito.ArgumentMatchers.anyInt;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hamcrest.Matchers;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import labes.facomp.ufpa.br.meuegresso.dto.contribuicao.ContribuicaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.depoimento.DepoimentoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.genero.GeneroDTO;
import labes.facomp.ufpa.br.meuegresso.dto.grupo.GrupoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.usuario.UsuarioDTO;
import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;

@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestInstance(Lifecycle.PER_CLASS)
class EgressoPubControllerTest {

	@Autowired
	private MockMvc mockMvc;

	@Mock
	private EgressoRepository egressoRepository;

	@MockBean
	private EgressoService egressoService;

	@InjectMocks
	private EgressoPubController egressoPubController;

	private EgressoModel egressoModel = new EgressoModel();

	private List<EgressoModel> egressosModel = new ArrayList<>();;

	@Autowired
	private ModelMapper mapper;

	@BeforeAll
	void setUp() throws Exception {
		GeneroDTO genero = new GeneroDTO(1, "TRANSSEXUAL");
		GrupoDTO grupo = new GrupoDTO(1, "ADMIN");
		Set<GrupoDTO> grupos = new HashSet<>();
		grupos.add(grupo);
		DepoimentoDTO depoimento = new DepoimentoDTO(1, "TextoDepoimento");
		ContribuicaoDTO contribuicao = new ContribuicaoDTO();
		
		UsuarioDTO usuario = UsuarioDTO.builder()
		.username("username")
		.nome("nome_test")
		.email("teste@gmail.com")
		.password("teste123")
		.grupos(grupos)
		.build();
		
		egressoModel.setId(1);
		egressoModel.setUsuario(mapper.map(usuario, UsuarioModel.class));
		egressoModel.setMatricula("202003940011");
		egressoModel.setNascimento(LocalDate.parse("1999-10-20"));
		egressoModel.setGenero(mapper.map(genero, GeneroModel.class));
		egressoModel.setDepoimento(mapper.map(depoimento, DepoimentoModel.class));
		
		contribuicao.setId(1);
		contribuicao.setDescricao("TextoContribuicao");
		contribuicao.setEgressoId(egressoModel.getId());
		
		egressoModel.setContribuicao(mapper.map(contribuicao, ContribuicaoModel.class));
		
		// No banco vai ter conflito de valores unicos, mas pro teste basta
		egressosModel.add(egressoModel);
		egressosModel.add(egressoModel);
		
	}

	@Test
	void testConsultarEgressos() throws Exception {
		Mockito.when(egressoService.findAll()).thenReturn(egressosModel);

		mockMvc.perform(MockMvcRequestBuilders.get("/publico/egresso"))
				.andExpect(MockMvcResultMatchers.jsonPath("$").value(Matchers.hasSize(2)))
				.andExpect(MockMvcResultMatchers.jsonPath("$[0].usuario.nome")
						.value(egressoModel.getUsuario().getNome()))
				.andExpect(MockMvcResultMatchers.jsonPath("$[0].matricula")
						.value(egressoModel.getMatricula()))
				.andExpect(MockMvcResultMatchers.jsonPath("$[0].nascimento")
						.value(egressoModel.getNascimento()
								.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))))
				.andExpect(MockMvcResultMatchers.jsonPath("$[0].genero.nome")
						.value(egressoModel.getGenero().getNome()))
				.andExpect(MockMvcResultMatchers.jsonPath("$[0].depoimento.descricao")
						.value(egressoModel.getDepoimento().getDescricao()))
				.andExpect(MockMvcResultMatchers.jsonPath("$[0].contribuicao.descricao")
						.value(egressoModel.getContribuicao().getDescricao()))
				.andExpect(MockMvcResultMatchers.jsonPath("$[0].usuario.email")
						.value(egressoModel.getUsuario().getEmail()))
				.andExpect(MockMvcResultMatchers.status().isOk());

		Mockito.verify(egressoService).findAll();
	}

	@Test
	void testFindById() throws Exception {
		Mockito.when(egressoService.findById(anyInt())).thenReturn(egressoModel);

		mockMvc.perform(MockMvcRequestBuilders.get("/publico/egresso/1"))
				.andExpect(MockMvcResultMatchers.jsonPath("$.usuario.nome")
						.value(egressoModel.getUsuario().getNome()))
				.andExpect(MockMvcResultMatchers.jsonPath("$.matricula")
						.value(egressoModel.getMatricula()))
				.andExpect(MockMvcResultMatchers.jsonPath("$.nascimento")
						.value(egressoModel.getNascimento()
								.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))))
				.andExpect(MockMvcResultMatchers.jsonPath("$.genero.nome")
						.value(egressoModel.getGenero().getNome()))
				.andExpect(MockMvcResultMatchers.jsonPath("$.depoimento.descricao")
						.value(egressoModel.getDepoimento().getDescricao()))
				.andExpect(MockMvcResultMatchers.jsonPath("$.contribuicao.descricao")
						.value(egressoModel.getContribuicao().getDescricao()))
				.andExpect(MockMvcResultMatchers.jsonPath("$.usuario.email")
						.value(egressoModel.getUsuario().getEmail()))
				.andExpect(MockMvcResultMatchers.status().isOk());

		Mockito.verify(egressoService).findById(anyInt());
	}
}
