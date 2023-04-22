package labes.facomp.ufpa.br.meuegresso.service.contribuicao.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.ContribuicaoModel;
import labes.facomp.ufpa.br.meuegresso.repository.contribuicao.ContribuicaoRepository;
import labes.facomp.ufpa.br.meuegresso.service.contribuicao.ContribuicaoService;
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
    public List<ContribuicaoModel> findAll() {
        return anuncioRepository.findAll();
    }

    @Override
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
    
}