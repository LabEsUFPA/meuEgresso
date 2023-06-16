package labes.facomp.ufpa.br.meuegresso.service.egresso.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.EmpresaGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoEmpresaModelId;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoEmpresaRepository;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoEmpresaService;
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
public class EgressoEmpresaServiceImpl implements EgressoEmpresaService {

    private final EgressoEmpresaRepository egressoEmpresaRepository;

    @Override
    public boolean deleteById(EgressoEmpresaModelId id) {
        if (egressoEmpresaRepository.existsById(id)) {
            egressoEmpresaRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<EgressoEmpresaModel> findAll() {
        return egressoEmpresaRepository.findAll();
    }

    @Override
    public EgressoEmpresaModel findById(EgressoEmpresaModelId id) {
        return egressoEmpresaRepository.findById(id).orElseThrow();
    }

    @Override
    public EgressoEmpresaModel save(EgressoEmpresaModel egressoEmpresaModel) {
        return egressoEmpresaRepository.save(egressoEmpresaModel);
    }

    @Override
    public EgressoEmpresaModel update(EgressoEmpresaModel egressoEmpresa) throws InvalidRequestException {
        if (egressoEmpresa.getId() != null) {
            return egressoEmpresaRepository.save(egressoEmpresa);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(EgressoEmpresaModelId id, Integer createdBy) {
        return egressoEmpresaRepository.existsByIdAndCreatedById(id, createdBy);
    }

    public List<EgressoEmpresaModel> findAllEgressoMapa() {
        return egressoEmpresaRepository.findAll();
    }

    @Override
    public List<EmpresaGraficoDTO> countEgressoByEmpresas() {
        return egressoEmpresaRepository.countEgressoByEmpresas();
    }

    
}
