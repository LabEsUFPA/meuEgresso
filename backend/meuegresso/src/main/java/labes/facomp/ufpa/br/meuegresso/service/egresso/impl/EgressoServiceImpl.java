package labes.facomp.ufpa.br.meuegresso.service.egresso.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import lombok.RequiredArgsConstructor;

/**
 * Implementação do Serviço responsável pelas rotinas internas da aplicação
 * referente ao egresso.
 *
 * @author Joao Paulo
 * @since 16/04/2023
 * @version 1.0
 */
@Service
@RequiredArgsConstructor
public class EgressoServiceImpl implements EgressoService {

    private final EgressoRepository egressoRepository;

    @Override
    public EgressoModel save(EgressoModel egresso) {
        return egressoRepository.save(egresso);
    }

    @Override
    @Transactional
    public EgressoModel findByUsuarioId(Integer idUsuario) {
        return egressoRepository.findByUsuarioId(idUsuario).orElseThrow();
    }

    @Override
    public EgressoModel findById(Integer idEgresso) {
        return egressoRepository.findById(idEgresso).orElseThrow();
    }

    @Override
    public List<EgressoModel> findAll() {
        return egressoRepository.findAll();
    }

    /**
     *
     *
     * @param egresso Dados do egresso
     * @return Dados após serem gravados no banco de dados.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    @Override
    @Transactional
    public EgressoModel update(EgressoModel egresso) {
        if (egresso.getId() != null) {
            return egressoRepository.save(egresso);
        }
        return null;
    }

    @Override
    public boolean deleteById(Integer id) {
        if (egressoRepository.existsById(id)) {
            egressoRepository.deleteById(id);
            return true;
        }
        return false;

    }

    @Override
    public boolean deleteEgresso(EgressoModel egresso) {
        if (egressoRepository.existsById(egresso.getId())) {
            egressoRepository.deleteById(egresso.getId());
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean existsById(Integer id) {
        return egressoRepository.existsById(id);
    }

    @Override
    public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
        return egressoRepository.existsByIdAndCreatedById(id, createdBy);
    }

}
