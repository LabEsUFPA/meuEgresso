package labes.facomp.ufpa.br.meuegresso.service.statususuario;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;

import labes.facomp.ufpa.br.meuegresso.enumeration.UsuarioStatus;
import labes.facomp.ufpa.br.meuegresso.model.StatusUsuarioModel;

public interface StatusUsuarioService {

    public StatusUsuarioModel save(StatusUsuarioModel statusUsuarioModel);

    public Page<StatusUsuarioModel> findBySearch(UsuarioStatus[] status, Integer page, Integer size,
            Direction direction);
}
