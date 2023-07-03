package labes.facomp.ufpa.br.meuegresso.service.areaemprego.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AreaEmpregoModel;
import labes.facomp.ufpa.br.meuegresso.repository.areaemprego.AreaEmpregoRepository;
import labes.facomp.ufpa.br.meuegresso.service.areaemprego.AreaEmpregoService;
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
public class AreaEmpregoImpl implements AreaEmpregoService {

    private final AreaEmpregoRepository areaEmpregoRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (areaEmpregoRepository.existsById(id)) {
            areaEmpregoRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<AreaEmpregoModel> findAll() {
        return areaEmpregoRepository.findAll();
    }

    @Override
    public AreaEmpregoModel findById(Integer id) {
        return areaEmpregoRepository.findById(id).orElseThrow();
    }

    @Override
    public AreaEmpregoModel save(AreaEmpregoModel areaEmpregoModel) {
        return areaEmpregoRepository.save(areaEmpregoModel);
    }

    @Override
    public AreaEmpregoModel update(AreaEmpregoModel areaAtuacao) throws InvalidRequestException {
        if (areaAtuacao.getId() != null) {
            return areaEmpregoRepository.save(areaAtuacao);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public AreaEmpregoModel findByNome(String nome) {
        return areaEmpregoRepository.findByNomeIgnoreCase(nome).orElse(null);
    }

    @Override
    public boolean existsByIdAndCreatedBy(Integer id, Integer createdBy) {
        return areaEmpregoRepository.existsByIdAndCreatedBy(id, createdBy);
    }

}
