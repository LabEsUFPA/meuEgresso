package labes.facomp.ufpa.br.meuegresso.repository.anuncio;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import labes.facomp.ufpa.br.meuegresso.model.AnuncioModel;

public interface AnuncioRepository extends CrudRepository<AnuncioModel, Integer> {

    List<AnuncioModel> findAll();

    boolean existsByIdAndCreatedById(Integer id, Integer createdBy);

    @Query(value = """
            select a
            from
                anuncio a
            where
                a.dataExpiracao >= now()
                and a.titulo ilike :tituloAnuncio
                and a.salario between :salarioMin and :salarioMax
                and (a.areaEmprego.id in (:areaEmpregoIds) or 0 in (:areaEmpregoIds))
                """)
    List<AnuncioModel> findBySearch(String tituloAnuncio, Double salarioMin, Double salarioMax,
            Integer[] areaEmpregoIds);

}
