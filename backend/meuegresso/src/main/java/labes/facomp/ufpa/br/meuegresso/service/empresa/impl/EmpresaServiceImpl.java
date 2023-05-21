package labes.facomp.ufpa.br.meuegresso.service.empresa.impl;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.repository.empresa.EmpresaRepository;
import labes.facomp.ufpa.br.meuegresso.service.empresa.EmpresaService;
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
public class EmpresaServiceImpl implements EmpresaService {

    private final EmpresaRepository empresaRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (empresaRepository.existsById(id)) {
            empresaRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<EmpresaModel> findAll(Sort sort) {
        return empresaRepository.findAll(sort);
    }

    @Override
    public EmpresaModel findById(Integer id) {
        return empresaRepository.findById(id).orElseThrow();
    }

    @Override
    public EmpresaModel save(EmpresaModel empresaModel) {
        return empresaRepository.save(empresaModel);
    }

    @Override
    public EmpresaModel update(EmpresaModel empresa) throws InvalidRequestException {
        if (empresa.getId() != null) {
            return empresaRepository.save(empresa);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
        return empresaRepository.existsByIdAndCreatedById(id, createdBy);
    }

    @Override
    public EmpresaModel findByNome(String nome) {
        return empresaRepository.findByNome(nome).orElse(null);
    }

    @Override
    public List<EmpresaModel> findByNomeContainsIgnoreCaseOrderByNomeAsc(String nome) {
        return empresaRepository.findByNomeContainsIgnoreCaseOrderByNomeAsc(nome);
    }

}
