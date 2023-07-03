package labes.facomp.ufpa.br.meuegresso.service.egresso;

import java.util.Optional;

import labes.facomp.ufpa.br.meuegresso.exceptions.NotValidEgressoException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoValidoModel;

public interface EgressoValidoService {

    /**
	 * Método responsável por determinar se o egresso é válido.
	 *
	 * @param matricula
     * @param nome
     * @param email
     * @throws NotValidEgressoException
	 * @return {@link EgressoValidoModel}
	 */
    public EgressoValidoModel validarEgresso(Optional<String> matricula, Optional<String> nome, Optional<String> email)
            throws NotValidEgressoException;

}
