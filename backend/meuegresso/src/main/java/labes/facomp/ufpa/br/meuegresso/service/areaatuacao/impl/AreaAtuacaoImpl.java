package labes.facomp.ufpa.br.meuegresso.service.areaatuacao.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.AreaAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.repository.areaatuacao.AreaAtuacaoRepository;
import labes.facomp.ufpa.br.meuegresso.service.areaatuacao.AreaAtuacaoService;
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
public class AreaAtuacaoImpl implements AreaAtuacaoService {

    private final AreaAtuacaoRepository areaAtuacaoRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (areaAtuacaoRepository.existsById(id)) {
            areaAtuacaoRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<AreaAtuacaoModel> findAll() {
        return areaAtuacaoRepository.findAll();
    }

    @Override
    public AreaAtuacaoModel findById(Integer id) {
        return areaAtuacaoRepository.findById(id).orElseThrow();
    }

    @Override
    public AreaAtuacaoModel save(AreaAtuacaoModel areaAtuacaoModel) {
        return areaAtuacaoRepository.save(areaAtuacaoModel);
    }

    @Override
    public AreaAtuacaoModel update(AreaAtuacaoModel areaAtuacao) throws InvalidRequestException {
        if (areaAtuacao.getId() != null) {
            return areaAtuacaoRepository.save(areaAtuacao);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public AreaAtuacaoModel findByNome(String nome) {
        return areaAtuacaoRepository.findByNomeIgnoreCase(nome).orElse(null);
    }

}
