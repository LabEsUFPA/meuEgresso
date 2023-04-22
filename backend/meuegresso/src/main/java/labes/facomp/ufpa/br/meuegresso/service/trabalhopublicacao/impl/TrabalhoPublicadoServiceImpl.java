package labes.facomp.ufpa.br.meuegresso.service.trabalhopublicacao.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.TrabalhoPublicadoModel;
import labes.facomp.ufpa.br.meuegresso.repository.trabalhopublicacao.TrabalhoPublicadoRepository;
import labes.facomp.ufpa.br.meuegresso.service.trabalhopublicacao.TrabalhoPublicadoService;
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
public class TrabalhoPublicadoServiceImpl implements TrabalhoPublicadoService {

    private final TrabalhoPublicadoRepository trabalhoPublicadoRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (trabalhoPublicadoRepository.existsById(id)) {
            trabalhoPublicadoRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<TrabalhoPublicadoModel> findAll() {
        return trabalhoPublicadoRepository.findAll();
    }

    @Override
    public TrabalhoPublicadoModel findById(Integer id) {
        return trabalhoPublicadoRepository.findById(id).orElseThrow();
    }

    @Override
    public TrabalhoPublicadoModel save(TrabalhoPublicadoModel trabalhoPublicadoModel) {
        return trabalhoPublicadoRepository.save(trabalhoPublicadoModel);
    }

    @Override
    public TrabalhoPublicadoModel update(TrabalhoPublicadoModel trabalhoPublicado) throws InvalidRequestException {
        if (trabalhoPublicado.getId() != null) {
            return trabalhoPublicadoRepository.save(trabalhoPublicado);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
        return trabalhoPublicadoRepository.existsByIdAndCreatedById(id, createdBy);
    }

}
