package labes.facomp.ufpa.br.meuegresso.service.usuario;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.userdetails.UserDetailsService;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso.EgressoDashDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.notificacao.NotificacaoDTO;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.exceptions.NotFoundException;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel, Camilo Santos
 * @since 26/03/2023
 * @version 1.0.1
 */
public interface UsuarioService extends UserDetailsService {

	/**
	 * Método responsável por persistir determinado usuário no banco de dados.
	 *
	 * @param usuarioModel Dados do usuário
	 * @return Dados após serem gravados no banco de dados.
	 */
	public UsuarioModel save(UsuarioModel usuarioModel);

	/**
	 * Método responsável por encontrar um determinado usuário por sua ID.
	 *
	 * @param idUsuario ID de um usuário
	 * @return
	 */
	public UsuarioModel findById(Integer idUsuario);

	/**
	 * Método responsável por encontrar todos os usuários cadastrados.
	 *
	 * @return Lista de objetos da classe UsuarioModel.
	 */
	public List<UsuarioModel> findAll();

	/**
	 * Método responsável por atualizar dados de um usuário cadastrado.
	 *
	 * @param usuario objeto usuário
	 * @return
	 */
	public UsuarioModel update(UsuarioModel usuario) throws InvalidRequestException;

	/**
	 * Método responsável por deletar um usuário cadastrado por sua ID.
	 *
	 * @param idUsuario ID de um usuário
	 */
	public boolean deleteById(Integer idUsuario);

	/**
	 * Método responsável por encontrar um determinado usuário por seu username.
	 *
	 */
	public UsuarioModel loadUserByUsername(String username);

	/**
	 * Método responsável por verificar se existe um determinado elemento.
	 *
	 * @param id
	 * @param createdBy
	 * @return
	 */
	public boolean existsByIdAndCreatedById(Integer id, Integer createdBy);

	public boolean existsByUsername(String username);

	/**
	 * Método responsável por encontrar todos os usuários com
	 * cadastro de egresso incompleto, ou seja, com EgressoModel vazio.
	 * A exceção são os usuários de grupo ADMIN e SECRETARIO, pois
	 * não são egressos.
	 *
	 * @return Lista de objetos da classe UsuarioModel.
	 * @author Bruno Eiki
	 */

	public Page<EgressoDashDTO> findBySearch(String nomeUsuario, String[] status, Integer page, Integer size,
			Direction direction);

	/**
	 * Método responsável por retornar um mapa com informações
	 * sobre status do cadastro dos usuários
	 *
	 * @author Eude Monteiro
	 * @return Uma lista de DTOs de notificação com informações sobre o nome do
	 *         usuário,
	 *         seu status de cadastro e data de modificação.
	 * @since 12/06/2023
	 */
	public Page<NotificacaoDTO> getStatus(String nome, String status, Integer page, Integer size,
			Direction direction);

	public boolean toggleValido(Integer id) throws NotFoundException;

	public boolean toggleAtivo(Integer id) throws NotFoundException;

}
