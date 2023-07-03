package labes.facomp.ufpa.br.meuegresso.service.statususuario;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;

import labes.facomp.ufpa.br.meuegresso.enumeration.UsuarioStatus;
import labes.facomp.ufpa.br.meuegresso.model.StatusUsuarioModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel
 * @since 21/06/2023
 * @version 1.0
 */
public interface StatusUsuarioService {

    /**
	 * Método responsável por salvar o StatusUsuarioModel.
	 *
	 * @param statusUsuarioModel
	 * @return {@link StatusUsuarioModel}
	 */
    public StatusUsuarioModel save(StatusUsuarioModel statusUsuarioModel);

    /**
	 * Método responsável por salvar o StatusUsuarioModel.
	 *
	 * @param nome
     * @param status do tipo UsuarioStatus[]
     * @param page do tipo Integer
     * @param size
	 * @return {@link Page<StatusUsuarioModel>}
	 */
    public Page<StatusUsuarioModel> findBySearch(String nome, UsuarioStatus[] status, Integer page, Integer size,
            Direction direction);
}
