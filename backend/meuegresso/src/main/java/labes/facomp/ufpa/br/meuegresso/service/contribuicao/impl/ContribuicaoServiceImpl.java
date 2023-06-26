package labes.facomp.ufpa.br.meuegresso.service.contribuicao.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
import labes.facomp.ufpa.br.meuegresso.repository.contribuicao.ContribuicaoRepository;
import labes.facomp.ufpa.br.meuegresso.service.contribuicao.ContribuicaoService;
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
public class ContribuicaoServiceImpl implements ContribuicaoService {

    private final ContribuicaoRepository anuncioRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (anuncioRepository.existsById(id)) {
            anuncioRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    @Transactional
    public List<ContribuicaoModel> findAll() {
        return anuncioRepository.findAll();
    }

    @Override
    @Transactional
    public ContribuicaoModel findById(Integer id) {
        return anuncioRepository.findById(id).orElseThrow();
    }

    @Override
    public ContribuicaoModel save(ContribuicaoModel anuncioModel) {
        return anuncioRepository.save(anuncioModel);
    }

    @Override
    public ContribuicaoModel update(ContribuicaoModel anuncio) throws InvalidRequestException {
        if (anuncio.getId() != null) {
            return anuncioRepository.save(anuncio);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedBy(Integer id, Integer createdBy) {
        return anuncioRepository.existsByIdAndCreatedBy(id, createdBy);
    }

    @Override
    @Transactional
    public ContribuicaoModel findByEgressoId(Integer idEgresso) {
        return anuncioRepository.findByEgressoId(idEgresso).orElseThrow();
    }

    @Override
    @Transactional
    public ContribuicaoModel findByEgressoUsuarioId(Integer idUsuario) {
        return anuncioRepository.findByEgressoUsuarioId(idUsuario).orElseThrow();
    }

}
