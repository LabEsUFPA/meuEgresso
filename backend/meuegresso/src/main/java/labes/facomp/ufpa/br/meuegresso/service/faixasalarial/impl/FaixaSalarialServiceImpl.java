package labes.facomp.ufpa.br.meuegresso.service.faixasalarial.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.FaixaSalarialModel;
import labes.facomp.ufpa.br.meuegresso.repository.faixasalarial.FaixaSalarialRepository;
import labes.facomp.ufpa.br.meuegresso.service.faixasalarial.FaixaSalarialService;
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
public class FaixaSalarialServiceImpl implements FaixaSalarialService {

    private final FaixaSalarialRepository faixaSalarialRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (faixaSalarialRepository.existsById(id)) {
            faixaSalarialRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<FaixaSalarialModel> findAll() {
        return faixaSalarialRepository.findAll();
    }

    @Override
    public FaixaSalarialModel findById(Integer id) {
        return faixaSalarialRepository.findById(id).orElseThrow();
    }

    @Override
    public FaixaSalarialModel save(FaixaSalarialModel faixaSalarialModel) {
        return faixaSalarialRepository.save(faixaSalarialModel);
    }

    @Override
    public FaixaSalarialModel update(FaixaSalarialModel faixaSalarial) throws InvalidRequestException {
        if (faixaSalarial.getId() != null) {
            return faixaSalarialRepository.save(faixaSalarial);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
        return faixaSalarialRepository.existsByIdAndCreatedById(id, createdBy);
    }

}
