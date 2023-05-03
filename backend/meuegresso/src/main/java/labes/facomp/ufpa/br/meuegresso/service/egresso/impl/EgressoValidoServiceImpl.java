package labes.facomp.ufpa.br.meuegresso.service.egresso.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.model.EgressoValidoModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoValidoRepository;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoValidoService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EgressoValidoServiceImpl implements EgressoValidoService {

    private final EgressoValidoRepository egressosValidosRepository;

    @Override
    public List<EgressoValidoModel> findAll() {
        return egressosValidosRepository.findAll();
    }

    @Override
    public Optional<EgressoValidoModel> findByEmail(String email) {
        return egressosValidosRepository.findByEmailIgnoreCase(email);
    }

    @Override
    public Optional<EgressoValidoModel> findByMatricula(String matricula) {
        return egressosValidosRepository.findByMatricula(matricula);
    }

    @Override
    public List<EgressoValidoModel> findByNomeIgnoreCase(String nome) {
        return egressosValidosRepository.findByNomeIgnoreCase(nome);
    }

}
