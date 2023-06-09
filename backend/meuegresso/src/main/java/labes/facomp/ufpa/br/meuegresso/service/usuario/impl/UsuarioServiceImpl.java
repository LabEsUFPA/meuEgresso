package labes.facomp.ufpa.br.meuegresso.service.usuario.impl;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

import org.springframework.context.annotation.Primary;
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
import labes.facomp.ufpa.br.meuegresso.exceptions.NotFoundException;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.usuario.UsuarioRepository;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

/**
 * Implementação do Serviço responsável pelas rotinas internas da aplicação
 * referente ao usuário.
 *
 * @author Alfredo Gabriel
 * @since 26/03/2023
 * @version 1.0
 */
@Log4j2
@Primary
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
			log.error("User not found", e);
			throw new UsernameNotFoundException("User not found", e);
		}
	}

	@Override
	public boolean existsByUsername(String username) {
		return usuarioRepository.existsByUsernameIgnoreCase(username);
	}

	@Override
	public boolean existsByEmail(String email) {
		return usuarioRepository.existsByEmail(email);
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
	public UsuarioModel findByEmail(String email) {
		return usuarioRepository.findByEmailIgnoreCase(email, UsuarioModel.class).orElseThrow();
	}

	public boolean existsByIdAndCreatedBy(Integer id, Integer createdBy) {
		return usuarioRepository.existsByIdAndCreatedBy(id, createdBy);
	}

	@Override
	public Map<String, LocalDateTime> findByAtivo() {
		Map<String, LocalDateTime> emailData = new HashMap<>(2);
		usuarioRepository.findByEmailAndData().forEach(e -> emailData.put(e.get(0, String.class),
				LocalDateTime.ofInstant(e.get(1, Timestamp.class).toInstant(), ZoneId.systemDefault())));
		return emailData;
	}

	// PageRequest.of(page, size, Sort.by(direction, "u.created_date")
	@Override
	public Page<EgressoDashDTO> findBySearch(String nomeUsuario, String[] status, Integer page, Integer size,
			String ordenacao) {

		List<Tuple> tupla = usuarioRepository.findBySearch(nomeUsuario, status, ordenacao);

		List<EgressoDashDTO> dashDtos = tupla.stream()
				.map(t -> new EgressoDashDTO(
						t.get(0, Integer.class), // id
						t.get(1, Integer.class), // id do egresso
						t.get(2, String.class), // nome
						t.get(3, String.class), // nomeEmpresa
						t.get(4, String.class), // email
						t.get(5, Timestamp.class).toLocalDateTime().toLocalDate(), // createdDate
						t.get(6, String.class), // foto
						t.get(7, String.class))) // status
				.toList();

		Pageable paging = PageRequest.of(page, size);
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
						.dataModificacao(e.get(3, Timestamp.class).toLocalDateTime())
						.build()));

		Pageable paging = PageRequest.of(page, size, Sort.by(direction, "u.last_modified_date"));
		int start = Math.min((int) paging.getOffset(), notificacoes.size());
		int end = Math.min((start + paging.getPageSize()), notificacoes.size());

		return new PageImpl<>(notificacoes.subList(start, end), paging, notificacoes.size());
	}

	@Override
	public boolean toggleAtivo(Integer id) throws NotFoundException {
		if (!usuarioRepository.existsById(id)) {
			throw new NotFoundException();
		}
		UsuarioModel usuario = usuarioRepository.findById(id).orElseThrow();
		usuario.setAtivo(!usuario.getAtivo());
		usuarioRepository.save(usuario);
		return true;
	}

	@Override
	public boolean toggleValido(Integer id) throws NotFoundException {
		if (!usuarioRepository.existsById(id)) {
			throw new NotFoundException();
		}
		UsuarioModel usuario = usuarioRepository.findById(id).orElseThrow();
		usuario.setValido(!usuario.getValido());
		usuarioRepository.save(usuario);
		return true;
	}

	@Override
	public boolean existsById(Integer id) {
		return usuarioRepository.existsById(id);
	}

}
