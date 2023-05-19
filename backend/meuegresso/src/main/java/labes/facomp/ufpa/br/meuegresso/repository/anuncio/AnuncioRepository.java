package labes.facomp.ufpa.br.meuegresso.repository.anuncio;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;

public interface AnuncioRepository extends CrudRepository<AnuncioModel, Integer>{

    List<AnuncioModel> findAll();

    boolean existsByIdAndCreatedById(Integer id, Integer createdBy);

    List<AnuncioModel> findByDataExpiracaoBeforeAndTituloContainsIgnoreCaseAndSalarioBetweenAndAreaEmpregoIn(LocalDate date, String titulo, Double salarioBase, Double salarioFinal, List<Integer> areaEmprego);

}
