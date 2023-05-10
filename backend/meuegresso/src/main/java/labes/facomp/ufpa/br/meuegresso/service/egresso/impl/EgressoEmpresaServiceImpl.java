package labes.facomp.ufpa.br.meuegresso.service.egresso.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.dto.egresso.EgressoMapaDTO;
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

    @Autowired
    private final ModelMapper modelMapper;

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

    private EgressoMapaDTO convertEntityToDto(EgressoEmpresaModel egressoEmpresaModel) {
        modelMapper.getConfiguration()
                .setMatchingStrategy(MatchingStrategies.LOOSE);
        return modelMapper.map(egressoEmpresaModel, EgressoMapaDTO.class);
    }

    public List<EgressoMapaDTO> findAllEgressoMapaDTO() {
        return egressoEmpresaRepository.findAll()
                .stream()
                .map(this::convertEntityToDto)
                .collect(Collectors.toList());
    }
}
