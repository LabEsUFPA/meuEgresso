package labes.facomp.ufpa.br.meuegresso.service.usuario.impl;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.persistence.Tuple;
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

	// PageRequest.of(page, size, Sort.by(direction, "u.created_date")
	@Override
	public Page<EgressoDashDTO> findBySearch(String nomeUsuario, String nomeEmpresa, LocalDate dateMin,
			LocalDate dateMax, String status, String email, Integer page, Integer size, Direction direction) {

		List<Tuple> tupla = usuarioRepository.findBySearch(nomeUsuario, nomeEmpresa, dateMin.atStartOfDay(),
				dateMax.atTime(LocalTime.MAX), status, email);

		List<EgressoDashDTO> dashDtos = tupla.stream()
				.map(t -> new EgressoDashDTO(
						t.get(0, Integer.class), // id usuario
						t.get(1, Integer.class), // id egresso
						t.get(2, String.class), // nome
						t.get(3, String.class), // nomeEmpresa
						t.get(4, String.class), // email
						t.get(5, Timestamp.class).toLocalDateTime().toLocalDate(), // createdDate
						t.get(6, String.class), // foto
						t.get(7, String.class))) // status
				.collect(Collectors.toList());

		Pageable paging = PageRequest.of(page, size, Sort.by(direction, "u.created_date"));
		int start = Math.min((int) paging.getOffset(), dashDtos.size());
		int end = Math.min((start + paging.getPageSize()), dashDtos.size());

		return new PageImpl<>(dashDtos.subList(start, end), paging, dashDtos.size());
	}

	public Page<NotificacaoDTO> getStatus(String nome, String status, Integer page, Integer size, Direction direction) {
		List<NotificacaoDTO> notificacoes = new ArrayList<>();

		usuarioRepository.getStatus(nome, status).forEach(e -> notificacoes.add(
				NotificacaoDTO.builder()
						.nome(e.get(0, String.class))
						.usuarioId(e.get(1, Integer.class))
						.status(e.get(2, String.class))
						.dataModificacao(e.get(3, Timestamp.class).toLocalDateTime().toLocalDate())
						.build()));

		Pageable paging = PageRequest.of(page, size, Sort.by(direction, "u.last_modified_date"));
		int start = Math.min((int) paging.getOffset(), notificacoes.size());
		int end = Math.min((start + paging.getPageSize()), notificacoes.size());

		return new PageImpl<>(notificacoes.subList(start, end), paging, notificacoes.size());
	}

}
