package labes.facomp.ufpa.br.meuegresso.service.anuncio.impl;

import java.time.LocalDate;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;
import labes.facomp.ufpa.br.meuegresso.repository.anuncio.AnuncioRepository;
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

    private static final String SORT_FIELD = "titulo";

    @Override
    public boolean deleteById(Integer id) {
        if (anuncioRepository.existsById(id)) {
            anuncioRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public Page<AnuncioModel> findAll(Integer page, Integer size, Direction direction) {
        return anuncioRepository.findAll(PageRequest.of(page, size, Sort.by(direction, SORT_FIELD)));
    }

    @Override
    @Transactional
    public Page<AnuncioModel> findBySearch(String tituloAnuncio, Integer[] areaEmpregoIds, Integer page, Integer size,
            Direction direction) {
        return anuncioRepository.findBySearch("%" + tituloAnuncio + "%",
                areaEmpregoIds, PageRequest.of(page, size, Sort.by(direction, SORT_FIELD)));
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

    @Override
    @Transactional
    public Page<AnuncioModel> findByDataExpiracaoAfter(LocalDate dataExpiracao, Integer page, Integer size,
            Direction direction) {
        return anuncioRepository.findByDataExpiracaoAfter(dataExpiracao,
                PageRequest.of(page, size, Sort.by(direction, SORT_FIELD)));
    }

}
