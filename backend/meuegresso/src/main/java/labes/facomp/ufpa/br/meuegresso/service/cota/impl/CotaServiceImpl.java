package labes.facomp.ufpa.br.meuegresso.service.cota.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.CotaModel;
import labes.facomp.ufpa.br.meuegresso.repository.cota.CotaRepository;
import labes.facomp.ufpa.br.meuegresso.service.cota.CotaService;
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
public class CotaServiceImpl implements CotaService {

    private final CotaRepository cotaRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (cotaRepository.existsById(id)) {
            cotaRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<CotaModel> findAll() {
        return cotaRepository.findAll();
    }

    @Override
    public CotaModel findById(Integer id) {
        return cotaRepository.findById(id).orElseThrow();
    }

    @Override
    public CotaModel save(CotaModel cotaModel) {
        return cotaRepository.save(cotaModel);
    }

    @Override
    public CotaModel update(CotaModel cota) throws InvalidRequestException {
        if (cota.getId() != null) {
            return cotaRepository.save(cota);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
        return cotaRepository.existsByIdAndCreatedById(id, createdBy);
    }

    @Override
    public Map<String, Integer> countEgressoByCota() {
        Map<String, Integer> contagem = new HashMap<>(9);
        cotaRepository.countEgressoByCota().stream()
                .forEach(e -> contagem.put(e.get(0, String.class), e.get(1, Long.class).intValue()));
        return contagem;
    }


}
