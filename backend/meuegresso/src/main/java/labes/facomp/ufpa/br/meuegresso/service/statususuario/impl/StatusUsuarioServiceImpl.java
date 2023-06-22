package labes.facomp.ufpa.br.meuegresso.service.statususuario.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.enumeration.UsuarioStatus;
import labes.facomp.ufpa.br.meuegresso.model.StatusUsuarioModel;
import labes.facomp.ufpa.br.meuegresso.repository.statususuario.StatusUsuarioRepository;
import labes.facomp.ufpa.br.meuegresso.service.statususuario.StatusUsuarioService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StatusUsuarioServiceImpl implements StatusUsuarioService {

    private final StatusUsuarioRepository statusUsuarioRepository;

    @Override
    public StatusUsuarioModel save(StatusUsuarioModel statusUsuarioModel) {
        return statusUsuarioRepository.save(statusUsuarioModel);
    }

    @Override
    public Page<StatusUsuarioModel> findBySearch(UsuarioStatus[] status, Integer page, Integer size,
            Direction direction) {
        return statusUsuarioRepository.findBySearch(status, PageRequest.of(page, size, direction, "mudanca"));
    }

}
