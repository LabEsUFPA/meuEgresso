package labes.facomp.ufpa.br.meuegresso.controller.grupo;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.dto.grupo.GrupoDTO;

@SpringBootTest
@ActiveProfiles("test")
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class GrupoControllerTest {

	@Autowired
	private GrupoController grupoController;

	private final String NOME_TESTE_GRUPO = "TESTE GRUPO";

	@Test
	@Order(1)
	public void testCadastrarGrupo() throws Exception {
		GrupoDTO grupo = GrupoDTO.builder().nomeGrupo(NOME_TESTE_GRUPO).build();
		grupo = grupoController.cadastrarGrupo(grupo);
		assertNotNull(grupo.getIdGrupo());
	}

	@Test
	@Order(2)
	public void testFindById() throws Exception {
		Integer id = 1;
		GrupoDTO grupo = grupoController.findById(id);
		System.out.println(grupo);
		assertEquals(grupo.getIdGrupo(), id);
	}

	@Test
	@Order(3)
	public void testFindByNomeGrupo() throws Exception {
		GrupoDTO grupo = grupoController.findByNomeGrupo(NOME_TESTE_GRUPO);
		assertNotNull(grupo);
	}

	@Test
	@Order(4)
	public void testAtualizarGrupo() throws Exception {
		final String NOVO_NOME = "NOVO NOME";
		final Integer id = 1;
		GrupoDTO grupo = grupoController.findById(id);
		grupo.setNomeGrupo(NOVO_NOME);
		grupo = grupoController.atualizarGrupo(grupo);
		assertEquals(grupo.getNomeGrupo(), NOVO_NOME);
	}

}
