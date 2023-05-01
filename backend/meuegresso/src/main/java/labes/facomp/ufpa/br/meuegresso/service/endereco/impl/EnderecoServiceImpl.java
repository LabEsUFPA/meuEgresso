package labes.facomp.ufpa.br.meuegresso.service.endereco.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EnderecoModel;
import labes.facomp.ufpa.br.meuegresso.repository.endereco.EnderecoRepository;
import labes.facomp.ufpa.br.meuegresso.service.endereco.EnderecoService;
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
public class EnderecoServiceImpl implements EnderecoService {

    private final EnderecoRepository enderecoRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (enderecoRepository.existsById(id)) {
            enderecoRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<EnderecoModel> findAll() {
        return enderecoRepository.findAll();
    }

    @Override
    public EnderecoModel findById(Integer id) {
        return enderecoRepository.findById(id).orElseThrow();
    }

    @Override
    public EnderecoModel save(EnderecoModel enderecoModel) {
        return enderecoRepository.save(enderecoModel);
    }

    @Override
    public EnderecoModel update(EnderecoModel endereco) throws InvalidRequestException {
        if (endereco.getId() != null) {
            return enderecoRepository.save(endereco);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
        return enderecoRepository.existsByIdAndCreatedById(id, createdBy);
    }

    @Override
    public EnderecoModel findByCidadeAndEstadoAndPais(String cidade, String estado, String pais) {
        return enderecoRepository.findByCidadeIgnoreCaseAndEstadoIgnoreCaseAndPaisIgnoreCase(cidade, estado, pais).orElse(null);
    }

}
