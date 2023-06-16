package labes.facomp.ufpa.br.meuegresso.service.usuario.impl;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso.EgressoDashDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.notificacao.NotificacaoDTO;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
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
	public Page<EgressoDashDTO> findBySearch(String nomeUsuario, String nomeEmpresa, LocalDate dateMin,
			LocalDate dateMax, String status, String email, Integer page, Integer size, Direction direction) {
		return usuarioRepository.findBySearch(nomeUsuario, nomeEmpresa, dateMin.atStartOfDay(),
				dateMax.atTime(LocalTime.MAX), status, email,
				PageRequest.of(page, size, Sort.by(direction, "u.created_date")));
	}

	public List<NotificacaoDTO> getStatus() {
		List<NotificacaoDTO> notificacoes = new ArrayList<>();

		usuarioRepository.getStatus().forEach(e -> notificacoes.add(
				NotificacaoDTO.builder()
						.nome(e.get(0, String.class))
						.usuarioId(e.get(1, Integer.class))
						.status(e.get(2, String.class))
						.data(e.get(3, LocalDate.class))
						.build()));

		return notificacoes;
	}

}
