package labes.facomp.ufpa.br.meuegresso.repository.statususuario;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.enumeration.UsuarioStatus;
import labes.facomp.ufpa.br.meuegresso.model.StatusUsuarioModel;

public interface StatusUsuarioRepository extends CrudRepository<StatusUsuarioModel, Integer> {


    @Query(value = """
            select a
            from
                status_usuario a
            where
                a.status in (:usuarioStatus)
                """)
    Page<StatusUsuarioModel> findBySearch(UsuarioStatus[] usuarioStatus, Pageable page);
}
