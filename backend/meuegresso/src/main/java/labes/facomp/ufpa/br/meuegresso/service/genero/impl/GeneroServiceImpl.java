package labes.facomp.ufpa.br.meuegresso.service.genero.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.GeneroModel;
import labes.facomp.ufpa.br.meuegresso.repository.genero.GeneroRepository;
import labes.facomp.ufpa.br.meuegresso.service.genero.GeneroService;
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
public class GeneroServiceImpl implements GeneroService {

    private final GeneroRepository generoRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (generoRepository.existsById(id)) {
            generoRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<GeneroModel> findAll() {
        return generoRepository.findAll();
    }

    @Override
    public GeneroModel findById(Integer id) {
        return generoRepository.findById(id).orElseThrow();
    }

    @Override
    public GeneroModel save(GeneroModel generoModel) {
        return generoRepository.save(generoModel);
    }

    @Override
    public GeneroModel update(GeneroModel genero) throws InvalidRequestException {
        if (genero.getId() != null) {
            return generoRepository.save(genero);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
        return generoRepository.existsByIdAndCreatedById(id, createdBy);
    }

}
