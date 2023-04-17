package labes.facomp.ufpa.br.meuegresso.service.usuario.impl;

import java.util.List;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;
import lombok.RequiredArgsConstructor;

/**
 * Implementação do Serviço responsável pelas rotinas internas da aplicação referente ao usuário.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Service
@RequiredArgsConstructor
public class UsuarioServiceImpl implements UsuarioService {

	private final UsuarioRepository usuarioRepository;

	private final PasswordEncoder passwordEncoder;

	/**
	 * Metodo responsável por buscar um determinado usuário pelo seu username.
	 *
	 * @param authenticationRequest
	 * @return
	 * @author Alfredo Gabriel, Camilo Santos
	 * @since 16/04/2023
	 */
	@Override
	public UsuarioModel loadUserByUsername(String login) throws UsernameNotFoundException {
		return usuarioRepository.findByUsername(login).orElseThrow();
	}

	@Override
	public UsuarioModel findById(Integer idUsuario) {
		return usuarioRepository.findById(idUsuario).orElseThrow();
	}

	@Override
	public List<UsuarioModel> findAll() {
		return usuarioRepository.findAll();
	}

	public UsuarioModel save(UsuarioModel usuario) {
		usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
		return usuarioRepository.save(usuario);
	}

	public UsuarioModel update(UsuarioModel usuario) {
		if (usuario.getIdUsuario() != null) {
			return usuarioRepository.save(usuario);
		} 
		return null;
	}

	public void deleteById(Integer idUsuario) {
		if (usuarioRepository.findById(idUsuario) != null){
				usuarioRepository.deleteById(idUsuario);
		}
	}

}
