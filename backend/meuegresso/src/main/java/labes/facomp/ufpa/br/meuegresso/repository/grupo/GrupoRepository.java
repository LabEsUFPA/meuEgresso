package labes.facomp.ufpa.br.meuegresso.repository.grupo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;

/**
 * Interface utilizada para realizar a comunicação entre a aplicação é o banco
 * de dados.
 * Nota: O Spring Boot irá cuidar da implementação da mesma.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
public interface GrupoRepository extends CrudRepository<GrupoModel, Integer> {

	List<GrupoModel> findAll();

	Optional<GrupoModel> findByNomeGrupoIgnoreCase(String nomeGrupo);
	
}
