package labes.facomp.ufpa.br.meuegresso.service.usuario.impl;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;
import lombok.RequiredArgsConstructor;

/**
 * Implementação do Serviço responsável pelas rotinas internas da aplicação
 * referente ao usuário.
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
		try {
			return usuarioRepository.findByUsernameIgnoreCase(login).orElseThrow();
		} catch (NoSuchElementException e) {
			throw new UsernameNotFoundException("User not found", e);
		}
	}

	@Override
	public boolean existsByUsername(String username) {
		return usuarioRepository.existsByUsernameIgnoreCase(username);
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

	public UsuarioModel update(UsuarioModel usuario) throws InvalidRequestException {
		if (usuario.getId() != null) {
			usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
			return usuarioRepository.save(usuario);
		} else {
			throw new InvalidRequestException();
		}
	}

	public boolean deleteById(Integer idUsuario) {
		if (usuarioRepository.existsById(idUsuario)) {
			usuarioRepository.deleteById(idUsuario);
			return true;
		}
		return false;
	}

	@Override
	public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
		return usuarioRepository.existsByIdAndCreatedById(id, createdBy);
	}

	@Override
	public Page<UsuarioModel> findBySearch(String nomeUsuario, String nomeEmpresa, LocalDate minDate, LocalDate maxDate,
			Boolean ativo, String email, Integer page, Integer size, Direction direction) {
		return usuarioRepository.findBySearch("%" + nomeUsuario + "%", "%" + nomeEmpresa + "%", minDate, maxDate, ativo,
				"%" + email + "%", PageRequest.of(page, size, Sort.by(direction, "createdDate")));
	}

	public Map<String, LocalDate> findByCompleto(){
		Map<String, LocalDate> completos = new HashMap<>();
		usuarioRepository.findByCompleto().forEach(e -> {
			completos.put(e.get(0, String.class), e.get(1, LocalDate.class));
		});
		return completos;
	}

	public Map<String, LocalDate> findByIncompleto(){
		Map<String, LocalDate> incompletos = new HashMap<>();
		usuarioRepository.findByCompleto().forEach(e -> {
			incompletos.put(e.get(0, String.class), e.get(1, LocalDate.class));
		});
		return incompletos;
	}

	public Map<String, LocalDate> findByPendente(){
		Map<String, LocalDate> pendentes = new HashMap<>();
		usuarioRepository.findByCompleto().forEach(e -> {
			pendentes.put(e.get(0, String.class), e.get(1, LocalDate.class));
		});
		return pendentes;
	}

}
