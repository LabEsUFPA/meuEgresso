package labes.facomp.ufpa.br.meuegresso.service.egresso.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;
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
    public boolean deleteById(EgressoTitulacaoModelId id) {
        if (egressoColacaoRepository.existsById(id)) {
            egressoColacaoRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<EgressoTitulacaoModel> findAll() {
        return egressoColacaoRepository.findAll();
    }

    @Override
    public EgressoTitulacaoModel findById(EgressoTitulacaoModelId id) {
        return egressoColacaoRepository.findById(id).orElseThrow();
    }

    @Override
    public EgressoTitulacaoModel save(EgressoTitulacaoModel egressoColacaoModel) {
        return egressoColacaoRepository.save(egressoColacaoModel);
    }

    @Override
    public EgressoTitulacaoModel update(EgressoTitulacaoModel egressoColacao) throws InvalidRequestException {
        if (egressoColacao.getId() != null) {
            return egressoColacaoRepository.save(egressoColacao);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(EgressoTitulacaoModelId id, Integer createdBy) {
        return egressoColacaoRepository.existsByIdAndCreatedById(id, createdBy);
    }

}
