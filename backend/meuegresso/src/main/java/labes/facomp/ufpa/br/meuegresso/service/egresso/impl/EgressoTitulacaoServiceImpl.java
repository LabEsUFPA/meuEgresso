package labes.facomp.ufpa.br.meuegresso.service.egresso.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.dto.grafico.LocalPosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModel;
import labes.facomp.ufpa.br.meuegresso.model.EgressoTitulacaoModelId;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoTitulacaoRepository;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoTitulacaoService;
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
public class EgressoTitulacaoServiceImpl implements EgressoTitulacaoService {

    private final EgressoTitulacaoRepository egressoTitulacaoRepository;

    @Override
    public boolean deleteById(EgressoTitulacaoModelId id) {
        if (egressoTitulacaoRepository.existsById(id)) {
            egressoTitulacaoRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<EgressoTitulacaoModel> findAll() {
        return egressoTitulacaoRepository.findAll();
    }

    @Override
    public EgressoTitulacaoModel findById(EgressoTitulacaoModelId id) {
        return egressoTitulacaoRepository.findById(id).orElseThrow();
    }

    @Override
    public EgressoTitulacaoModel save(EgressoTitulacaoModel egressoTitulacaoModel) {
        return egressoTitulacaoRepository.save(egressoTitulacaoModel);
    }

    @Override
    public EgressoTitulacaoModel update(EgressoTitulacaoModel egressoTitulacao) throws InvalidRequestException {
        if (egressoTitulacao.getId() != null) {
            return egressoTitulacaoRepository.save(egressoTitulacao);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(EgressoTitulacaoModelId id, Integer createdBy) {
        return egressoTitulacaoRepository.existsByIdAndCreatedById(id, createdBy);
    }

    @Override
    public List<LocalPosGraficoDTO> countEgressoByPos() {
        return egressoTitulacaoRepository.countEgressoByPos();
    }

}
