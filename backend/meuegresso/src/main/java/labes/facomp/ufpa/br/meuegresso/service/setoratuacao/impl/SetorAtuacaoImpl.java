package labes.facomp.ufpa.br.meuegresso.service.setoratuacao.impl;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.SetorAtuacaoModel;
import labes.facomp.ufpa.br.meuegresso.repository.setoratuacao.SetorAtuacaoRepository;
import labes.facomp.ufpa.br.meuegresso.service.setoratuacao.SetorAtuacaoService;
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
public class SetorAtuacaoImpl implements SetorAtuacaoService {

    private final SetorAtuacaoRepository setorAtuacaoRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (setorAtuacaoRepository.existsById(id)) {
            setorAtuacaoRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<SetorAtuacaoModel> findAll() {
        return setorAtuacaoRepository.findAll();
    }

    @Override
    public SetorAtuacaoModel findById(Integer id) {
        return setorAtuacaoRepository.findById(id).orElseThrow();
    }

    @Override
    public SetorAtuacaoModel save(SetorAtuacaoModel setorAtuacaoModel) {
        return setorAtuacaoRepository.save(setorAtuacaoModel);
    }

    @Override
    public SetorAtuacaoModel update(SetorAtuacaoModel setorAtuacao) throws InvalidRequestException {
        if (setorAtuacao.getId() != null) {
            return setorAtuacaoRepository.save(setorAtuacao);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public SetorAtuacaoModel findByNome(String nome) {
        return setorAtuacaoRepository.findByNomeIgnoreCase(nome).orElse(null);
    }

}
