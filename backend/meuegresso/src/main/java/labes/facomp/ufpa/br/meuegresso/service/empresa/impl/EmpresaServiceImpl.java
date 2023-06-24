package labes.facomp.ufpa.br.meuegresso.service.empresa.impl;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.LocalPosGraficoDTO;
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
    public Page<EmpresaModel> findAll(Integer page, Integer size, Direction direction) {
        return empresaRepository.findAll(PageRequest.of(page, size, Sort.by(direction, "nome")));
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
    public Page<EmpresaModel> findByNomeContainsIgnoreCaseOrderByNomeAsc(Integer page, Integer size,
            Direction direction,
            String nome) {
        return empresaRepository.findByNomeContainsIgnoreCaseOrderByNomeAsc(
                PageRequest.of(page, size, Sort.by(direction, "nome")), nome);
    }

    @Override
    public List<LocalPosGraficoDTO> countEgressoByPos() {
        return empresaRepository.countEgressoByPos();
    }

}