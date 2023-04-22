package labes.facomp.ufpa.br.meuegresso.service.tipobolsa.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.TipoBolsaModel;
import labes.facomp.ufpa.br.meuegresso.repository.tipobolsa.TipoBolsaRepository;
import labes.facomp.ufpa.br.meuegresso.service.tipobolsa.TipoBolsaService;
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
public class TipoBolsaServiceImpl implements TipoBolsaService {

    private final TipoBolsaRepository tipoBolsaRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (tipoBolsaRepository.existsById(id)) {
            tipoBolsaRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<TipoBolsaModel> findAll() {
        return tipoBolsaRepository.findAll();
    }

    @Override
    public TipoBolsaModel findById(Integer id) {
        return tipoBolsaRepository.findById(id).orElseThrow();
    }

    @Override
    public TipoBolsaModel save(TipoBolsaModel tipoBolsaModel) {
        return tipoBolsaRepository.save(tipoBolsaModel);
    }

    @Override
    public TipoBolsaModel update(TipoBolsaModel tipoBolsa) throws InvalidRequestException {
        if (tipoBolsa.getId() != null) {
            return tipoBolsaRepository.save(tipoBolsa);
        } else {
            throw new InvalidRequestException();
        }
    }

}
