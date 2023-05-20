package labes.facomp.ufpa.br.meuegresso.service.anuncio.impl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.dto.anuncio.BuscaAnuncioDTO;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;
import labes.facomp.ufpa.br.meuegresso.model.AreaEmpregoModel;
import labes.facomp.ufpa.br.meuegresso.repository.anuncio.AnuncioRepository;
import labes.facomp.ufpa.br.meuegresso.repository.areaemprego.AreaEmpregoRepository;
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
    private final AreaEmpregoRepository areaEmpregoRepository;

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

    public List<AnuncioModel> findBySearch(BuscaAnuncioDTO busca) {
        List<AnuncioModel> anuncios = anuncioRepository.findAll();
        if (busca.getAreaEmprego().isEmpty()) {
            List<AreaEmpregoModel> areaEmprego = areaEmpregoRepository.findAll();
            List<Integer> idAreaEmprego = new ArrayList<>();
            for (AreaEmpregoModel area : areaEmprego) {
                idAreaEmprego.add(area.getId());
            }
            busca.setAreaEmprego(idAreaEmprego);
        }

        return anuncios.stream()
                .filter(anuncio -> LocalDate.now().isBefore(anuncio.getDataExpiracao()))
                .filter(anuncio -> anuncio.getTitulo().toLowerCase().contains(busca.getTitulo().toLowerCase()))
                .filter(anuncio -> anuncio.getSalario() >= busca.getMinValorSalario()
                        && anuncio.getSalario() <= busca.getMaxValorSalario())
                .filter(anuncio -> busca.getAreaEmprego().stream()
                        .anyMatch(area -> area.equals(anuncio.getAreaEmprego().getId())))
                .collect(Collectors.toList());
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
