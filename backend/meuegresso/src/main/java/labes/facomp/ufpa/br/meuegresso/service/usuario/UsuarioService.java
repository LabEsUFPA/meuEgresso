package labes.facomp.ufpa.br.meuegresso.service.usuario;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
public interface UsuarioService extends UserDetailsService {

	/**
	 * Metodo responsavel por persistir determinado usuário no banco de dados.
	 *
	 * @param usuarioModel Dados do usuário
	 * @return Dados após serem gravados no banco de dados.
	 */
	public UsuarioModel save(UsuarioModel usuarioModel);

	/**
	 * Metodo responsavel por encontrar um determinado usuário por sua ID.
	 *
	 * @param idUsuario
	 * @return
	 */
	public UsuarioModel findById(Integer idUsuario);

	public List<UsuarioModel> findAll();

	public UsuarioModel loadUserByUsername(String username);

}
