package labes.facomp.ufpa.br.meuegresso.service.empresa.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EmpresaModel;
import labes.facomp.ufpa.br.meuegresso.repository.empresa.EmpresaRepository;
import labes.facomp.ufpa.br.meuegresso.service.empresa.EmpresaService;
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
    public List<EmpresaModel> findAll() {
        return empresaRepository.findAll();
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
    
}