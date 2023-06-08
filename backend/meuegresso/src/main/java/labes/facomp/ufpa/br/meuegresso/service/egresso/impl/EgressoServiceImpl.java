package labes.facomp.ufpa.br.meuegresso.service.egresso.impl;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.transaction.Transactional;
import labes.facomp.ufpa.br.meuegresso.exceptions.NotFoundFotoEgressoException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import lombok.RequiredArgsConstructor;

/**
 * Implementação do Serviço responsável pelas rotinas internas da aplicação
 * referente ao egresso.
 *
 * @author Joao Paulo
 * @since 16/04/2023
 * @version 1.0
 */
@Service
@RequiredArgsConstructor
public class EgressoServiceImpl implements EgressoService {

	private final EgressoRepository egressoRepository;

	@Value("${fotosDir}")
	private String uploadDirectory;

	@Override
	public EgressoModel adicionarEgresso(EgressoModel egressoModel) {
		return egressoRepository.save(egressoModel);
	}

	@Override
	@Transactional
	public EgressoModel findByUsuarioId(Integer idUsuario) {
		return egressoRepository.findByUsuarioId(idUsuario).orElseThrow();
	}

	@Override
	public EgressoModel findById(Integer idEgresso) {
		return egressoRepository.findById(idEgresso).orElseThrow();
	}

	@Override
	public List<EgressoModel> findAll() {
		return egressoRepository.findAll();
	}

	/**
	 *
	 *
	 *
	 * @return idades após serem calculadas com base nas datas de nascimento.
	 * @author Pedro Inácio
	 * @since 19/05/2023
	 */
	@Override
	public List<Integer> findAllIdades() {
		List<EgressoModel> lista = egressoRepository.findAll();
		List<Integer> idades = new ArrayList<>();
		for (int i = 0; i < lista.size(); i++) {
			idades.add(Period.between(lista.get(i).getNascimento(), LocalDate.now()).getYears());
		}
		return idades;
	}

	/**
	 *
	 *
	 * @param egresso Dados do egresso
	 * @return Dados após serem gravados no banco de dados.
	 * @author Pedro Inácio
	 * @since 16/04/2023
	 */
	@Override
	@Transactional
	public EgressoModel updateEgresso(EgressoModel egresso) {
		if (egresso.getId() != null) {
			return egressoRepository.save(egresso);
		}
		return null;
	}

	@Override
	public void deleteById(Integer id) {
		egressoRepository.deleteById(id);

	}

	@Override
	public boolean deletarEgresso(EgressoModel egresso) {
		if (egressoRepository.existsById(egresso.getId())) {
			egressoRepository.deleteById(egresso.getId());
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean existsById(Integer id) {
		return egressoRepository.existsById(id);
	}

	@Override
	public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
		return egressoRepository.existsByIdAndCreatedById(id, createdBy);
	}

	@Override
	public Resource getFileAsResource(String fotoNomeString) throws NotFoundFotoEgressoException {

		Path file = Paths.get(String.format("%s%s", uploadDirectory + "/", fotoNomeString));
		try {
			return new UrlResource(file.toUri());
		} catch (MalformedURLException e) {
			throw new NotFoundFotoEgressoException();
		}

	}

	@Override
	public void deleteFile(String fotoNomeString) throws IOException {
		Path file = Paths.get(String.format("%s%s", uploadDirectory + "/", fotoNomeString));
		Files.deleteIfExists(file);
	}

	@Override
	public void saveFoto(String nomeFoto, MultipartFile arquivo) throws IOException {
		Path uploadPath = Paths.get(uploadDirectory);

		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}

		try (InputStream inputStream = arquivo.getInputStream()) {
			Path filePath = uploadPath.resolve(nomeFoto);
			Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException ioe) {
			throw new IOException("Could not save file: " + arquivo.getOriginalFilename(), ioe);
		}
	}

	@Override
	public Map<Integer, Integer> countAgeFromEgressos() {
		Map<Integer, Integer> countIdades = new HashMap<>();
		egressoRepository.countAgeFromEgressos().stream().forEach(e -> {
			countIdades.put(e.get(0, BigDecimal.class).intValue(), e.get(1, Long.class).intValue());
		});
		return countIdades;
	}

	@Override
	public Map<String, Integer> countFezPos() {
		Map<String, Integer> contagem = new HashMap<>(2);
		final String fez = "Fez", naoFez = "Não fez";
		egressoRepository.countFezPos().forEach((e) -> {
			if (e.get(0, Boolean.class)) {
				contagem.put(fez, e.get(1, Long.class).intValue());
			} else {
				contagem.put(naoFez, e.get(1, Long.class).intValue());
			}
		});
		return contagem;
	}

	@Override
	public Map<String, Integer> countBolsista() {
		Map<String, Integer> contagem = new HashMap<>(2);
		final String bolsistas = "Bolsistas", naoBolsistas = "Não Bolsistas";
		egressoRepository.countBolsista().forEach((e) -> {
			if (e.get(0, Boolean.class)) {
				contagem.put(bolsistas, e.get(1, Long.class).intValue());
			} else {
				contagem.put(naoBolsistas, e.get(1, Long.class).intValue());
			}
		});
		return contagem;
	}

	@Override
	public Map<Double, Integer> countRemuneracaoBolsa() {
		Map<Double, Integer> contagem = new HashMap<>(12);
		egressoRepository.countRemuneracaoBolsa().stream()
				.forEach(e -> contagem.put(e.get(0, Double.class), e.get(1, Long.class).intValue()));
		return contagem;
	}

	@Override
	public Map<String, Integer> countCotista() {
		Map<String, Integer> contagem = new HashMap<>(2);
		final String cotista = "Cotista", naoCotista = "Não Cotista";
		egressoRepository.countCotista().forEach((e) -> {
			if (e.get(0, Boolean.class)) {
				contagem.put(cotista, e.get(1, Long.class).intValue());
			} else {
				contagem.put(naoCotista, e.get(1, Long.class).intValue());
			}
		});
		return contagem;
	}

	@Override
	public Map<String, Integer> countInteressePos() {
		Map<String, Integer> contagem = new HashMap<>(2);
		final String sim = "Sim", nao = "Não";
		egressoRepository.countInteressePos().forEach((e) -> {
			if (e.get(0, Boolean.class)) {
				contagem.put(sim, e.get(1, Long.class).intValue());
			} else {
				contagem.put(nao, e.get(1, Long.class).intValue());
			}
		});
		if (!contagem.containsKey(sim)) {
			contagem.put(sim, 0);
		}
		if (!contagem.containsKey(nao)) {
			contagem.put(nao, 0);
		}
		return contagem;
	}
}
