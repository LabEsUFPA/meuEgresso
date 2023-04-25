package labes.facomp.ufpa.br.meuegresso.service.etnia.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EtniaModel;
import labes.facomp.ufpa.br.meuegresso.repository.etnia.EtniaRepository;
import labes.facomp.ufpa.br.meuegresso.service.etnia.EtniaService;
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
public class EtniaServiceImpl implements EtniaService {

    private final EtniaRepository etniaRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (etniaRepository.existsById(id)) {
            etniaRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<EtniaModel> findAll() {
        return etniaRepository.findAll();
    }

    @Override
    public EtniaModel findById(Integer id) {
        return etniaRepository.findById(id).orElseThrow();
    }

    @Override
    public EtniaModel save(EtniaModel etniaModel) {
        return etniaRepository.save(etniaModel);
    }

    @Override
    public EtniaModel update(EtniaModel etnia) throws InvalidRequestException {
        if (etnia.getId() != null) {
            return etniaRepository.save(etnia);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
        return etniaRepository.existsByIdAndCreatedById(id, createdBy);
    }

}
