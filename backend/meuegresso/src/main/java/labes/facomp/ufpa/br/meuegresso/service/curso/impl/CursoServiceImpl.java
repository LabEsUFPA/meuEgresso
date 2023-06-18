package labes.facomp.ufpa.br.meuegresso.service.curso.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.CursosGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.exceptions.InvalidRequestException;
import labes.facomp.ufpa.br.meuegresso.model.CursoModel;
import labes.facomp.ufpa.br.meuegresso.repository.curso.CursoRepository;
import labes.facomp.ufpa.br.meuegresso.service.curso.CursoService;
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
public class CursoServiceImpl implements CursoService {

    private final CursoRepository cursoRepository;

    @Override
    public boolean deleteById(Integer id) {
        if (cursoRepository.existsById(id)) {
            cursoRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<CursoModel> findAll() {
        return cursoRepository.findAll();
    }

    @Override
    public CursoModel findById(Integer id) {
        return cursoRepository.findById(id).orElseThrow();
    }

    @Override
    public CursoModel save(CursoModel cursoModel) {
        return cursoRepository.save(cursoModel);
    }

    @Override
    public CursoModel update(CursoModel curso) throws InvalidRequestException {
        if (curso.getId() != null) {
            return cursoRepository.save(curso);
        } else {
            throw new InvalidRequestException();
        }
    }

    @Override
    public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
        return cursoRepository.existsByIdAndCreatedById(id, createdBy);
    }

    @Override
    public CursoModel findByNome(String nome) {
        return cursoRepository.findByNomeIgnoreCase(nome).orElse(null);
    }

    @Override
    public List<CursosGraficoDTO> countEgressoByCurso() {
        return cursoRepository.countEgressoByCurso();
    }

}
