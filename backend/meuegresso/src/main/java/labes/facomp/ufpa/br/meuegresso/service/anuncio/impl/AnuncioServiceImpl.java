package labes.facomp.ufpa.br.meuegresso.service.anuncio.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;
import labes.facomp.ufpa.br.meuegresso.repository.anuncio.AnuncioRepository;
import labes.facomp.ufpa.br.meuegresso.service.anuncio.AnuncioService;
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
public class AnuncioServiceImpl implements AnuncioService {

    private final AnuncioRepository anuncioRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (anuncioRepository.existsById(id)) {
            anuncioRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<AnuncioModel> findAll() {
        return anuncioRepository.findAll();
    }

    @Override
    public AnuncioModel findById(Integer id) {
        return anuncioRepository.findById(id).orElseThrow();
    }

    @Override
    public AnuncioModel save(AnuncioModel anuncioModel) {
        return anuncioRepository.save(anuncioModel);
    }

    @Override
    public AnuncioModel update(AnuncioModel anuncio) throws InvalidRequestException {
        if (anuncio.getId() != null) {
            return anuncioRepository.save(anuncio);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
        return anuncioRepository.existsByIdAndCreatedById(id, createdBy);
    }

}
