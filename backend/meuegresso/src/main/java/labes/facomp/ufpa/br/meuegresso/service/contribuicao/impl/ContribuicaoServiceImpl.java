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

    private final ContribuicaoRepository contribuicaoRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (contribuicaoRepository.existsById(id)) {
            contribuicaoRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    @Transactional
    public List<ContribuicaoModel> findAll() {
        return contribuicaoRepository.findAll();
    }

    @Override
    @Transactional
    public ContribuicaoModel findById(Integer id) {
        return contribuicaoRepository.findById(id).orElseThrow();
    }

    @Override
    public ContribuicaoModel save(ContribuicaoModel anuncioModel) {
        return contribuicaoRepository.save(anuncioModel);
    }

    @Override
    public ContribuicaoModel update(ContribuicaoModel anuncio) throws InvalidRequestException {
        if (anuncio.getId() != null) {
            return contribuicaoRepository.save(anuncio);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
        return contribuicaoRepository.existsByIdAndCreatedById(id, createdBy);
    }

    @Override
    @Transactional
    public ContribuicaoModel findByEgressoId(Integer idEgresso) {
        return contribuicaoRepository.findByEgressoId(idEgresso).orElseThrow();
    }

    @Override
    @Transactional
    public ContribuicaoModel findByEgressoUsuarioId(Integer idUsuario) {
        return contribuicaoRepository.findByEgressoUsuarioId(idUsuario).orElseThrow();
    }

}
