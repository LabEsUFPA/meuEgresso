package labes.facomp.ufpa.br.meuegresso.service.tipobolsa.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.TipoBolsaModel;
import labes.facomp.ufpa.br.meuegresso.repository.tipobolsa.TipoBolsaRepository;
import labes.facomp.ufpa.br.meuegresso.service.tipobolsa.TipoBolsaService;
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
	@Transactional
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

	@Override
	public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
		return tipoBolsaRepository.existsByIdAndCreatedById(id, createdBy);
	}

	@Override
	public Map<String, Integer> countEgressoForBolsa() {
		Map<String, Integer> contagem = new HashMap<>(7);
		tipoBolsaRepository.countEgressoForBolsa().stream()
				.forEach(e -> contagem.put(e.get(0, String.class), e.get(1, Long.class).intValue()));
		return contagem;
	}

}
