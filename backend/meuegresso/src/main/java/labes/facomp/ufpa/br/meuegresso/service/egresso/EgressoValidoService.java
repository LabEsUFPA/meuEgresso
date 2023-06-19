package labes.facomp.ufpa.br.meuegresso.service.egresso;

import java.util.Optional;

import labes.facomp.ufpa.br.meuegresso.exceptions.NotValidEgressoException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoValidoModel;

public interface EgressoValidoService {

    public EgressoValidoModel validarEgresso(Optional<String> matricula, Optional<String> nome, Optional<String> email)
            throws NotValidEgressoException;

}
