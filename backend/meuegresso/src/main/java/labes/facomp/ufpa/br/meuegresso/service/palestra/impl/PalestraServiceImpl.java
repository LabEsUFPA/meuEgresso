package labes.facomp.ufpa.br.meuegresso.service.palestra.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.PalestraModel;
import labes.facomp.ufpa.br.meuegresso.repository.palestra.PalestraRepository;
import labes.facomp.ufpa.br.meuegresso.service.palestra.PalestraService;
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
public class PalestraServiceImpl implements PalestraService {

    private final PalestraRepository palestraRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (palestraRepository.existsById(id)) {
            palestraRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    @Transactional
    public List<PalestraModel> findAll() {
        return palestraRepository.findAll();
    }

    @Override
    @Transactional
    public PalestraModel findById(Integer id) {
        return palestraRepository.findById(id).orElseThrow();
    }

    @Override
    @Transactional
    public PalestraModel save(PalestraModel palestraModel) {
        return palestraRepository.save(palestraModel);
    }

    @Override
    @Transactional
    public PalestraModel update(PalestraModel palestra) throws InvalidRequestException {
        if (palestra.getId() != null) {
            return palestraRepository.save(palestra);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(Integer id, Integer egressoId) {
        return palestraRepository.existsByIdAndCreatedById(id, egressoId);
    }

    @Override
    @Transactional
    public PalestraModel findByEgressoId(Integer idEgresso) {
        return palestraRepository.findByEgressoId(idEgresso).orElseThrow();
    }

    @Override
    @Transactional
    public PalestraModel findByEgressoUsuarioId(Integer idUsuario) {
        return palestraRepository.findByEgressoUsuarioId(idUsuario).orElseThrow();
    }


}
