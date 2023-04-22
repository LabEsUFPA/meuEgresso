package labes.facomp.ufpa.br.meuegresso.service.titulacao.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.TitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.repository.titulacao.TitulacaoRepository;
import labes.facomp.ufpa.br.meuegresso.service.titulacao.TitulacaoService;
import lombok.RequiredArgsConstructor;

/**
 * Implementação.
 *
 * @author Alfredo Gabriel
 * @since 21/04/2023
 * @version 1.0
 */
@Service
@RequiredArgsConstructor
public class TitulacaoServiceImpl implements TitulacaoService {

    private final TitulacaoRepository titulacaoRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (titulacaoRepository.existsById(id)) {
            titulacaoRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<TitulacaoModel> findAll() {
        return titulacaoRepository.findAll();
    }

    @Override
    public TitulacaoModel findById(Integer id) {
        return titulacaoRepository.findById(id).orElseThrow();
    }

    @Override
    public TitulacaoModel save(TitulacaoModel titulacaoModel) {
        return titulacaoRepository.save(titulacaoModel);
    }

    @Override
    public TitulacaoModel update(TitulacaoModel titulacao) throws InvalidRequestException {
        if (titulacao.getId() != null) {
            return titulacaoRepository.save(titulacao);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
        return titulacaoRepository.existsByIdAndCreatedById(id, createdBy);
    }

}
