package labes.facomp.ufpa.br.meuegresso.controller.grupo;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import labes.facomp.ufpa.br.meuegresso.dto.grupo.GrupoDTO;
import lombok.RequiredArgsConstructor;

@SpringBootTest
@ActiveProfiles("test")
public class GrupoControllerTest {

	private GrupoController grupoController;

	private final String NOME_TESTE_GRUPO = "TESTE GRUPO";

	private GrupoDTO grupoDTO;

	@Test
	@Order(1)
	public void testCadastrarUsuario() throws Exception {
		GrupoDTO grupoDTO = GrupoDTO.builder().nomeGrupo(NOME_TESTE_GRUPO).build();
		grupoDTO = grupoController.cadastrarUsuario(this.grupoDTO);
		System.out.println(grupoDTO);
		assertNotNull(this.grupoDTO.getIdGrupo());
	}

	@Test
	@Order(2)
	public void testFindById() throws Exception {
		GrupoDTO grupo = grupoController.findById(this.grupoDTO.getIdGrupo());
		assertEquals(grupo, this.grupoDTO);
	}

	@Test
	@Order(3)
	public void testFindByNomeGrupo() throws Exception {
		GrupoDTO grupo = grupoController.findByNomeGrupo(NOME_TESTE_GRUPO);
		assertEquals(grupo, this.grupoDTO);
	}

	@Test
	@Order(4)
	public void testAtualizarUsuario() throws Exception {
		final String NOVO_NOME = "NOVO NOME";
		this.grupoDTO.setNomeGrupo(NOVO_NOME);
		this.grupoDTO = this.grupoController.atualizarUsuario(grupoDTO);
		assertEquals(this.grupoDTO.getNomeGrupo(), NOVO_NOME);
	}

}
