package labes.facomp.ufpa.br.meuegresso.service.egresso.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.NotValidEgressoException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoValidoModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoValidoRepository;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoValidoService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EgressoValidoServiceImpl implements EgressoValidoService {

    private final EgressoValidoRepository egressosValidosRepository;

    @Override
    public EgressoValidoModel validarEgresso(Optional<String> matricula, Optional<String> nome, Optional<String> email)
            throws NotValidEgressoException {
        if (matricula.isPresent()) {
            Optional<EgressoValidoModel> egressoValidoModel = findByMatricula(matricula.get());
            if (egressoValidoModel.isPresent()) {
                return egressoValidoModel.get();
            }
        }
        if (email.isPresent()) {
            Optional<EgressoValidoModel> egressoValidoModel = findByEmail(email.get());
            if (egressoValidoModel.isPresent()) {
                return egressoValidoModel.get();
            }
        }
        List<EgressoValidoModel> egressoValidoModels = findByNomeIgnoreCase(
                nome.orElseThrow(NotValidEgressoException::new));
        if (!egressoValidoModels.isEmpty()) {
            return egressoValidoModels.get(0);
        }
        throw new NotValidEgressoException();
    }

    private Optional<EgressoValidoModel> findByEmail(String email) {
        return egressosValidosRepository.findByEmailIgnoreCase(email);
    }

    private Optional<EgressoValidoModel> findByMatricula(String matricula) {
        return egressosValidosRepository.findByMatricula(matricula);
    }

    private List<EgressoValidoModel> findByNomeIgnoreCase(String nome) {
        return egressosValidosRepository.findByNomeIgnoreCase(nome);
    }

}
