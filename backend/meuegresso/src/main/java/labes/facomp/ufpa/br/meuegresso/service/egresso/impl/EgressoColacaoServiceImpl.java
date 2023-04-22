package labes.facomp.ufpa.br.meuegresso.service.egresso.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoColacaoModelId;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoColacaoRepository;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoColacaoService;
import lombok.RequiredArgsConstructor;

/**
 * Interface responsável por especificar os metodos a serem implementados.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@Service
@RequiredArgsConstructor
public class EgressoColacaoServiceImpl implements EgressoColacaoService {
    
    private final EgressoColacaoRepository egressoColacaoRepository;

    @Override
    public boolean deleteById(EgressoColacaoModelId id) {
        if (egressoColacaoRepository.existsById(id)) {
            egressoColacaoRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<EgressoColacaoModel> findAll() {
        return egressoColacaoRepository.findAll();
    }

    @Override
    public EgressoColacaoModel findById(EgressoColacaoModelId id) {
        return egressoColacaoRepository.findById(id).orElseThrow();
    }

    @Override
    public EgressoColacaoModel save(EgressoColacaoModel egressoColacaoModel) {
        return egressoColacaoRepository.save(egressoColacaoModel);
    }

    @Override
    public EgressoColacaoModel update(EgressoColacaoModel egressoColacao) throws InvalidRequestException {
        if (egressoColacao.getId() != null) {
            return egressoColacaoRepository.save(egressoColacao);
        } else {
            throw new InvalidRequestException();
        }
    }  
    
}
