package labes.facomp.ufpa.br.meuegresso.service.egresso.impl;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

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
    public EgressoModel adicionarEgresso(EgressoModel egresso) {
        return egressoRepository.save(egresso);
    }

    @Override
    public EgressoModel findByUsuarioId(Integer idUsuario) {
        return egressoRepository.findByUsuarioId(idUsuario).orElseThrow();
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
    public EgressoModel updateEgresso(EgressoModel egresso) {
        if (egresso.getId() != null) {
            egressoRepository.save(egresso);
        }
        return null;
    }


    @Override
    public void deleteById(Integer id) {
        egressoRepository.deleteById(id);

    }


    @Override
    public ResponseEntity<String> deletarEgresso(EgressoModel egresso) {
        if (egressoRepository.existsById(egresso.getId())) {
            egressoRepository.deleteById(egresso.getId());
            return ResponseEntity.ok("Egresso deletado");
        } else {
            return ResponseEntity.ok("Egresso nao encontrado");
        }
    }

    @Override
    public Boolean existsById(Integer id) {
        return egressoRepository.existsById(id);

    }

}
