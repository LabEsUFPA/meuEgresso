package labes.facomp.ufpa.br.meuegresso.service.pesquisacientifica.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.PesquisaCientificaModel;
import labes.facomp.ufpa.br.meuegresso.repository.pesquisacientifica.PesquisaCientificaRepository;
import labes.facomp.ufpa.br.meuegresso.service.pesquisacientifica.PesquisaCientificaService;
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
public class PesquisaCientificaServiceImpl implements PesquisaCientificaService {

    private final PesquisaCientificaRepository pesquisaCientificaRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (pesquisaCientificaRepository.existsById(id)) {
            pesquisaCientificaRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<PesquisaCientificaModel> findAll() {
        return pesquisaCientificaRepository.findAll();
    }

    @Override
    public PesquisaCientificaModel findById(Integer id) {
        return pesquisaCientificaRepository.findById(id).orElseThrow();
    }

    @Override
    public PesquisaCientificaModel save(PesquisaCientificaModel pesquisaCientificaModel) {
        return pesquisaCientificaRepository.save(pesquisaCientificaModel);
    }

    @Override
    public PesquisaCientificaModel update(PesquisaCientificaModel pesquisaCientifica) throws InvalidRequestException {
        if (pesquisaCientifica.getId() != null) {
            return pesquisaCientificaRepository.save(pesquisaCientifica);
        } else {
            throw new InvalidRequestException();
        }
    }

}
