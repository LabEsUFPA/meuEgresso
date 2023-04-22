package labes.facomp.ufpa.br.meuegresso.service.depoimento.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.DepoimentoModel;
import labes.facomp.ufpa.br.meuegresso.repository.depoimento.DepoimentoRepository;
import labes.facomp.ufpa.br.meuegresso.service.depoimento.DepoimentoService;
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
public class DepoimentoServiceImpl implements DepoimentoService {

    private final DepoimentoRepository depoimentoRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (depoimentoRepository.existsById(id)) {
            depoimentoRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<DepoimentoModel> findAll() {
        return depoimentoRepository.findAll();
    }

    @Override
    public DepoimentoModel findById(Integer id) {
        return depoimentoRepository.findById(id).orElseThrow();
    }

    @Override
    public DepoimentoModel save(DepoimentoModel depoimentoModel) {
        return depoimentoRepository.save(depoimentoModel);
    }

    @Override
    public DepoimentoModel update(DepoimentoModel depoimento) throws InvalidRequestException {
        if (depoimento.getId() != null) {
            return depoimentoRepository.save(depoimento);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
        return depoimentoRepository.existsByIdAndCreatedById(id, createdBy);
    }

}
